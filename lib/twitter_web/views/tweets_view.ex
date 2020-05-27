defmodule TwitterWeb.TweetsView do
    use TwitterWeb, :view

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

    def render("show_likes.json", %{like: like}) do
        %{
            tweet_id: like.tweet_id,
            user_id: like.user_id,
            inserted_at: like.inserted_at
        }
        end

end
