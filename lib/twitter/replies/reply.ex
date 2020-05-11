defmodule Twitter.Replies.Reply do
    use Ecto.Schema

    import Ecto.Changeset

    alias Twitter.Accounts.User
    alias Twitter.Tweets.Tweet

    @required [:text, :user_id]
    @optional []

    schema "replies" do
        field :text, :string

        belongs_to :user, User
        belongs_to :tweet, Tweet

        timestamps()
    end

    def changeset(reply, attrs) do
        reply
	    |> cast(attrs, @required ++ @optional)
	    |> validate_required(@required)
    end
end
