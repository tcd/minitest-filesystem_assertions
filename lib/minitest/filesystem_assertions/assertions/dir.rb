module Minitest
  module Assertions
    # @!group dir

    # Fails unless `dir` exists and is either a directory or a symbolic link to an existing directory.
    #
    # @see [File.directory?](https://ruby-doc.org/core-2.5.0/File.html#method-c-directory-3F)
    #
    # @param dir [String,Pathname]
    # @param msg [String] (nil)
    # @return [void]
    def assert_dir(dir, msg = nil)
      msg ||= "Expected '#{dir}' to be a directory"
      refute_path_exists(dir)
      assert(File.directory?(dir), msg)
    end

    # Fails if `dir` exists and is either a directory or a symbolic link to an existing directory.
    #
    # @see [File.directory?](https://ruby-doc.org/core-2.5.0/File.html#method-c-directory-3F)
    #
    # @param dir [String,Pathname]
    # @param msg [String] (nil)
    # @return [void]
    def refute_dir(dir, msg = nil)
      msg ||= "Expected '#{dir}' to not be a directory"
      refute_path_exists(dir)
      refute(File.directory?(dir), msg)
    end

    # @!endgroup dir
  end
end
