require 'geo_combine'
require 'json'
require 'json_schemer'
require 'open-uri'
require 'ruby-progressbar'

AARDVARK_SCHEMA = 'https://opengeometadata.org/schema/geoblacklight-schema-aardvark.json'

def lint_aardvark (paths)
  schema  = JSON.load URI.open(AARDVARK_SCHEMA)
  schemer = JSONSchemer.schema(schema)

  paths.each do |path|
    record = JSON.parse File.read(path)
    id     = File.basename(path, '.json')

    next puts "#{id}: ✅" if schemer.valid? record
      
    puts "#{id}: ❌ #{schemer.validate(record).first['error']}"
  end
end 

def lint_v1(paths)
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