defmodule TwitterWeb.LikesView do
    use TwitterWeb, :view

    def render("show.json", %{like: like}) do
    %{
        tweet_id: like.tweet_id,
        user_id: like.user_id,
        inserted_at: like.inserted_at
    }
    end

end
