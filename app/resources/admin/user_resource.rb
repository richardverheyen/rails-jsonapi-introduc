# frozen_string_literal: true
module Admin
  class UserResource < JSONAPI::Resource
    attributes :tagline,
               :image,
               :lat,
               :lng
  end
end
