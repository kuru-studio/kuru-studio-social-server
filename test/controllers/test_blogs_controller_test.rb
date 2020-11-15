require 'test_helper'

class TestBlogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_blog = test_blogs(:one)
  end

  test "should get index" do
    get test_blogs_url, as: :json
    assert_response :success
  end

  test "should create test_blog" do
    assert_difference('TestBlog.count') do
      post test_blogs_url, params: { test_blog: { description: @test_blog.description, title: @test_blog.title } }, as: :json
    end

    assert_response 201
  end

  test "should show test_blog" do
    get test_blog_url(@test_blog), as: :json
    assert_response :success
  end

  test "should update test_blog" do
    patch test_blog_url(@test_blog), params: { test_blog: { description: @test_blog.description, title: @test_blog.title } }, as: :json
    assert_response 200
  end

  test "should destroy test_blog" do
    assert_difference('TestBlog.count', -1) do
      delete test_blog_url(@test_blog), as: :json
    end

    assert_response 204
  end
end
