defmodule Twitter.Accounts.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Twitter.Tweets.Tweet

  @required [:email, :password_hash, :username]
  @optional [:name, :bio]

  schema "users" do
    field :email, :string
    field :password_hash, :string
    field :username, :string
    field :name, :string
    field :bio, :string

    has_many :tweets, Tweet

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
  end
end
