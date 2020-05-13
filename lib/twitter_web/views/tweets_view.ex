defmodule TwitterWeb.TweetsView do
    use TwitterWeb, :view

    def render("replies.json", %{replies: replies}) do
        render_many(replies, __MODULE__, "show.json", as: :tweet)
    end

    def render("index.json", %{tweets: tweets}) do
        render_many(tweets, __MODULE__, "show.json", as: :tweet)
    end

    def render("show.json", %{tweet: tweet}) do
    %{
        id: tweet.id,
        text: tweet.text,
        user_id: tweet.user_id,
        parent_id: tweet.parent_id,
        inserted_at: tweet.inserted_at
    }
    end
end
