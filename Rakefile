require_relative "./main.rb"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:test) do |t|
  t.rspec_opts = "--format documentation"
  t.verbose = false
end

task :default do
  puts Main.run
end
