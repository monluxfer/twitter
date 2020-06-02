defmodule TwitterWeb.UsersControllerTest do
    use TwitterWeb.ConnCase

    import Twitter.Factory

    describe "create" do

        test "creates a user", %{conn: conn} do
            attrs = %{email: "some@email", username: "some_username", password: "password", password_confirmation: "password"}
            conn = post(conn, Routes.users_path(conn, :create), attrs)
            IO.puts(json_response(conn, 201)["jwt"])
        end

        test "creates a follower", %{conn: conn} do
            user1 = insert(:user)
            user2 = insert(:user)
            attrs = %{ follower_id: user1.id, user_id: user2.id }

            conn = post(conn, Routes.users_path(conn, :follow), attrs)
            assert user2.id == json_response(conn, 201)["user_id"]
        end

    end

end
