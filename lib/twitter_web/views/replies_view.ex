defmodule TwitterWeb.RepliesView do
    use TwitterWeb, :view

    def render("index.json", %{replies: replies}) do
        render_many(replies, __MODULE__, "show.json", as: :reply)
    end

    def render("show.json", %{reply: reply}) do
        %{
            id: reply.id,
            text: reply.text,
            inserted_at: reply.inserted_at
        }
    end

end
