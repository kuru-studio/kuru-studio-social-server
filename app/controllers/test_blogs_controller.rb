class TestBlogsController < ApplicationController
  before_action :set_test_blog, only: [:show, :update, :destroy]

  # GET /test_blogs
  def index
    @test_blogs = TestBlog.all

    render json: @test_blogs
  end

  # GET /test_blogs/1
  def show
    render json: @test_blog
  end

  # POST /test_blogs
  def create
    @test_blog = TestBlog.new(test_blog_params)

    if @test_blog.save
      render json: @test_blog, status: :created, location: @test_blog
    else
      render json: @test_blog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /test_blogs/1
  def update
    if @test_blog.update(test_blog_params)
      render json: @test_blog
    else
      render json: @test_blog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /test_blogs/1
  def destroy
    @test_blog.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_blog
      @test_blog = TestBlog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def test_blog_params
      params.require(:test_blog).permit(:title, :description)
    end
end
