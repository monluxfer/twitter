defmodule Twitter.Accounts do
    alias Twitter.Accounts.UserQueries

    def create_user(attrs), do: UserQueries.create(attrs)
    def get_user(id), do: UserQueries.get(id)
end
