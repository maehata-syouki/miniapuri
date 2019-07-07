class Comment < ApplicationRecord
  def create
    Comment.create(text: params[:text], tweet_id: params[:tweet_id], user_id: current_user.id)
  end
end
