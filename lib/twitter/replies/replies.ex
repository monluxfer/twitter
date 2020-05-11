defmodule Twitter.Replies do
    alias Twitter.Replies.ReplyQueries

    def create_reply(attrs), do: ReplyQueries.create(attrs)
    def recent_replies(), do: ReplyQueries.recent()
end
