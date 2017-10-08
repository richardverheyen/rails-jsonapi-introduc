# frozen_string_literal: true
module Public
  class UsersController < ApplicationController

    # POST /public/users
    def create
      @new_user = User.create!(post_params)
      json = JSONAPI::ResourceSerializer.new(Public::UserResource).serialize_to_hash(Public::UserResource.new(@new_user, nil))
      render json: json, status: 201
    end

    # PUT /public/users/:id
    def update
      @user = User.find(params[:id])
      @user.update(put_params)
      @userid = params[:id]
      @users = User.where.not(id: @userid)
      @user_resources = @users.map { |user| Public::UserListResource.new(user, nil) }
      json = JSONAPI::ResourceSerializer.new(Public::UserListResource).serialize_to_hash(@user_resources)
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
end
