require 'geo_combine'
require 'ruby-progressbar'

namespace :lint do
  desc "lint version 1 geoblacklight.json records"
  task :v1 do
    paths           = Dir.glob("./metadata-1.0/**/*/geoblacklight.json")
    records_invalid = 0
    records_valid   = 0
    invalid_paths   = []
    progess_bar     = ProgressBar.create format: "Linting record %c/%C (%P% complete ) — %e", total: paths.length

    paths.each do |path|
      rec = GeoCombine::Geoblacklight.new(File.read(path))
      begin
        rec.valid?
        records_valid += 1
      rescue
        records_invalid += 1
        invalid_paths << path
      end
      progess_bar.increment
    end

    if records_invalid > 0
      raise "Contains #{records_invalid} invalid records:\n#{invalid_paths}"
    else 
      puts "All records passed ✅"
    end
  end
end

# task :default => ["validate_v1"]
