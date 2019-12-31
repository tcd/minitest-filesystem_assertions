require "simplecov"

formatters = []
formatters << SimpleCov::Formatter::HTMLFormatter
if ENV["CI"] == "true"
  require "coveralls"
  formatters << Coveralls::SimpleCov::Formatter
end
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(formatters)

SimpleCov.start do
  add_filter "/bin/"
  add_filter "/test/"

  track_files "lib/**/*.rb"
end

require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use!([
  Minitest::Reporters::DefaultReporter.new(color: true),
  # Minitest::Reporters::SpecReporter.new,
])

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "minitest/filesystem_assertions"
require "tmpdir"
require "fileutils"

module Minitest
  module Assertions
    def assert_nothing_raised()
      flunk("assert_nothing_raised requires a block to capture errors.") unless block_given?
      yield
    end
  end
  class Test
    unless defined?(Spec)
      # Helper to define a test method using a String.
      # Under the hood, it replaces spaces with underscores and defines the test method.
      # [Courtesy of ActiveSupport](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/testing/declarative.rb).
      #
      # @example
      #   test "verify something" do
      #     ...
      #   end
      #
      # @param name [String]
      # @return [void]
      def self.test(name, &block)
        test_name = "test_#{name.gsub(/\s+/, '_')}".to_sym
        defined = method_defined?(test_name)
        raise "#{test_name} is already defined in #{self}" if defined
        if block_given?
          define_method(test_name, &block)
        else
          define_method(test_name) do
            flunk "No implementation provided for #{name}"
          end
        end
      end
    end
  end
end
