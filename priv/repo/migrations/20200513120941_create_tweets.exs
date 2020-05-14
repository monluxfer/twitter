defmodule Twitter.Repo.Migrations.CreateTweets do
    use Ecto.Migration

    def change do
        create table :tweets do
            add :user_id, references(:users, on_delete: :delete_all)
            add :text, :string, null: false
            add :parent_id, references(:tweets, on_delete: :delete_all)

        timestamps()
        end
    end
end
