defmodule TwitterWeb.TweetsControllerTest do
    use TwitterWeb.ConnCase

    import Twitter.Factory

    describe "index" do

        test "lists all tweets", %{conn: conn} do
            tweet = insert(:tweet)
            conn = get(conn, Routes.tweets_path(conn, :index))

            assert tweet.id  == Enum.at(json_response(conn, 200), 0)["id"]
            assert tweet.text  == Enum.at(json_response(conn, 200), 0)["text"]
        end

    end

    describe "create" do

        test "creates a tweet", %{conn: conn} do
            user = insert(:user)
            attrs = %{ text: "some text", user_id: user.id }
            conn = post(conn, Routes.tweets_path(conn, :create), attrs)

            assert "some text" == json_response(conn, 201)["text"]
        end

    end

    describe "replies" do

        test "lists all replies, but there is zero replies", %{conn: conn} do
            tweet = insert(:tweet)
            conn = get(conn, Routes.tweets_path(conn, :replies, tweet.id))

            assert [] == json_response(conn, 200)
        end

        test "lists all replies", %{conn: conn} do
            tweet = insert(:tweet)
            reply = insert(:reply, parent_id: tweet.id)
            conn = get(conn, Routes.tweets_path(conn, :replies, tweet.id))

            assert reply.parent_id == Enum.at(json_response(conn, 200), 0)["parent_id"]
        end

    end

    describe "feed" do

        test "list all feed, but user is not following anyone", %{conn: conn} do
            user = insert(:user)
            conn = get(conn, Routes.tweets_path(conn, :feed, user.id))

            assert [] == json_response(conn, 200)
        end

        test "list all feed", %{conn: conn} do
            user = insert(:user)
            user2 = insert(:user)
            follower = insert(:follower, user_id: user.id, follower_id: user2.id)
            _tweet = insert(:tweet, user_id: user.id)
            conn = get(conn, Routes.tweets_path(conn, :feed, follower.follower_id))

            assert "It's great!" == Enum.at(json_response(conn, 200), 0)["text"]
        end

    end

    describe "following_likes" do

        test "list all likes, but user is not following anyone", %{conn: conn} do
            user = insert(:user)
            conn = get(conn, Routes.tweets_path(conn, :following_likes, user.id))

            assert [] == json_response(conn, 200)
        end

        test "list all likes", %{conn: conn} do
            follower = insert(:user)
            user = insert(:user)
            _following = insert(:follower, user_id: user.id, follower_id: follower.id)

            tweet = insert(:tweet, user_id: user.id)
            _like = insert(:like, user_id: user.id, tweet_id: tweet.id)
            conn = get(conn, Routes.tweets_path(conn, :following_likes, follower.id))

            assert "It's great!" == Enum.at(json_response(conn, 200), 0)["text"]
        end


    end

end
