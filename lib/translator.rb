require 'yaml'

def load_library(path)
  emoticons = YAML.load_file(path)
  new_hash = {}
  emoticons.each do |key, value|
    new_hash[key] = {}
    new_hash[key][:english] = value[0]
    new_hash[key][:japanese] = value[1]
  end
  new_hash
end



def get_japanese_emoticon(path, emoticon)
  # I recieve a path and an english emoticon X
  # I need to find the entry that the english emoticon lives in X
  # I need to store that entry X
  # I need to retrieve the japanese emoticon for that entry X
  # I will return the retrieved japanese emoticon X
  # If the passed in emoticon does not exist in the table X
    # Return error msg X
  hash = load_library(path)
  result = hash.select{ |k, v| hash[k].value?(emoticon)}
  result.size > 0 ? result.dig(result.keys[0], :japanese) : "Sorry, that emoticon was not found"
end



def get_english_meaning(path, emoticon)
  hash = load_library(path)
  result = hash.select{ |k, v| hash[k].value?(emoticon) }
  result.size > 0 ? result.keys[0] : "Sorry, that emoticon was not found"
end