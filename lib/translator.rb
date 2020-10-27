# require modules here
require "pry"
require "yaml"

def load_library(library)
  emoticon_array = YAML.load_file(library)
  output_hash = {}
  emoticon_array.each do |key, value|
    output_hash[key] = {}
    output_hash[key][:english] = value[0]
    output_hash[key][:japanese] = value[1]
    #binding.pry
  end
  #binding.pry
  output_hash
end

def get_japanese_emoticon(library, emoticon)
  # code goes here
  emoticon_lib = load_library(library)
  output = "Sorry, that emoticon was not found"
  emoticon_lib.each do |key, value|
    #binding.pry
    if emoticon_lib[key][:english] == emoticon
      output = emoticon_lib[key][:japanese]
      #binding.pry
    end
  end
  #binding.pry
  output
end

def get_english_meaning(library, emoticon)
  emoticon_lib = load_library(library)
  output = "Sorry, that emoticon was not found"
  emoticon_lib.each do |key, value|
    #binding.pry
    if emoticon_lib[key][:japanese] == emoticon
      output = key
      #binding.pry
    end
  end
  #binding.pry
  output
end