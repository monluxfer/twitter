defmodule Twitter.Tweets.TweetQueries do

    alias Twitter.Repo
    alias Twitter.Tweets.Tweet
    alias Twitter.Accounts.Follower
    alias Twitter.Tweets.Like

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

    def feed(user_id) do
        query = from(
            tweet in Tweet,
            join: follower in Follower,
            where: (follower.follower_id == ^user_id) and (follower.user_id == tweet.user_id),
            order_by: [desc: tweet.inserted_at]
        )
        Repo.all(query)
    end

    def follow_likes(user_id) do
        query = from(
            tweet in Tweet,
            join: follower in Follower,
            join: like in Like,
            where: (follower.follower_id == ^user_id) and (like.user_id == follower.user_id),
            order_by: [desc: tweet.inserted_at]
        )
        Repo.all(query)
    end
end
