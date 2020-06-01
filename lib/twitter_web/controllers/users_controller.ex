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

    def sign_in(conn, %{"email" => email, "password" => password}) do
        case Accounts.token_sign_in(email, password) do
            {:ok, token, _claims} ->
                conn |> render("jwt.json", jwt: token)
            _ ->
                {:error, :unauthorized}
        end
    end

    def show(conn, _params) do
        user = Guardian.Plug.current_resource(conn) |> Enum.at(0)
        conn
        |> render("user.json", user: user)
    end

    def follow(conn, params) do
        with {:ok, follow} <- Accounts.create_follow(params) do
            conn
            |> put_status(:created)
            |> render("follow.json", %{follow: follow})
        end
    end

end
