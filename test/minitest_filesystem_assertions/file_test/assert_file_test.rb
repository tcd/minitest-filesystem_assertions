require "test_helper"

module FileTest
  class AssertFileTest < Minitest::Test

    def setup
      @root_dir = Pathname.new(Dir.mktmpdir("minitestfs"))

      @file_path = @root_dir.join("some_file")
      @fake_file_path = @root_dir.join("fake_file")
      @dir_path = @root_dir.join("some_folder")
      @good_link_path = @root_dir.join("valid_link")
      @bad_link_path = @root_dir.join("invalid_link")

      FileUtils.touch(@file_path)
      FileUtils.mkdir(@dir_path)
      FileUtils.ln_s(@file_path, @good_link_path)
      FileUtils.ln_s("invalid", @bad_link_path)
    end

    def teardown
      FileUtils.rm_rf(@root_dir)
    end

    def test_that_it_passes_when_the_file_exists_and_is_a_file
      l = -> { assert_file(@file_path) }
      assert_nothing_raised(&l)
    end

    def test_that_it_passes_when_the_file_exists_and_is_a_valid_symbolic_link
      l = -> { assert_file(@good_link_path) }
      assert_nothing_raised(&l)
    end

    def test_that_it_passes_when_the_file_exists_but_is_an_invalid_symbolic_link
      l = -> { assert_file(@bad_link_path) }
      error = assert_raises(Minitest::Assertion, &l)
      assert_equal("Expected path '#{@bad_link_path}' to exist.", error.message)
    end

    def test_that_it_fails_when_the_file_is_not_found
      l = -> { assert_file(@fake_file_path) }
      error = assert_raises(Minitest::Assertion, &l)
      assert_equal("Expected path '#{@fake_file_path}' to exist.", error.message)
    end

    def test_that_it_fails_when_the_file_is_a_directory
      l = -> { assert_file(@dir_path) }
      error = assert_raises(Minitest::Assertion, &l)
      assert_equal("Expected '#{@dir_path}' to be a file.", error.message)
    end

  end
end
