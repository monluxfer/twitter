defmodule Twitter.Accounts.UserQueries do

    alias Twitter.Repo
    alias Twitter.Accounts.User

    import Ecto.Query

    def create(attrs \\ %{}) do
        %User{}
        |> User.changeset(attrs)
        |> Repo.insert()
    end

    def get(id) do
        query = from(
            user in User,
            where: user.id == ^id
        )
        Repo.all(query)
    end

end
