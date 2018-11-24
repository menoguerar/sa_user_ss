class NewsletterTopicsController < ApplicationController
  before_action :set_newsletter_topic, only: [:show, :update, :destroy]

  # GET /newsletter_topics
  # GET /newsletter_topics.json
  def index
    @newsletter_topics = NewsletterTopic.all
  end

  # GET /newsletter_topics/1
  # GET /newsletter_topics/1.json
  def show
  end

  # POST /newsletter_topics
  # POST /newsletter_topics.json
  def create
    @newsletter_topic = NewsletterTopic.new(newsletter_topic_params)

    if @newsletter_topic.save
      render :show, status: :created, location: @newsletter_topic
    else
      render json: @newsletter_topic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /newsletter_topics/1
  # PATCH/PUT /newsletter_topics/1.json
  def update
    if @newsletter_topic.update(newsletter_topic_params)
      render :show, status: :ok, location: @newsletter_topic
    else
      render json: @newsletter_topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /newsletter_topics/1
  # DELETE /newsletter_topics/1.json
  def destroy
    @newsletter_topic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter_topic
      @newsletter_topic = NewsletterTopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_topic_params
      params.require(:newsletter_topic).permit(:newsletter_id, :topic_id)
    end
end
