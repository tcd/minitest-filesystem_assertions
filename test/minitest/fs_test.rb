require "test_helper"

class Minitest::FSTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Minitest::FS::VERSION
  end
end
