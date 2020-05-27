defmodule Twitter.Likes.Like do
    use Ecto.Schema

    import Ecto.Changeset

    alias Twitter.Accounts.User
    alias Twitter.Tweets.Tweet

    @required [:tweet_id, :user_id]

    schema "likes" do
        belongs_to :tweet, Tweet
        belongs_to :user, User

        timestamps()
    end

    def changeset(like, attrs) do
        like
	    |> cast(attrs, @required)
	    |> validate_required(@required)
    end
end
