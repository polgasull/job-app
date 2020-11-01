# frozen_string_literal: true

module Blog
  class PostsController < Blog::BlogController
    before_action :set_post, only: [:show, :update, :edit, :destroy]
    before_action :validate_is_admin!, except: [:index, :show]

    def index
      @posts = Post.all.order("created_at DESC")
      @last_jobs = Job.not_expired.order('created_at DESC').take(10);
      @last_blog_posts = Post.all.order('created_at DESC').take(3);
    end 

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)

      if @post.save
        redirect_to_response(t('posts.messages.post_created'), blog_post_path(@post)) 
      else 
        redirect_to_response(t('posts.messages.post_created'), blog_posts_path) 
      end
    end

    def show
      @last_jobs = Job.not_expired.order('created_at DESC').take(10);
      @last_blog_posts = Post.all.order('created_at DESC').take(3);
      @post_comments = @post.comments.order('created_at DESC');
    end 

    def update
      if @post.update(post_params)
        redirect_to_response(t('posts.messages.post_updated'), blog_post_path(@post))
      else
        redirect_back_response(t('posts.messages.post_not_updated'), false)
      end 
    end

    def edit
    end

    def destroy
      @post.destroy

      redirect_to_response(t('posts.messages.post_deleted'), blog_posts_path)
    end

    private

    def post_params
      params.require(:post).permit(:title, :description, :image, :custom_url, :meta_title, :meta_description)
    end

    def set_post
      @post = Post.friendly.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to controller: :errors, action: :not_found
    end
  end
end