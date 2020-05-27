defmodule Twitter.Likes do
    alias Twitter.Likes.LikeQueries

    def create_like(attrs), do: LikeQueries.create(attrs)
end
