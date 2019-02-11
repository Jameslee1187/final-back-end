class Api::V1::TeamsController < ApplicationController
  before_action :set_api_v1_team, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:index]

  # GET /api/v1/teams
  def index
    @api_v1_teams = Api::V1::Team.all

    render json: {data: @api_v1_teams}
  end

  # GET /api/v1/teams/1
  def show
    render json: @api_v1_team
  end

  # POST /api/v1/teams
  def create
    @api_v1_team = Api::V1::Team.new(api_v1_team_params)

    if @api_v1_team.save
      render json: @api_v1_team, status: :created, location: @api_v1_team
    else
      render json: @api_v1_team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/teams/1
  def update
    if @api_v1_team.update(api_v1_team_params)
      render json: @api_v1_team
    else
      render json: @api_v1_team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/teams/1
  def destroy
    @api_v1_team.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_team
      @api_v1_team = Api::V1::Team.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_team_params
      params.fetch(:api_v1_team, {})
    end
end
