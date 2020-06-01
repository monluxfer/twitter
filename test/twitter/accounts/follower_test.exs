defmodule Twitter.Accounts.FollowerTest do
    use Twitter.DataCase, async: true

    alias Twitter.Accounts.Follower

    describe "changeset" do

        test "all data is valid" do
            changeset = Follower.changeset(%Follower{}, %{ user_id: "1", follower_id: "1" })
            assert changeset.errors == []
        end

        test "user_id is invalid data" do
            changeset = Follower.changeset(%Follower{}, %{ user_id: "test", follower_id: "1" })
            assert changeset.errors == [user_id: {"is invalid", [type: :id, validation: :cast]}]
        end

        test "follower_id is invalid data" do
            changeset = Follower.changeset(%Follower{}, %{ user_id: "1", follower_id: "test" })
            assert changeset.errors == [follower_id: {"is invalid", [type: :id, validation: :cast]}]
        end

        test "all data is invalid" do
            changeset = Follower.changeset(%Follower{}, %{ user_id: "test", follower_id: "test" })
            assert changeset.errors == [user_id: {"is invalid", [type: :id, validation: :cast]}, follower_id: {"is invalid", [type: :id, validation: :cast]}]
        end

        test "user_id is null" do
            changeset = Follower.changeset(%Follower{}, %{ user_id: nil, follower_id: "1" })
            assert changeset.errors == [user_id: {"can't be blank", [validation: :required]}]
        end

        test "follower_id is null" do
            changeset = Follower.changeset(%Follower{}, %{ user_id: "1", follower_id: nil })
            assert changeset.errors == [follower_id: {"can't be blank", [validation: :required]}]
        end

        test "all data is null" do
            changeset = Follower.changeset(%Follower{}, %{ user_id: nil, follower_id: nil })
            assert changeset.errors == [user_id: {"can't be blank", [validation: :required]}, follower_id: {"can't be blank", [validation: :required]}]
        end

    end

end
