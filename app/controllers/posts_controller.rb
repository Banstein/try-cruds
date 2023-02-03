class PostsController < ApplicationController
    before_action :log_request
    before_action :set_post, only: [:show, :update, :destroy]
  
    def index
      @posts = Post.all
      Rails.logger.info("Returning all posts")
      render json: @posts
    end
  
    def show
      render json: @post
    end
  
    def create
      @post = Post.new(post_params)
  
      if @post.save
        render json: @post, status: :created, location: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @post.destroy
    end
  
    private
      def set_post
        @post = Post.find(params[:id])
      end
  
      def post_params
        params.require(:post).permit(:title, :body)
      end

      def log_request
        Rails.logger.info("Received request for #{params[:action]} action on PostsController")
      end
  end
  