require 'json'

module FILE_UTILS
  def save_file(game_json_object)
    File.open("game_save.json", "w") do |f|
        f.write(game_json_object.to_json)
    end

    puts "you have saved the game"
  end

  def load_file
    File.open("game_save.json").readlines.each do |line|
      return line
    end
  end

  def check_file
    if File.exists?("game_save.json")
      puts "FILE_UTIL: you have loaded the previous game"
    else
      puts "FILE_UTIL: You dont have a saved game"
      return false
    end
    return true
  end
end