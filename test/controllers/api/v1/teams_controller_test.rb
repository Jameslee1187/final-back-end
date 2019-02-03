require 'test_helper'

class Api::V1::TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_team = api_v1_teams(:one)
  end

  test "should get index" do
    get api_v1_teams_url, as: :json
    assert_response :success
  end

  test "should create api_v1_team" do
    assert_difference('Api::V1::Team.count') do
      post api_v1_teams_url, params: { api_v1_team: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_team" do
    get api_v1_team_url(@api_v1_team), as: :json
    assert_response :success
  end

  test "should update api_v1_team" do
    patch api_v1_team_url(@api_v1_team), params: { api_v1_team: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_team" do
    assert_difference('Api::V1::Team.count', -1) do
      delete api_v1_team_url(@api_v1_team), as: :json
    end

    assert_response 204
  end
end
