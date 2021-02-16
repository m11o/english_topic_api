class TopicsController < ApplicationController
  def show
    already_written_topic = TopicHistory.where(user: @user).pluck(:topic_id)
    @topic = Topic.where.not(id: already_written_topic).random.first
    render json: { category_name: @topic.category.name, topic: @topic.name }
  end
end
