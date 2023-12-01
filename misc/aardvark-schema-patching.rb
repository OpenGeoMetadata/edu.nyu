require 'json'

int_array_keys    = %w( gbl_indexYear_im  )
string_array_keys = %w( dct_description_sm 
                        dct_identifier_sm
                        dct_language_sm 
                        dct_publisher_sm
                        gbl_resourceClass_sm 
                        gbl_resourceType_sm
                      )

def as_string_array(value)
  return value if value.is_a? Array and value.first.is_a? String 

  [value.to_s].flatten
end

def as_int_array(value)
  return value if value.is_a? Array and value.first.is_a? Integer 

  [value.to_int].flatten
end

Dir.glob("./metadata-aardvark/*/**/*.json").each do |path|
  # read record
  record = JSON.parse File.read(path)
  
  # patch record
  # cast values as arrays of strings
  string_array_keys.each  { |key| record[key] = as_string_array record[key] }
  # cast values as arrays of integers
  int_array_keys.each     { |key| record[key] = as_int_array record[key] }
  # special case: gbl_resourceClass_sm should be set to "Other" by default instead of empty string
  record['gbl_resourceClass_sm'] = ['Other'] if record['gbl_resourceClass_sm'].first.empty?
  
  # write updated
  File.write(path, JSON.pretty_generate(record))
end