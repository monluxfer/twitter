defmodule Twitter.Accounts.UserTest do
    use Twitter.DataCase, async: true

    alias Twitter.Accounts.User

    describe "changeset" do

        # test "all data is valid" do
        #     changeset = User.changeset(%User{}, %{ email: "some@email", username: "some_username", password: "some_password", password_confirmation: "some_password" })
        #     assert changeset.errors == []
        # end

        test "email is null" do
            changeset = User.changeset(%User{}, %{ email: nil, username: "some_username", password: "some_password", password_confirmation: "some_password" })
            assert changeset.errors == [ email: {"can't be blank", [validation: :required]} ]
        end

        test "username is null" do
            changeset = User.changeset(%User{}, %{ email: "some@email", username: nil, password: "some_password", password_confirmation: "some_password" })
            assert changeset.errors == [ username: {"can't be blank", [validation: :required]} ]
        end

        test "password is null" do
            changeset = User.changeset(%User{}, %{ email: "some@email", username: "some_username", password: nil, password_confirmation: nil })
            assert changeset.errors == [ password: {"can't be blank", [validation: :required]}, password_confirmation: {"can't be blank", [validation: :required]} ]
        end

        test "password != password_confirmation" do
            changeset = User.changeset(%User{}, %{ email: "some@email", username: "some_username", password: "firstpass", password_confirmation: "secondpass" })
            assert changeset.errors == [ password_confirmation: {"does not match confirmation", [validation: :confirmation]} ]
        end

        test "all data is null" do
            changeset = User.changeset(%User{}, %{ email: nil, username: nil, password: nil, password_confirmation: nil })
            assert changeset.errors == [ email: {"can't be blank", [validation: :required]}, username: {"can't be blank",
            [validation: :required]}, password: {"can't be blank", [validation: :required]}, password_confirmation: {"can't be blank", [validation: :required]} ]
        end

    end

end
