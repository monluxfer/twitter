defmodule Twitter.Accounts.User do
  use Ecto.Schema

  import Ecto.Changeset

  @required [:email, :password_hash, :username]
  @optional [:name, :bio]

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true # нет в базе данных
    field :password_hash, :string
    field :username, :string
    field :name, :string
    field :bio, :string

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, @required ++ @optional) # проверяем поля
    |> validate_required(@required) # валидирование
  end
end
