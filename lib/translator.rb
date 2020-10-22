require "yaml"
require 'pry'

def load_library(file_path)
  library = YAML.load_file(file_path)
  library.each {|emoticon_def, emoticon_array| library[emoticon_def] = {:english => emoticon_array[0], :japanese => emoticon_array[1]}}
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  desired_emo = library.find{|definition, hash| emoticon == library[definition][:english]}
  if !desired_emo
    return "Sorry, that emoticon was not found"
  else
    desired_emo[1][:japanese]
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  desired_emo = library.find{|definition, hash| emoticon == library[definition][:japanese]}
  if !desired_emo
    return "Sorry, that emoticon was not found"
  else
    desired_emo[0]
  end
end

#bilingual_dict = {}
#bilingual_dict[emoticon_def] = {:english => emoticon_array[0], :japanese => emoticon_array[1]}
