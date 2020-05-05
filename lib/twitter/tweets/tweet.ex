defmodule Twitter.Tweets.Tweet do
    use Ecto.Schema

    alias Twitter.Accounts.User

    schema "tweets" do
        field :text, string

        belongs_to: :user, User

        timestamps()
    end

end
