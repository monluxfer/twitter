defmodule Twitter.Accounts.Follower do
    use Ecto.Schema

    import Ecto.Changeset

    alias Twitter.Accounts.User

    @required [:user_id, :follower_id]

    schema "followers" do
        belongs_to :user, User
        belongs_to :follower, User

        timestamps()
    end

    def changeset(follow, attrs) do
        follow
	    |> cast(attrs, @required)
        |> validate_required(@required)
    end

end
