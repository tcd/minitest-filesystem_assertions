module Minitest
  module Assertions
    # @!group file

    # Fails unless `file` exists and is either a file or a symbolic link to an existing file.
    #
    # @see [File.file?](https://ruby-doc.org/core-2.5.0/File.html#method-c-file-3F)
    #
    # @param file [String,Pathname]
    # @param msg [String] (nil)
    # @return [void]
    def assert_file(file, msg = nil)
      msg = message(msg) { "Expected '#{file}' to be a file" }
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
      msg = message(msg) { "Expected '#{file}' to not be a file" }
      refute_path_exists(file)
      refute(File.file?(file), msg)
    end

    # @!endgroup file
  end
end
