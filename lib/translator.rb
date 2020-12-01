require 'yaml'
require 'pry'

def load_library(emoticon_file)
  emoticons = YAML.load_file('./lib/emoticons.yml')
 emoticon_lib = { }
  emoticons.each do |meaning, value|
    #binding.pry
    english = value[0]
    japanese = value[1]
    emoticon_lib[meaning]={ }
    emoticon_lib[meaning][:japanese] = japanese
    emoticon_lib[meaning][:english] = english
  end
  emoticon_lib
end

def get_japanese_emoticon(emoticon_file, emoticon)
  emoticon_lib = load_library(emoticon_file)
  japanese_emoticon = emoticon_lib.keys.find do | key |
     emoticon_lib[key][:english] == emoticon
  end
  japanese_emoticon ? emoticon_lib[japanese_emoticon][:japanese] : 'Sorry, that emoticon was not found'
  #binding.pry 
end

def get_english_meaning(emoticon_file, emoticon)
  emoticon_lib = load_library(emoticon_file)
  english_meaning = emoticon_lib.keys.find do | key |
    emoticon_lib[key][:japanese] == emoticon 
    #binding.pry
  end 
  english_meaning ? english_meaning: 'Sorry, that emoticon was not found'
  #binding.pry
end
