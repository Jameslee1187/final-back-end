class Api::V1::FavoritesController < ApplicationController
  before_action :set_api_v1_favorite, only: [:show, :update]
  skip_before_action :authorized, only: [:create, :login]

  # GET /api/v1/favorites
  def index
    # @api_v1_favorites = Api::V1::Favorite.all
    p current_user
    current_teams = current_user.teams

    render json: current_teams
  end

  # GET /api/v1/favorites/1
  def show
    render json: @api_v1_favorite
  end

  # POST /api/v1/favorites
  def create
    @api_v1_favorite = Api::V1::Favorite.new(team_id: params[:team_id], user_id: current_user.id)

    if @api_v1_favorite.save
      render json: @api_v1_favorite, status: :created, location: @api_v1_favorite
    else
      render json: @api_v1_favorite.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/favorites/1
  def update
    if @api_v1_favorite.update(api_v1_favorite_params)
      render json: @api_v1_favorite
    else
      render json: @api_v1_favorite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/favorites/1
  def destroy
    p "hello"
    p "id", params[:id]
    p "team_id",params[:team_id]
    p "current_user", current_user.id
    @api_v1_favorite = Api::V1::Favorite.find_by(team_id: params[:team_id], user_id: current_user.id)
    @api_v1_favorite.destroy
    render json: {result: 'success', data: @api_v1_favorite}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_favorite
      @api_v1_favorite = Api::V1::Favorite.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_favorite_params
      params.require(:api_v1_favorite).permit(:team_id)
    end
end
