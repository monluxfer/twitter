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

    def render("follow.json", %{follow: follow}) do
        %{
            user_id: follow.user_id,
            follower_id: follow.follower_id
        }
        end

end
