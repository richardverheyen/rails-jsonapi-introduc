# frozen_string_literal: true

class UsersController < ApplicationController

  # POST /users
  def create
    @new_user = User.create!(post_params)
    json = JSONAPI::ResourceSerializer.new(UserResource).serialize_to_hash(UserResource.new(@new_user, nil))
    render json: json, status: 201
  end

  # PUT /users/:id
  def update
    @user = User.find(params[:id])
    @user.update(put_params)
    @users = User.all

    @user_resources = @users.map { |user| UserResource.new(user, nil) }
    json = JSONAPI::ResourceSerializer.new(UserResource).serialize_to_hash(@user_resources)
    render json: json, status: 202
  end

  private
  def post_params
    params.require(:data)
          .require(:attributes)
          .permit(
            :tagline,
            :image )
  end
  def put_params
    params.require(:data)
          .require(:attributes)
          .permit(
            :lat,
            :lng )
  end

end
