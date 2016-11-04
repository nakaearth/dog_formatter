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

  test "#created_at_ymd_ja" do
    assert_equal Date.current.strftime("%Y年%m月%d日"), User.create(name: 'ほげ').created_at_ymd_ja
  end

  test "#created_at_ym" do
    assert_equal Date.current.strftime("%Y/%m"), User.create(name: 'ほげ').created_at_ym
  end

  test "#created_at_ym_ja" do
    assert_equal Date.current.strftime("%Y年%m月"), User.create(name: 'ほげ').created_at_ym_ja
  end

  test "#created_at_ymdhhhhh" do
    # assert_raises('変換できません。該当する日付形式がありません') do
    #   User.create(name: 'ほげ').created_at_ym_ja
    # end
  end
end
