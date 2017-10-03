# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    jsonapi_resources :users, only: %i[index create update destroy]
  end
  namespace :public do
    jsonapi_resources :users, only: %i[create update]
  end
  jsonapi_resources :users, only: %i[create update] #Users only need to create profiles and update their coords
end
