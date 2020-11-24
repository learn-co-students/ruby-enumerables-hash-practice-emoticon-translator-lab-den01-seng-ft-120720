require 'yaml'
require 'pry'

def load_library(file_path)
  file_load = YAML.load_file(file_path)
  translation = Hash.new
  file_load.each do |key, values|
  translation[key] = {}
  translation[key][:english] = values[0]
  translation[key][:japanese] = values[1]
  end
  p translation
end



def get_english_meaning(file_path,emoticon)
  # code goes here
  emoticon_hash = load_library(file_path)
  emoticon_hash.each do |key,value|
    value.each do |key_2,value_2|
      if value_2 == emoticon
        return key
      end
  end
  
  end
   return "Sorry, that emoticon was not found"
end


def get_japanese_emoticon(file_path,emoticon)
  # code goes here
  emoticon_hash = load_library(file_path)
  emoticon_hash.each do |key,value|
    if value[:english] == emoticon
       return value[:japanese]
    end
    
  end
   return "Sorry, that emoticon was not found"
end