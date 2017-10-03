# frozen_string_literal: true
module Public
  class UserResource < JSONAPI::Resource
  attributes :tagline,
             :image,
             :lat,
             :lng
  end
end
