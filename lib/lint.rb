require 'json'
require 'json_schemer'
require 'open-uri'
require 'ruby-progressbar'

def lint(paths, schema_url)
  invalid = []
  schemer = JSONSchemer.schema JSON.load(URI.open(schema_url))
  bar     = ProgressBar.create format: "Linting record %c/%C (%P% complete ) — %e", total: paths.length

  paths.each do |path|
    record  = JSON.parse File.read(path)
    id      = record['layer_id_s'] || record['id']

    invalid <<  { 
      'id' => id, 
      'errors' => schemer.validate(record).map { |x| x['error'] }  
    } unless schemer.valid?(record)
    bar.increment
  end

  if invalid.empty? 
    puts "All #{paths.length} records passed ✅" 
  else
    puts "#{invalid.length}/#{paths.length} records have failed schema validation:"
    invalid.each do |i| 
      puts "❌ #{i['id']}"
      i['errors'].each { |e| puts "\t #{e}" }
    end
  end
end