defmodule Twitter.Tweets.LikeQueries do

    alias Twitter.Repo
    alias Twitter.Tweets.Like
    alias Twitter.Tweets.Tweet

    import Ecto.Query

    def create(attrs \\ %{}) do
        %Like{}
        |> Like.changeset(attrs)
        |> Repo.insert()
    end

    def rated(id) do
        query = from(
            tweet in Tweet,
            join: like in Like,
            where: (like.user_id == ^id) and (tweet.id == ^id)
        )
        Repo.all(query)
    end

end
