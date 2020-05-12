defmodule Twitter.Tweets do
  alias Twitter.Tweets.TweetQueries

  def create_tweet(attrs), do: TweetQueries.create(attrs)
  def recent_tweets(), do: TweetQueries.recent()
  def tweetreplies(id), do: TweetQueries.repl(id)
end
