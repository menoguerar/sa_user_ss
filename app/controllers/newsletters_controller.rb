class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:show, :update, :destroy]

  # GET /newsletters
  # GET /newsletters.json
  def index
    @newsletters = Newsletter.all
    render json: @newsletters
  end

  def index2
    @newsletters = Newsletter.all

    json = { :newsletters => @newsletters, }.to_json(:include =>:topics,root: false)
   
    render json: json
  end

  
  # GET /newsletters/1
  # GET /newsletters/1.json
  def show
    render json: @newsletter
  end

  # POST /newsletters
  # POST /newsletters.json
  def create
    @newsletter = Newsletter.new(newsletter_params)

    if @newsletter.save
      @topics=params[:topics]
      @topics.each do |this_topic| 
        NewsletterTopic.create(:newsletter_id => @newsletter.id, :topic_id => this_topic)
      end
      render :show, status: :created, location: @newsletter
    else
      render json: @newsletter.errors, status: :unprocessable_entity
    end

    create_newsletter = CreateNewsletter.new

    create_newsletter.subscribe(UserAlerter.new)
       
    create_newsletter.call(@newsletter.id,params[:topics])
  end

  # PATCH/PUT /newsletters/1
  # PATCH/PUT /newsletters/1.json
  def update
    if @newsletter.update(newsletter_params)
      render :show, status: :ok, location: @newsletter
    else
      render json: @newsletter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /newsletters/1
  # DELETE /newsletters/1.json
  def destroy
    @newsletter.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter
      @newsletter = Newsletter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_params
      params.require(:newsletter).permit(:title, :description, :topics, :url_to_image)
    end

 
end
