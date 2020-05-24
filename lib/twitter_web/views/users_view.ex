defmodule TwitterWeb.UsersView do
    use TwitterWeb, :view

    # def render("show.json", %{user: user}) do
    #     %{
    #         email: user.email,
    #         username: user.username,
    #         password_hash: user.password_hash
    #     }
    # end

    def render("jwt.json", %{jwt: jwt}) do
        %{jwt: jwt}
    end

end
