module Minitest
  module Assertions
    # @!group path_exists

    # Fails unless `path` exists.
    #
    # @see [File.exist?](https://ruby-doc.org/core-2.5.0/File.html#method-c-exist-3F)
    # @note This assertion was added to Mintest in version [5.13.0](https://github.com/seattlerb/minitest/blob/master/History.rdoc#5130--2019-10-29).
    #
    # @param path [String,Pathname]
    # @param msg [String] (nil)
    # @return [void]
    def assert_path_exists(path, msg = nil)
      # msg ||= "Expected '#{path}' to exist"
      msg = message(msg) { "Expected path '#{path}' to exist" }
      assert(File.exist?(path), msg)
    end

    # Fails if `path` exists.
    #
    # @see [File.exist?](https://ruby-doc.org/core-2.5.0/File.html#method-c-exist-3F)
    # @note This assertion was added to Mintest in version [5.13.0](https://github.com/seattlerb/minitest/blob/master/History.rdoc#5130--2019-10-29).
    #
    # @param path [String,Pathname]
    # @param msg [String] (nil)
    # @return [void]
    def refute_path_exists(path, msg = nil)
      # msg ||= "Expected '#{path}' to not exist"
      msg = message(msg) { "Expected path '#{path}' to not exist" }
      refute(File.exist?(path), msg)
    end

    # @!endgroup path_exists
  end
end
