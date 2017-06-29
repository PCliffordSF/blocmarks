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
  
  def destroy
      @topic = Topic.find(params[:id])
 
     if @topic.destroy
       flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the topic."
       render :show
     end
  end
  
  def destroy_bookmark 

    @bookmark = Bookmark.find(params[:bookmark_id])
     authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to topic_path(params[:id])
    else
      flash.now[:alert] = "There was an error deleting the topic."
      redirect_to topic_path(params[:id])
    end
    
  end
  
end
