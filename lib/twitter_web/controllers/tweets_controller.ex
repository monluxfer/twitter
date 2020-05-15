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
            render(conn, "show.json", %{tweet: tweet})
        end
    end
end
