require 'test/unit'
load 'lib/common_utils.rb'
class TestSomething < Test::Unit::TestCase
  def test_os_linux
    puts Common_utils.is_linux?
    if RUBY_PLATFORM =~ /linux/
      assert_true Common_utils.is_linux?
    else
      skip("test not supported for non-linux")
    end
  end
end
