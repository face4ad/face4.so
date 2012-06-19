class PostsController < ApplicationController
  # Go to the posts list of the specified user
  # GET /posts
  # GET /posts.json
  # /:id/posts
  def index
    user = User.find(params[:id])
    @posts = user.posts.order("updated_at desc")
    @categories = user.get_or_create_root_cat.descendants.arrange(:order => :created_at)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # Got the posts list of the special user and specified category
  # /:id/:cat_id/posts
  def category
    user = User.find(params[:id])
    @category = Category.find(params[:cat_id])
    @posts = @category.posts
    @categories = user.get_or_create_root_cat.descendants.arrange(:order => :created_at)
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @categories = current_user.get_or_create_root_cat.descendants.arrange(:order => :created_at) 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @categories = current_user.get_or_create_root_cat.descendants.arrange(:order => :created_at) 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    #TODO hardcode 0, 0 means the uid of the user
    @categories = current_user.get_or_create_root_cat.descendants.arrange(:order => :created_at) 
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to user_posts_path(current_user) }
      format.json { head :no_content }
    end
  end
end
