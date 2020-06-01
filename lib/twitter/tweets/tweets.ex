defmodule Twitter.Tweets do
    alias Twitter.Tweets.TweetQueries
    alias Twitter.Tweets.LikeQueries

    def create_tweet(attrs), do: TweetQueries.create(attrs)
    def recent_tweets(), do: TweetQueries.recent()
    def replies_of_tweets(id), do: TweetQueries.replies(id)
    def rated_tweets(user_id), do: LikeQueries.rated(user_id)
    def create_like(attrs), do: LikeQueries.create(attrs)
    def tweets_feed(user_id), do: TweetQueries.feed(user_id)
    def following_likes(user_id), do: TweetQueries.follow_likes(user_id)
end
