defmodule TwitterWeb.TweetsController do
    use TwitterWeb, :controller

    alias Twitter.Tweets

    def replies(conn, %{"id" => id}) do
        tweets = Tweets.replies_of_tweets(id)
        render(conn, "index.json", %{tweets: tweets})
    end

    def index(conn, _) do
        tweets = Tweets.recent_tweets()
        render(conn, "index.json", %{tweets: tweets})
    end

    def create(conn, params) do
        with {:ok, tweet} <- Tweets.create_tweet(params) do
            conn
            |> put_status(:created)
            |> render("show.json", %{tweet: tweet})
        end
    end

    def likes(conn, params) do
        with {:ok, like} <- Tweets.create_like(params) do
            conn
            |> put_status(:created)
            |> render("show_likes.json", %{like: like})
        end
    end

end
