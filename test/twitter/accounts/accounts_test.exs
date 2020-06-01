defmodule Twitter.AccountsTest do
    use Twitter.DataCase

    alias Twitter.Accounts

    describe "users" do

        @valid_attrs %{email: "some@email", username: "some_username", password: "password", password_confirmation: "password"}

        def user_fixture(attrs \\ %{}) do
            {:ok, user} =
                attrs
                |> Enum.into(@valid_attrs)
                |> Accounts.create_user()

            user
        end

        test "create_user with valid data creates a user" do
            user = user_fixture()
            assert user.email == "some@email"
            assert user.username == "some_username"
        end

    end
end
