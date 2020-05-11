defmodule Twitter.Tweets.Tweet do
    use Ecto.Schema

    import Ecto.Changeset

    alias Twitter.Accounts.User
    alias Twitter.Replies.Reply

    @required [:text, :user_id]
    @optional []

    schema "tweets" do
	    field :text, :string

    belongs_to :user, User
    has_many :replies, Reply

	timestamps()
    end

    def changeset(tweet, attrs) do
        tweet
	    |> cast(attrs, @required ++ @optional)
	    |> validate_required(@required)
    end
end
