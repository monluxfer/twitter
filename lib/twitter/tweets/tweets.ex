defmodule Twitter.Tweets do
    alias Twitter.Tweets.TweetQueries
    alias Twitter.Tweets.LikeQueries

    def create_tweet(attrs), do: TweetQueries.create(attrs)
    def recent_tweets(), do: TweetQueries.recent()
    def replies_of_tweets(id), do: TweetQueries.replies(id)
    def rated_tweets(id), do: LikeQueries.rated(id)
    def create_like(attrs), do: LikeQueries.create(attrs)
end
