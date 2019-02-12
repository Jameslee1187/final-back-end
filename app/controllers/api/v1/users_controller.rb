class Api::V1::UsersController < ApplicationController
  before_action :set_api_v1_user, only: [:update, :destroy]
  skip_before_action :authorized, only: [:show, :create, :login, :index]

  def create
    username = params[:username]
    password = params[:password]
    user = Api::V1::User.create(username: username, password: password)
      if user.valid?
        token = encode_token({user_id: user.id})
        render json: {jwt: token, user: user, result: "Great Success"}
      else
        render json: {result: "Failure"}
      end
  end

  def login
    username = params[:username]
    password = params[:password]
    user = Api::V1::User.find_by(username: username)
    puts "user",user
    puts user.authenticate(password)
    puts password
    puts user
    if user && user.authenticate(password)
      token = encode_token({user_id: user.id})
      render json: {jwt: token, user: user, result: "Great Success"}
    else
      render json: {result: "Failure"}
    end
  end

  # GET /api/v1/users
  def index
    @api_v1_users = Api::V1::User.all
    render json: @api_v1_users
  end

  # GET /api/v1/users/1
  def show
    @api_v1_user = Api::V1::User.find(params[:id])
    render json: @api_v1_user
  end

  # POST /api/v1/users

  # PATCH/PUT /api/v1/users/1
  def update
    if @api_v1_user.update(api_v1_user_params)
      render json: @api_v1_user
    else
      render json: @api_v1_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1
  def destroy
    @api_v1_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_user
      @api_v1_user = Api::V1::User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_user_params
      params.fetch(:api_v1_user, {})
    end
end
