# chess_game_cli_app
They say it's easier to create something than fix another. This will be the successor of the prior version 'cli_chess'. That failed horribly due to rushing things and disregarding best practice. It is now stuck in tangle of sphaghetti code that is very hard to debug. 


Organization Plan

Main_menu
  #will either start a new game or load saved games
  #it does so by creating ChessBoard.new or loading saved instanced of ChessBoard
  #APIs 
    new_game 
      #create an instance of GameRound and init with ChessBoard.new
    load_game(saved_ChessBoard_instance)
      #create an instance of GameRound and init with ChessBoard input
    list_load_game
      #list out all loaded game name

GameRound
  #manipulates the ChessBoard input using the APIs of the board
  #Play the game until player chooses to save or quit.
  #announg winner when a player won and return game to MainMenu
  #APIs
    game_loop
      #loops the game letting players take turn moving
    player_input
      #returns an array of coordinate for next move or string of command
      #will be used for saving or quiting the game
    make_move(cur_pos, new_pos)
      #calls ChessBoard API to update board that a move has been made
      #calls ChessBoard API to changeplayer turn
    quit
      #stop the game and ruturn to MainMenu
    save
      #save ChessBoard instance to load game DIR
      #stop game and return to MainMenu or call quit


ChessBoard
  #Will contain the board array itself
  #has instance variable for whos turn it is to play @turn with accesr
  #has instance variable for board @board with accesr  
  #creates an empty 8x8 2d array at initialize
  #init chess pieces if not yet init
  #APIs
    init_chesspiece(piece_name, pos, team)
      #create a class_instance of a piece and place in the given position
    set_board_to_default
      #set pieces in thier initial pos
    update_turn
      #updates an instance varialbe that keeps track on whos turn
    move_piece(new,cur)
      #moves a piece in the board

    valid?(cur,new,board)
      #uses chess_rule modules and return true if the a move is valid
      # also returns a message
      #determine if:
        a piece is allowed to make the given moved
        if check: the moves removes checkmate status
        
      #pseudo code
      valid?(cur, new,board)
        return when_player_is_check(cur,new,board) if check?
        return valid_selector(cur,new,board)
      end

      when_player_is_check(cur, new, board)
        board_copy = copy(board)
        
      end
    check_mate?
      #uses chess_rule modules and return true if there is a move that can save the king

ChessPiece
  #create an instance of of chess pieces. 
  #initialize with a name and team of the piece to to be made
  #APIs
    Create_piece(piece_name,piece_team)
    






      

    