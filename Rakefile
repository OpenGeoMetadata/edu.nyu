require_relative 'lib/lint'

namespace :lint do
  desc "lint version 1 geoblacklight.json records"
  task :v1 do
    puts "OGM v1 ~>"
    paths = Dir.glob("./metadata-1.0/**/*/geoblacklight.json")
    lint_v1 paths
  end
  desc "lint aardvark geoblacklight.json records"
  task :aardvark do
    puts "AARDVARK ~>"
    paths = Dir.glob("./metadata-aardvark/*/**/*.json")
    lint_aardvark paths
  end
  desc "lint all records"
  task :all do 
    Rake::Task['lint:v1'].execute
    Rake::Task['lint:aardvark'].execute
  end
end

task :default => ["lint:all"]
