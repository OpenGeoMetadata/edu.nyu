require_relative 'lib/lint'

namespace :lint do
  AARDVARK_SCHEMA_URL = 'https://opengeometadata.org/schema/geoblacklight-schema-aardvark.json'
  OGM_V1_SCHEMA_URL   = 'https://opengeometadata.org/schema/geoblacklight-schema-1.0.json'

  desc "lint version 1 geoblacklight.json records"
  task :v1 do
    puts "\nOGM v1 ~>"
    paths = Dir.glob("./metadata-1.0/**/*/geoblacklight.json")
    lint paths, OGM_V1_SCHEMA_URL
  end
  desc "lint aardvark geoblacklight.json records"
  task :aardvark do
    puts "\nAARDVARK ~>"
    paths = Dir.glob("./metadata-aardvark/*/**/*.json")
    lint paths, AARDVARK_SCHEMA_URL
  end
  desc "lint all records"
  task :all do 
    Rake::Task['lint:v1'].execute
    Rake::Task['lint:aardvark'].execute
  end
end

task :default => ["lint:all"]
