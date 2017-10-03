# frozen_string_literal: true

require 'test_helper'

class ProductModelTest < ActiveSupport::TestCase
  test 'should not save user without tagline' do
    user = User.new
    assert_not user.save, 'Saved the user without a tagline'
  end

  test 'should report error' do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end
end
