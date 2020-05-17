defmodule TwitterWeb.UsersControllerTest do
    use TwitterWeb.ConnCase

    #@create_user %{email: "some_email", password_hash: "some_hash", username: "some_username"}

    #def fixture(:user) do
    #    {:ok, user} = Accounts.create_user(@create_user)
    #    user
    #end

    describe "create" do

        test "creates a user", %{conn: conn} do
            attrs = %{email: "some_email", password_hash: "some_hash", username: "some_username"}
            conn = post(conn, Routes.users_path(conn, :create), attrs)
            assert "some_email" = json_response(conn, 201)["email"]
        end

    end

end
