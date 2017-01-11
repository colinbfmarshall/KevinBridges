class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :tag_cloud, only: [:index, :new]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all    
    
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    elsif params.present?
      @posts = Post.filter(params.slice(:treatment, :price, :location))
      @posts = @posts.hair_length("#{params["hair_length"]}") if params[:hair_length].present?
    end

    @posts = @posts.paginate(:page => params[:page], :per_page => 12)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    set_stylist
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @post.upvote_by current_user
    render action: 'show', :id => @post.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:stylist, :treatment, :price, :length, :comment, :picture, :user_id, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
    end

    def tag_cloud
      @tags = Post.tag_counts_on(:tags).order('count desc').limit(20)
    end

    def set_stylist
      @post.stylist = current_user.id if current_user.category == "Stylist"
    end
    
end
