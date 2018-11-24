class UserTopicsController < ApplicationController
  before_action :set_user_topic, only: [:show, :update, :destroy]

  # GET /user_topics
  # GET /user_topics.json
  def index
    @user_topics = UserTopic.all
  end

  # GET /user_topics/1
  # GET /user_topics/1.json
  def show
    render json: @user_topic
  end

  # POST /user_topics
  # POST /user_topics.json
  def create
    @user_topic = UserTopic.new(user_topic_params)

    if @user_topic.save
      render json: @user_topic
    else
      render json: @user_topic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_topics/1
  # PATCH/PUT /user_topics/1.json
  def update
    if @user_topic.update(user_topic_params)
      render :show, status: :ok, location: @user_topic
    else
      render json: @user_topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_topics/1
  # DELETE /user_topics/1.json
  def destroy
    @user_topic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_topic
      @user_topic = UserTopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_topic_params
      params.require(:user_topic).permit(:user_id, :topic_id)
    end
end
