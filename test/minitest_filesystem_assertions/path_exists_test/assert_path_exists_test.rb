require "test_helper"

module PathExistsTest
  class AssertPathExistsTest < Minitest::Test

    def setup
      @root_dir = Pathname.new(Dir.mktmpdir("minitestfs"))
      @path = @root_dir.join("some_file")
    end

    def teardown
      FileUtils.rm_rf(@root_dir)
    end

    def test_that_it_fails_when_the_given_path_is_not_found
      l = -> { assert_path_exists(@path) }
      error = assert_raises(Minitest::Assertion, &l)
      assert_equal("Expected path '#{@path}' to exist.", error.message)
    end

    def test_that_it_passes_when_the_given_path_is_found
      FileUtils.touch(@path)
      l = -> { assert_path_exists(@path) }
      assert_nothing_raised(&l)
      FileUtils.rm(@path)
    end

  end
end
