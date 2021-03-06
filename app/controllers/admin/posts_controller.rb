class Admin::PostsController < Admin:AdminController
  
  before_action :set_post, only: [:edit, :update, :destroy]



  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: t('.created')
    else
      flash.now[:danger] = t('.notcreated')
      render :new
    end

  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: t('.updated')
    else
      flash.now[:danger] = t('.notupdated')
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, info: t('.deleted')

  end

  private

  def set_post
    @post = Post.find(params[:id])

  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :category_id, :all_tags)

  end




end
