module Minitest
  module Assertions
    # Fails unless `path` exists.
    #
    # @param path [String,Pathname]
    # @param msg [String] (nil)
    # @return [void]
    def assert_path_exists(path, msg = nil)
      msg ||= "expected '#{path}' to exist, but it doesn't"
      assert(File.exist?(path), msg)
    end

    # Fails if `path` exists.
    #
    # @param path [String,Pathname]
    # @param msg [String] (nil)
    # @return [void]
    def refute_path_exists(path, msg = nil)
      msg ||= "expected '#{path}' not to exist, but it does"
      refute(File.exist?(path), msg)
    end
  end
end
