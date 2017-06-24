class TopicsController < ApplicationController
  def index
  end
  
  def index
    @topics = Topic.all
    render :index
  end

  def show
    @topic = Topic.find(params[:id])
    render :show
  end

  def new
    @topic = Topic.new
    render :new
  end

  
  def create
    @topic = Topic.new
    @topic.title = params[:topic][:title]
    @topic.user_id = current_user.id
    
    if @topic.save
       flash[:notice] = "The topic was saved!!!"
       redirect_to topic_path(@topic.id)
    else
       flash.now[:alert] = "There was an error saving the registered application. Please try again."
       render :new
      
    end
  end

  def edit
  end
end
