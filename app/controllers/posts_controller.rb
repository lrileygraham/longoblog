class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]

    def index
      @posts = Post.includes(:comments).order("created_at desc").limit(1).offset(1)
    end

    def index
      @posts = Post.all.order('created_at DESC')
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      @post.save
      if @post.save
        redirect_to @post
      else
        render 'new'
      end
    end

    def show
      @post = Post.find(params[:id])
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      if @post.update(params[:post].permit(:image))
        redirect_to @post
      else
        render 'edit'
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy

        redirect_to root_path
    end

    private
    def post_params
      params.require(:post).permit(:title, :body, :image)
    end
end
