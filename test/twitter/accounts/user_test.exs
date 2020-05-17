defmodule Twitter.Accounts.UserTest do
    use Twitter.DataCase, async: true

    alias Twitter.Accounts.User

    describe "changeset" do

        test "all data is valid" do
            changeset = User.changeset(%User{}, %{ email: "some_email", password_hash: "some_password_hash", username: "some_username" })
            assert changeset.errors == []
        end

        test "email is null" do
            changeset = User.changeset(%User{}, %{ email: nil, password_hash: "some_password_hash", username: "some_username" })
            assert changeset.errors == [email: {"can't be blank", [validation: :required]}]
        end

        test "password_hash is null" do
            changeset = User.changeset(%User{}, %{ email: "some_email", password_hash: nil, username: "some_username" })
            assert changeset.errors == [password_hash: {"can't be blank", [validation: :required]}]
        end

        test "username is null" do
            changeset = User.changeset(%User{}, %{ email: "some_email", password_hash: "some_password_hash", username: nil })
            assert changeset.errors == [username: {"can't be blank", [validation: :required]}]
        end

        test "all data is null" do
            changeset = User.changeset(%User{}, %{ email: nil, password_hash: nil, username: nil })
            assert changeset.errors == [email: {"can't be blank", [validation: :required]}, password_hash: {"can't be blank",
            [validation: :required]}, username: {"can't be blank", [validation: :required]}]
        end

    end

end
