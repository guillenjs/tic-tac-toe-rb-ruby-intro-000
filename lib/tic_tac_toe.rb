def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.find do |win_combination|
      board[win_combination[0]] == board[win_combination[1]] && board[win_combination[0]] == board[win_combination[2]] && position_taken?(board, win_combination[0])
end
end
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def turn_count(board)
  count = 0
  board.each do |index|
    if index == "X" || index == "O"
    count += 1
    end
  end
  count
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    "O"
  end
end

def full? (board)
  board.none? {|full_board| full_board == " " || full_board == nil}
end

def draw?(board)
  won?(board) == nil && full?(board) == true
end

def over?(board)
   won?(board) != nil || full?(board) == true  || draw?(board) == true
end

def winner(board)
if won?(board) != nil
    winner = board[won?(board)[0]]
  end
   draw?(board) == full?.nil
end
