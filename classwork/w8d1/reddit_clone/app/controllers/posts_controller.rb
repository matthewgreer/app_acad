class PostsController < ApplicationController
    before_action :require_logged_in!, only: [:create, :edit, :update, :destroy, :new]
    before_action :require_ownership, only: [:edit, :update]

    def new
      @post = Post.new
      render :new
    end

    def create
      @post = Post.new(post_params)
      @post.author_id = current_user.id
      @post.save
    end

    def show
      @post = Post.find(params[:id])
      render :show
    end

    def edit
      @post = Post.find(params[:id])
      render :edit
    end

    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to post_url(@post)
      else
        flash.now[:errors] = @post.errors.full_messages
        render :edit
      end
    end

    def destroy
      @post = Post.find(params[:id])
      if @post 
        @post.delete
      else
        flash[:errors] = @post.errors.full_messages
        redirect_to sub_url(@post)
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :url, :content, sub_ids: [])
    end

end
