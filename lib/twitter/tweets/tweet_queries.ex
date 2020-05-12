defmodule Twitter.Tweets.TweetQueries do

    alias Twitter.Repo
    alias Twitter.Tweets.Tweet
    alias Twitter.Replies.Reply

    import Ecto.Query

    def repl(id) do
        query = from(
            reply in Reply,
            where: reply.tweet_id == ^id,
        )
        Repo.all(query)
    end

    def create(attrs \\ %{}) do
        %Tweet{}
        |> Tweet.changeset(attrs)
        |> Repo.insert()
    end

    def recent() do
        query = from(
            tweet in Tweet,
            order_by: [desc: tweet.inserted_at]
        )
        Repo.all(query)
    end
end
