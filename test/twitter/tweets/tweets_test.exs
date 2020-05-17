defmodule Twitter.TweetsTest do
    use Twitter.DataCase

    alias Twitter.Tweets
    alias Twitter.Accounts

    describe "tweets" do

        @valid_user_attrs %{email: "some_email", password_hash: "some_hash", username: "some_username"}

        def user_fixture(attrs \\ %{}) do
            {:ok, user} =
                attrs
                |> Enum.into(@valid_user_attrs)
                |> Accounts.create_user()

            user
        end

        def tweet_fixture(user) do
            attrs = %{ user_id: user.id, text: "some text" }

            {:ok, tweet} =
                attrs
                |> Enum.into(attrs)
                |> Tweets.create_tweet()

            tweet
        end

        def reply_fixture(tweet) do
            attrs = %{ user_id: tweet.user_id, text: "some text", parent_id: tweet.id }

            {:ok, reply} =
                attrs
                |> Enum.into(attrs)
                |> Tweets.create_tweet()

            reply
        end

        test "recent_tweets returns all tweets" do
            user = user_fixture()
            tweet = tweet_fixture(user)
            assert Tweets.recent_tweets() == [tweet]
        end

        test "create_tweet with valid data creates a post" do
            user = user_fixture()
            tweet = tweet_fixture(user)
            assert tweet.text == "some text"
        end

        test "replies_of_tweets returns all replies" do
            user = user_fixture()
            tweet = tweet_fixture(user)
            reply = reply_fixture(tweet)
            assert Tweets.replies_of_tweets(tweet.id) == [reply]
        end
    end

end
