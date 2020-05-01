defmodule Twitter.Accounts.UserQueries do
  # описание взаимодействия с базой

  alias Twitter.Repo
  alias Twitter.Accounts.User

  def create(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
