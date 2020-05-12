defmodule Twitter.Repo.Migrations.CreateReplies do
  use Ecto.Migration

    def change do
        create table :replies do
            add :text, :string, null: false
            add :user_id, references(:users, on_delete: :delete_all)
            add :tweet_id, references(:tweets, on_delete: :delete_all)

            timestamps()
        end
    end
end
