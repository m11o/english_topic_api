class TopicHistoriesController < ApplicationController
  def index
    topic_histories = @user.topic_histories.order(created_at: :desc)

    render json: response_body(topic_histories)
  end

  def create
    topic = Topic.find_by! name: topic_history_params[:topic_name]
    topic_history = topic.topic_histories.new user: @user
    topic_history.content = topic_history_params[:content]
    topic_history.written_at = Time.zone.now
    topic_history.save!

    head :ok
  rescue => e
    Rails.logger.error e
    Rails.logger.error e.backtrace.join("\n")

    head :bad_request
  end

  private

  def response_body(topic_histories)
    topic_histories.map do |topic_history|
      topic = topic_history.topic

      { topic: topic.name, content: topic_history.content, written_at: topic_history.written_at }
    end
  end

  def topic_history_params
    params.require(:topic_history).permit(:topic_name, :content)
  end
end
