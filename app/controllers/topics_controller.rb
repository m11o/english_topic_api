class TopicsController < ApplicationController
  def show
    @topic = Topic.random.first
    render json: { category_name: @topic.category.name, topic: @topic.name }
  end
end
