# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    jsonapi_resources :users, only: %i[index create update destroy]
  end
  namespace :public do
    jsonapi_resources :users, only: %i[create update]
  end
end
