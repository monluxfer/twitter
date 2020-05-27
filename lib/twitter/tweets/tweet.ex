defmodule Twitter.Tweets.Tweet do
    use Ecto.Schema

    import Ecto.Changeset

    alias Twitter.Accounts.User
    alias Twitter.Tweets.Like

    @required [:text, :user_id]
    @optional [:parent_id]

    schema "tweets" do
        field :text, :string
        field :parent_id, :integer

    belongs_to :user, User
    has_many :likes, Like

	timestamps()
    end

    def changeset(tweet, attrs) do
        tweet
	    |> cast(attrs, @required ++ @optional)
	    |> validate_required(@required)
    end
end
