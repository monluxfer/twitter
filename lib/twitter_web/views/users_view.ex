defmodule TwitterWeb.UsersView do
    use TwitterWeb, :view

    def render("user.json", %{user: user}) do
    %{
        id: user.id,
        username: user.username,
        password_hash: user.password_hash
    }
    end

    def render("jwt.json", %{jwt: jwt}) do
    %{
        jwt: jwt
    }
    end

end
