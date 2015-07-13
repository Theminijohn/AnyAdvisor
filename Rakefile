require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ['--color', '--format documentation']
end

task default: :spec

task :console do
  require 'irb'
  require 'irb/completion'
  require 'anyadvisor'

  def reload!
    files = $LOADED_FEATURES.select { |feat| feat =~ /\/AnyAdvisor\//  }
    files.each { |file| load file  }
  end

  ARGV.clear
  IRB.start
end
