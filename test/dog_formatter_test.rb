require 'test_helper'
require 'dog_formatter/model'

class User < ActiveRecord::Base
end

class DogFormatterTest < ActiveSupport::TestCase
  test "#created_at_ymd" do
    assert_equal Date.current.strftime("%Y/%m/%d"), User.create(name: 'ほげ').created_at_ymd
  end

  test "#updated_at_ymd" do
    assert_equal Date.current.strftime("%Y/%m/%d"), User.create(name: 'ほげ').updated_at_ymd
  end
end
