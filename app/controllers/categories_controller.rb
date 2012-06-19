class CategoriesController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:new,:create,:update,:destory]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end


  # PUT/POST /categories/cmd
  def cmd
    cmd = params[:cmd].strip
    items = cmd.split(" ")
    if items[0] == "mkdir"
      folders = items[1].split("/")
      if folders.size > 1
        last_sub = folders[-2]
        parent = current_user.categories.find_by_name(last_sub)
        category = current_user.categories.build(:parent => parent, :name => folders.last)
      else
        category = current_user.categories.build(:parent => current_user.get_or_create_root_cat, :name => folders.last)
      end
      category.save 
    end
    redirect_to new_category_path
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new
    @categories = current_user.get_or_create_root_cat.descendants.arrange(:order => :created_at)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  ## POST /categories
  ## POST /categories.json
  #def create
  #  @category = Category.new(params[:category])
  #  @category.parent = current_user.create_root_cat

  #  respond_to do |format|
  #    if @category.save
  #      format.html { redirect_to @category, notice: 'Category was successfully created.' }
  #      format.json { render json: @category, status: :created, location: @category }
  #    else
  #      format.html { render action: "new" }
  #      format.json { render json: @category.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # PUT /categories/1
  # PUT /categories/1.json
  #def update
  #  @category = Category.find(params[:id])

  #  respond_to do |format|
  #    if @category.update_attributes(params[:category])
  #      format.html { redirect_to @category, notice: 'Category was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @category.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end
end
