# require modules here 
require "pry"
require "yaml"
 

def load_library(file_path)  
    emoticons = YAML.load_file(file_path)
    new_hash = {}
    emoticons.each do |key,value|
    new_hash[key] = {}
    new_hash[key][:english] = value[0]
    new_hash[key][:japanese] = value[1]
    end
    new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  hash = load_library(file_path)
  hash.find do |keys, values|
    if hash[keys][:english] == emoticon
      return hash[keys][:japanese]
    end
     
# binding.pry
  end 
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  hash = load_library(file_path)
  hash.find do |keys, values|
    if hash[keys][:japanese] == emoticon 
      return keys
    end
  # binding.pry
end
return "Sorry, that emoticon was not found"
end