defmodule Twitter.Accounts.FollowerQueries do

    alias Twitter.Repo
    alias Twitter.Accounts.Follower

    def create(attrs \\ %{}) do
        %Follower{}
        |> Follower.changeset(attrs)
        |> Repo.insert()
    end

end
