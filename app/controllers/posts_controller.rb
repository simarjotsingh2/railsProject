class PostsController < ApplicationController
  def index
    @posts = if params[:search]
      Post.where("title LIKE ?", "%#{params[:search]}%").paginate(page: params[:page], per_page: 10)
    else
      Post.paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
