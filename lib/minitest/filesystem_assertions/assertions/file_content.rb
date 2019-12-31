require "fileutils"

module Minitest
  module Assertions
    # @!group file_content

    # Fails unless the contents of `file1` and `file2` are the same.
    #
    # @param file1 [String,Pathname]
    # @param file2 [String,Pathname]
    # @param msg [String] (nil)
    # @return [void]
    def assert_file_content_equal(file1, file2, msg = nil)
      # eql = FileUtils.compare_file(file1, file2)
      assert_equal(File.read(file1), File.read(file2), msg)
    end

    # Fails if the contents of `file1` and `file2` are the same.
    #
    # @param file1 [String,Pathname]
    # @param file2 [String,Pathname]
    # @param msg [String] (nil)
    # @return [void]
    def refute_file_content_equal(file1, file2, msg = nil)
      refute_equal(File.read(file1), File.read(file2), msg)
    end

    # @!endgroup file_content
  end
end
