module Minitest
  module Assertions

    # # @!group path_exists
    #
    # # Fails unless `path` exists.
    # #
    # # @see [File.exist?](https://ruby-doc.org/core-2.5.0/File.html#method-c-exist-3F)
    # # @note This assertion was added to Mintest in version [5.13.0](https://github.com/seattlerb/minitest/blob/master/History.rdoc#5130--2019-10-29).
    # #
    # # @param path [String,Pathname]
    # # @param msg [String] (nil)
    # # @return [void]
    # def assert_path_exists(path, msg = nil)
    #   msg = message(msg) { "Expected path '#{path}' to exist" }
    #   # msg ||= "Expected '#{path}' to exist"
    #   assert(File.exist?(path), msg)
    # end
    #
    # # Fails if `path` exists.
    # #
    # # @see [File.exist?](https://ruby-doc.org/core-2.5.0/File.html#method-c-exist-3F)
    # # @note This assertion was added to Mintest in version [5.13.0](https://github.com/seattlerb/minitest/blob/master/History.rdoc#5130--2019-10-29).
    # #
    # # @param path [String,Pathname]
    # # @param msg [String] (nil)
    # # @return [void]
    # def refute_path_exists(path, msg = nil)
    #   msg = message(msg) { "Expected path '#{path}' to not exist" }
    #   # msg ||= "Expected '#{path}' to not exist"
    #   refute(File.exist?(path), msg)
    # end

    # # @!endgroup path_exists

    # @!group file_exists

    # Fails unless `file` exists and is either a file or a symbolic link to an existing file.
    #
    # @see [File.file?](https://ruby-doc.org/core-2.5.0/File.html#method-c-file-3F)
    #
    # @param file [String,Pathname]
    # @param msg [String] (nil)
    # @return [void]
    def assert_file(file, msg = nil)
      msg ||= "Expected '#{file}' to be a file"
      assert_path_exists(file)
      assert(File.file?(file), msg)
    end

    # Fails if `file` exists and is either a file or a symbolic link to an existing file.
    #
    # @see [File.file?](https://ruby-doc.org/core-2.5.0/File.html#method-c-file-3F)
    #
    # @param file [String,Pathname]
    # @param msg [String] (nil)
    # @return [void]
    def refute_file(file, msg = nil)
      msg ||= "Expected '#{file}' to not be a file"
      refute_path_exists(file)
      refute(File.file?(file), msg)
    end

    # @!endgroup file_exists

    # @!group dir_exists

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

    # @!endgroup dir_exists

    # @!group file_content

    # Fails unless the contents of `file1` and `file2` are the same.
    #
    # @param file1 [String,Pathname]
    # @param file2 [String,Pathname]
    # @param msg [String] (nil)
    # @return [void]
    def assert_file_content_equal(file1, file2, msg = nil)
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
