# require modules here
require 'pry'
require 'yaml'

def load_library(file)
  # code goes here
  new_library = {}
  
  library = YAML.load_file(file)
  library.map do |key, value|
    new_library[key] = {english: value[0], japanese: value[1]}
  end
  new_library
end

def get_japanese_emoticon(file, emoticon)
  # Instantiate a variable for "Japanese emoticon"
  japanese_emoticon = "Sorry, that emoticon was not found"
  
  #Load the YAML Library
  library = load_library(file)
  
  #Locate the emoticon
  library.find do |key, value|
    if library[key][:english] == emoticon
      japanese_emoticon = library[key][:japanese]
    end
  end
  
  # Return Japanese emoticon
  japanese_emoticon
end

def get_english_meaning(file, emoticon)
  # Instantiate a variable for "English meaning"
  english_meaning = "Sorry, that emoticon was not found"
  
  # Load the YAML Library
  library = load_library(file)
  
  #Locate the emoticon
  library.find do |key, value|
    if library[key][:japanese] == emoticon
      english_meaning = key
    end
  end
  
  # Return English meaning
  english_meaning
end