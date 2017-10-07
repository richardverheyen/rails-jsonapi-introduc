# frozen_string_literal: true
module Public
  class UserListResource < JSONAPI::Resource
  attributes :tagline,
             :image
  end
end
