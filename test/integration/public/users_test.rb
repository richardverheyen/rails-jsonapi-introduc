# frozen_string_literal: true

require 'test_helper'

class IntegrationTestUser < ActionDispatch::IntegrationTest

  def setup
    @user1 = users('richard')
    @user2 = users('jan')
  end

  test 'Public can create a user' do
    json = {
      data: {
        attributes: {
          tagline: 'hi i\'m a test',
          image: '/img/ewatson.jpg'
        },
        type: 'users'
      }
    }
    assert_equal User.count, 2, 'Before creation there should be 2 users'
    post '/public/users', params: json
    assert_response 201
    assert_equal User.count, 3, 'After creation there should be 3 users'
    refute_empty User.where(tagline: 'hi i\'m a test'), 'The database should contain a new user with tagline "hi i\'m a test"'
    user = User.where(tagline: 'hi i\'m a test').first
    data = JSON.parse(@response.body)['data']
    assert_equal data['id'].to_i, user.id, 'The response indludes the ID of the created user (important)'
    assert_equal data['attributes']['tagline'], 'hi i\'m a test'
    assert_equal data['attributes']['image'], '/img/ewatson.jpg'
  end

  test 'Public can update their coords and receive nearby users' do
    json = {
      data: {
        attributes: {
          lat: 5.55,
          lng: 6.66
        },
        id: @user1.id,
        type: 'users'
      }
    }
    assert_equal @user1.lat, 1.11, 'Before the update the lat of the user should be 1.11'
    put "/public/users/#{@user1.id}", params: json
    assert_response 202
    user = User.find_by(id: @user1.id)
    assert_equal user.lat, 5.55, 'After the update the lat of the user should be 5.55'
    assert_equal user.lng, 6.66, 'After the update the lng of the user should be 6.66'
  end
end
