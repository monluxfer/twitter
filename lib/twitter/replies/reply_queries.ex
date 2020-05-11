defmodule Twitter.Replies.ReplyQueries do

    alias Twitter.Repo
    alias Twitter.Replies.Reply

    import Ecto.Query

    def create(attrs \\ %{}) do
        %Reply{}
            |> Reply.changeset(attrs)
            |> Repo.insert()
    end

    def recent() do
        query = from reply in Reply, order_by: [desc: reply.inserted_at]
        Repo.all(query)
    end
end
