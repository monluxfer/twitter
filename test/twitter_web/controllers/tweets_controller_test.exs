#defmodule TwitterWeb.TweetsControllerTest do
#    use TwitterWeb.ConnCase
#    use Twitter.DataCase
#
#    alias Twitter.Accounts
#
#    @valid_user_attrs %{email: "some_email", password_hash: "some_hash", username: "some_username"}
#
#    def user_fixture(attrs \\ %{}) do
#        {:ok, user} =
#            attrs
#            |> Enum.into(@valid_user_attrs)
#            |> Accounts.create_user()
#
#        user
#    end
#
#    setup %{conn: conn} do
#        user = user_fixture()
#        [conn: conn, user: user]
#    end
#
#    describe "create" do
#
#        test "creates a tweet", %{conn: conn} do
#            user = user_fixture()
#            attrs = %{user_id: user.id, text: "some text"}
#            conn = post(conn, Routes.users_path(conn, :create), attrs)
#            assert "some text" = json_response(conn, 201)["text"]
#        end
#
#    end
#end
