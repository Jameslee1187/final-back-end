require 'test_helper'

class Api::V1::FavoritesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_favorite = api_v1_favorites(:one)
  end

  test "should get index" do
    get api_v1_favorites_url, as: :json
    assert_response :success
  end

  test "should create api_v1_favorite" do
    assert_difference('Api::V1::Favorite.count') do
      post api_v1_favorites_url, params: { api_v1_favorite: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_favorite" do
    get api_v1_favorite_url(@api_v1_favorite), as: :json
    assert_response :success
  end

  test "should update api_v1_favorite" do
    patch api_v1_favorite_url(@api_v1_favorite), params: { api_v1_favorite: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_favorite" do
    assert_difference('Api::V1::Favorite.count', -1) do
      delete api_v1_favorite_url(@api_v1_favorite), as: :json
    end

    assert_response 204
  end
end
