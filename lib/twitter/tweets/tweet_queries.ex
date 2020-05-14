defmodule Twitter.Tweets.TweetQueries do

    alias Twitter.Repo
    alias Twitter.Tweets.Tweet

    import Ecto.Query

    def replies(id) do
        query = from(
            reply in Tweet,
            where: reply.parent_id == ^id
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