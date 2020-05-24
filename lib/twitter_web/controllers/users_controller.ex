defmodule TwitterWeb.UsersController do
    use TwitterWeb, :controller

    alias Twitter.Accounts
    alias Twitter.Accounts.User
    alias Twitter.Guardian

    def create(conn, params) do
        with{:ok,  %User{} = user} <- Accounts.create_user(params),
            {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
                conn
                |> put_status(:created)
                |> render("jwt.json", jwt: token)
        end
    end
end
