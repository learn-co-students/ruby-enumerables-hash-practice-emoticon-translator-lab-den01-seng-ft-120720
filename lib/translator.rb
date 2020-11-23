# require modules here
require 'yaml'
require 'pry'
def load_library(file)
  # code goes here
  library = YAML.load(File.read(file))
  final_library = library.each_with_object({}) do |(key,value), new_hash|
    new_hash[key] = {:english => "", :japanese => ""}
    value.each do |emoji|
      if new_hash[key][:english] == ""
        new_hash[key][:english] = emoji
      else 
        new_hash[key][:japanese] = emoji
      end
    end
  end
  final_library
end

def get_japanese_emoticon(file,emoticon)
  # code goes here
  library = load_library(file)
  meaning = ""
  library.each do |key,value|
    value.select do |language,emoji|
      if emoji == emoticon
        meaning = library[key][:japanese]
      end
    end
  end
  if meaning == ""
    meaning = "Sorry, that emoticon was not found"
  end
  meaning
end

def get_english_meaning(file,emoticon)
  # code goes here
  library = load_library(file)
  meaning = ""
  library.each do |key,value|
    value.select do |language,emoji|
      if emoji == emoticon
        meaning = key.to_s
      end
    end
  end
  if meaning == ""
    meaning = "Sorry, that emoticon was not found"
  end
  meaning
end