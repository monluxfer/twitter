defmodule Twitter.Tweets.LikeQueries do

    alias Twitter.Repo
    alias Twitter.Tweets.Like

    def create(attrs \\ %{}) do
        %Like{}
        |> Like.changeset(attrs)
        |> Repo.insert()
    end

end
