require 'test_helper'
require 'dog_formatter/model'

class User < ActiveRecord::Base
  include DagFormatter::Model
end

class DogFormatterTest < ActiveSupport::TestCase
  test "truth" do
    assert_equal Date.new.strftime("%Y/%m/%d"), User.create(name: 'ほげ').created_at_ymd
  end
end
