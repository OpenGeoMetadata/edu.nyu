desc "Validate all geoblacklight.json records"
task :validate_all do
  require 'geo_combine'
  require 'find'
  paths = Find.find(Dir.pwd).select{ |x| x.include?("geoblacklight.json")}
  records_invalid = 0
  records_valid = 0
  puts "Validating #{paths.count} Geoblacklight records:"
  paths.each_with_index do |path, idx|
    rec = GeoCombine::Geoblacklight.new(File.read(path))
    begin
      rec.valid?
      records_valid += 1
      if (idx % 10 == 0)
        print(idx)
      else
        print(".")
      end
    rescue
      records_invalid += 1
      print("X")
    end
  end

  if records_invalid > 0
    raise "Contains #{records_invalid} invalid records"
  end
end

task :default => ["validate_all"]
