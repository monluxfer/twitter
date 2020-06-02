defmodule Twitter.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: Twitter.Repo

  # without Ecto
  # use ExMachina

  def user_factory do
    %Twitter.Accounts.User{
      email: sequence(:email, &"email-#{&1}@example.com"),
      password_hash: "some password hash",
      username: "Jone Factory"
    }
  end

  # def article_factory do
  #   title = sequence(:title, &"Use ExMachina! (Part #{&1})")
  #   # derived attribute
  #   slug = Twitter.Article.title_to_slug(title)
  #   %Twitter.Article{
  #     title: title,
  #     slug: slug,
  #     # associations are inserted when you call `insert`
  #     author: build(:user),
  #   }
  # end

  # # derived factory
  # def featured_article_factory do
  #   struct!(
  #     article_factory(),
  #     %{
  #       featured: true,
  #     }
  #   )
  # end

  def tweet_factory do
    %Twitter.Tweets.Tweet{
      text: "It's great!",
      user_id: build(:user).id
    }
  end

  def reply_factory do
    %Twitter.Tweets.Tweet{
      text: "It's great!",
      user_id: build(:user).id,
      parent_id: build(:tweet).id
    }
  end

  def follower_factory do
    %Twitter.Accounts.Follower{
      user_id: build(:user).id,
      follower_id: build(:user).id
    }
  end

  def like_factory do
    %Twitter.Tweets.Like{
      tweet_id: build(:tweet).id,
      user_id: build(:user).id
    }
  end

end
