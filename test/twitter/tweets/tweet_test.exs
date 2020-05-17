defmodule Twitter.Tweets.TweetTest do
    use Twitter.DataCase, async: true

    alias Twitter.Tweets.Tweet

    describe "changeset" do

        test "all data is valid" do
            changeset = Tweet.changeset(%Tweet{}, %{ user_id: 1, text: "valid text" })
            assert changeset.errors == []
        end

        test "id is null" do
            changeset = Tweet.changeset(%Tweet{}, %{ user_id: nil, text: "valid text" })
            assert changeset.errors == [user_id: {"can't be blank", [validation: :required]}]
        end

        test "text is null" do
            changeset = Tweet.changeset(%Tweet{}, %{ user_id: 1, text: nil })
            assert changeset.errors == [text: {"can't be blank", [validation: :required]}]
        end

        test "all data is null" do
            changeset = Tweet.changeset(%Tweet{}, %{ user_id: nil, text: nil })
            assert changeset.errors == [text: {"can't be blank", [validation: :required]}, user_id: {"can't be blank", [validation: :required]}]
        end

    end

end
