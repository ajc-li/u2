#rules
#render of the game
#player input
#logic
def rules
  puts "Welcome to Towers of Pinoy nurd!\nHow To Play:\nEnter which tower you would like to move the disk from using the format '[x,y]'. There are four disks stacked on top of each other in column one at the start of the game. There are three columns and three columns only. Type 'q' if you're a queer to quit."
  end

def board_initial
   puts "_\n__\n___\n____\n"
 end

def render(game_layout)
  game_layout.size.downto(0) do |disk|
    puts "#{'_'*game_layout[0][disk].to_i} #{'_'*game_layout[1][disk].to_i} #{'_'*game_layout[2][disk].to_i}"
  end
end

def create_layout
  return [[4,3,2,1],[],[]]
  end

def check_input?(player_input)
    if player_input[1].to_i.between?(1,3) && player_input[3].to_i.between?(1,3)
      return true
    else
      puts "Enter a proper command nurd!"
        return false
    end
 end

def valid_move?(start_column,end_column)
  if start_column.empty?
    puts "There's nothing in that column you pleb..."
    return false
  elsif end_column.empty?
    return true
  elsif start_column.last > end_column.last
    puts "R u dum?! Ur starting disk cannot be placed ontop of a smaller disk... Choose again nerd!"
    return false
  else
    return true
    end
 end

def win?(game_layout)
  if (game_layout[1].size == 4 || game_layout[2].size == 4)
    return true
  else
    return false
  end
    
 end
    
def play
  game_end = false
  rules
  board_initial
  game_layout = create_layout()
  until game_end do
    invalid_input = true
    while invalid_input
      print ">"
      disk_move = gets.chomp
      disk_move_start = disk_move[1].to_i-1
      disk_move_end = disk_move[3].to_i-1
      if disk_move == 'q'
        puts "Cya nerd..."
        exit
      end
      if valid_move?(game_layout[disk_move_start],game_layout[disk_move_end]) && check_input?(disk_move)
        invalid_input = false
      end
        
    end
    
    game_layout[disk_move_end].push(game_layout[disk_move_start].last)
    game_layout[disk_move_start].pop()
    render(game_layout)
    game_end = win?(game_layout)   
  end
  puts "Good job nerd, you're not a complete pleb afterall..."   
 end

play