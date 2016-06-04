# Topic Controller: All users can see topics
class TopicsController < OpenReadController
  before_action :set_topic, only: [:show]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all

    render json: @topics
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    render json: @topic
  end

  def randomshow
    @topics_array = Topic.all
    @random_topic = @topics_array.sample

    @section = @random_topic.category
    render json: @random_topic
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      render json: @topic, status: :created, location: @topic
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    @topic = Topic.find(params[:id])

    if @topic.update(topic_params)
      head :no_content
    else
      render json: @topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy

    head :no_content
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:content, :category)
  end
end
