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

module Minitest::Assertions
  def assert_nothing_raised()
    flunk("assert_nothing_raised requires a block to capture errors.") unless block_given?
    yield
  end
end
