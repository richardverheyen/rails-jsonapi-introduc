# frozen_string_literal: true

class UserResource < JSONAPI::Resource
  attributes :tagline,
             :image,
             :lat,
             :lng
end
