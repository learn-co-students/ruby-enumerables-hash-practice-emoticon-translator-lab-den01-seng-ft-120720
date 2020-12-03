require 'yaml'

def load_library(yml_file)
  output_hash = {}
  emoticons_hash = YAML.load(File.read(yml_file))
  
  # First element of emoticon array is the Western version and Second element of emoticon array is the Japanese version
  emoticons_hash.each do |emoticon_name, emoticon_array|
    each_emoticon_hash = {}
    each_emoticon_hash[:english] = emoticon_array[0]
    each_emoticon_hash[:japanese] = emoticon_array[1]
    output_hash[emoticon_name] = each_emoticon_hash
  end
  output_hash
end

def get_japanese_emoticon(yml_file, english_emoticon)
  new_hash = load_library(yml_file)
  japanese_output_emoticon = 'Sorry, that emoticon was not found'
  new_hash.each do |emoticon_name, emoticon_hash|
    if emoticon_hash[:english] == english_emoticon
      japanese_output_emoticon = emoticon_hash[:japanese]
    end
  end
  japanese_output_emoticon
end

def get_english_meaning(yml_file, japanese_emoticon)
  new_hash = load_library(yml_file)
  english_name = 'Sorry, that emoticon was not found'
  new_hash.each do |emoticon_name, emoticon_hash|
    if emoticon_hash[:japanese] == japanese_emoticon
      english_name = emoticon_name
    end
  end
  english_name
end