require "yaml"
require "pry"

def load_library
  # code goes here
def load_library(path)
  emoji_hash = {}
  emoji_hash["get_meaning"] = {}
  emoji_hash["get_emoticon"] = {}
  emoji = YAML.load_file(path)
  emoji.each do |word, emojis|
    emoji_hash["get_meaning"][emojis[1]] = word
    emoji_hash["get_emoticon"][emojis[0]] = emojis[1]
  end
  emoji_hash
end

def get_japanese_emoticon
  # code goes here
def get_japanese_emoticon(path, emoticon)
  emoji = load_library(path)
  if emoji["get_emoticon"].has_key?(emoticon)
    emoji["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning
  # code goes here
end 
def get_english_meaning(path, emoticon)
  emoji = load_library(path)
  if emoji["get_meaning"].has_key?(emoticon)
    emoji["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end








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
  emoticon_lib = load_library(emoticon_lib)
  japanese_emoticon = emoticon_lib['get_emoticon'][emoticon]
  japanese_emoticon ? japanese_emoticon : 'Sorry, that emoticon was not found'
end

def get_english_meaning(emoticon_file, emoticon)
  emoticon_lib = load_library(emoticon_file)
  english_meaning = emoticon_lib['get_meaning'][emoticon]
  english_meaning ? english_meaning : 'Sorry, that emoticon was not found'
end




















def get_english_meaning(emoticon_file, emoticon)
  emoticon_lib = load_library(emoticon_file)
  english_meaning = emoticon_lib.keys.find do | key |
    emoticon_lib[key][:japanese] == emoticon 
    #binding.pry
  end 
  english_meaning ? emoticon_lib[english_meaning][:english]: 'Sorry, that emoticon was not found'
  #binding.pry
end






