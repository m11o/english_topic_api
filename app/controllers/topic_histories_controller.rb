class TopicHistoriesController < ApplicationController
  def index
    topic_histories = @user.topic_histories.order(created_at: :desc)

    render json: response_body(topic_histories)
  end

  private

  def response_body(topic_histories)
    topic_histories.map do |topic_history|
      topic = topic_history.topic

      { topic: topic.name, content: topic_history.content, written_at: topic_history.written_at }
    end
  end
end
