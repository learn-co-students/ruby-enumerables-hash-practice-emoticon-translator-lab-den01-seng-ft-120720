require 'yaml'

def load_library(file_path)
  emoticon_hash = {}
  YAML.load_file(file_path).each do |key,value|
    emoticon_hash[key] = {:english => value[0], :japanese => value[1]}
  end 
  emoticon_hash 
end

def get_japanese_emoticon(file_path, emoticon)
  load_library(file_path).each do |key,value|
    if value[:english] == emoticon 
      return value[:japanese]
    end  
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  load_library(file_path).each do |key,value|
    if value[:japanese] == emoticon 
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end