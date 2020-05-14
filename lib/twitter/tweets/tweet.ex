defmodule Twitter.Tweets.Tweet do
    @moduledoc """
    Tweet module
    """

    use Ecto.Schema

    import Ecto.Changeset

    alias Twitter.Accounts.User

    @required [:text, :user_id]
    @optional [:parent_id]

    schema "tweets" do
        field :text, :string
        field :parent_id, :integer

    belongs_to :user, User

	timestamps()
    end

    @doc """
    Casting and valildation
    """
    def changeset(tweet, attrs) do
        tweet
	    |> cast(attrs, @required ++ @optional)
	    |> validate_required(@required)
    end
end
