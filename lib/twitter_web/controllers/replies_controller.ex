defmodule TwitterWeb.RepliesController do
    use TwitterWeb, :controller

    alias Twitter.Replies

    def index(conn, _) do
        replies = Replies.recent_replies()
        render(conn, "index.json", %{replies: replies})
    end

    def create(conn, params) do
        with {:ok, reply} <- Replies.create_reply(params) do
            render(conn, "show.json", %{reply: reply})
        end
    end
end
