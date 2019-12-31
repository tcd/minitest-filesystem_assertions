require "test_helper"

module PathExistsTest
  class RefutePathExistsTest < Minitest::Test

    def setup
      @root_dir = Pathname.new(Dir.mktmpdir("minitestfs"))
    end

    def teardown
      FileUtils.rm_rf(@root_dir)
    end

    def test_that_it_fails_when_the_given_path_is_found
      l = -> { refute_path_exists(@root_dir) }
      error = assert_raises(Minitest::Assertion, &l)
      assert_equal("Expected path '#{@root_dir}' to not exist.", error.message)
    end

    def test_that_it_passes_when_the_given_path_is_not_found
      l = -> { refute_path_exists(@root_dir.join("some_file")) }
      assert_nothing_raised(&l)
    end

  end
end
