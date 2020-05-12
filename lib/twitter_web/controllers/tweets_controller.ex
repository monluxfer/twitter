defmodule TwitterWeb.TweetsController do
    use TwitterWeb, :controller

    alias Twitter.Tweets

    def tweetreplies(conn, %{"id" => id}) do
        replies = Tweets.tweetreplies(id)
        render(conn, "tweetreplies.json", %{replies: replies})
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
