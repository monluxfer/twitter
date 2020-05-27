defmodule TwitterWeb.LikesController do
    use TwitterWeb, :controller

    alias Twitter.Likes

    def create(conn, params) do
        with {:ok, like} <- Likes.create_like(params) do
            conn
            |> put_status(:created)
            |> render("show.json", %{like: like})
        end
    end

end
