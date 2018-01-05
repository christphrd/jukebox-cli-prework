#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer
require 'pry'
my_songs = {
  "Go Go GO" => '
/home/christphrd/jukebox-cli-prework/audio/Emerald-Park/01.mp3',
  "LiberTeens" => '
/home/christphrd/jukebox-cli-prework/audio/Emerald-Park/02.mp3',
  "Hamburg" =>  '
/home/christphrd/jukebox-cli-prework/audio/Emerald-Park/03.mp3',
  "Guiding Light" => '
/home/christphrd/jukebox-cli-prework/audio/Emerald-Park/04.mp3',
  "Wolf" => '
/home/christphrd/jukebox-cli-prework/audio/Emerald-Park/05.mp3',
  "Blue" => '
/home/christphrd/jukebox-cli-prework/audio/Emerald-Park/06.mp3',
  "Graduation Failed" => '
/home/christphrd/jukebox-cli-prework/audio/Emerald-Park/07.mp3'
}

def help
  puts "I accept the following commands:
  - help : displays this help message
  - list : displays a list of songs you can play
  - play : lets you choose a song to play
  - exit : exits this program"
end



def list(my_songs)
  #this method is different! Collect the keys of the my_songs hash and
  #list the songs by name
  songs = my_songs.keys
  songs.each {|song| puts "#{song}"}
end


def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  puts "Please enter a song name:"
  song_name = gets.chomp
  if my_songs.keys.include?(song_name)
    system "open #{my_songs[song_name]}"
    puts "Playing #{song_name}"
  else
    puts "Invalid input, please try again"
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(my_songs)
  help
  user_input = nil
  until user_input == "exit"
    puts "Please enter a command:"
    user_input = gets.chomp
    if user_input == "list"
      list(my_songs)
    elsif user_input == "play"
      play(my_songs)
    elsif user_input == "help"
      help
    end
  end
  exit_jukebox
end
