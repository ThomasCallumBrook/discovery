class BlogsController < ApplicationController
  before_action :set_blogs
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET countries/1/blogs
  def index
    @blogs = @country.blogs
  end

  # GET countries/1/blogs/1
  def show
  end

  # GET countries/1/blogs/new
  def new
    @blog = @country.blogs.build
  end

  # GET countries/1/blogs/1/edit
  def edit
  end

  # POST countries/1/blogs
  def create
    @blog = @country.blogs.build(blog_params)

    if @blog.save
      redirect_to([@blog.country, @blog], notice: 'Blog was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT countries/1/blogs/1
  def update
    if @blog.update_attributes(blog_params)
      redirect_to([@blog.country, @blog], notice: 'Blog was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE countries/1/blogs/1
  def destroy
    @blog.destroy

    redirect_to country_blogs_url(@country)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blogs
      @country = Country.find(params[:country_id])
    end

    def set_blog
      @blog = @country.blogs.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blog_params
      params.require(:blog).permit(:title, :post)
    end
end
