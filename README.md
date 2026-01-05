# chess_game_cli_app
They say it's easier to create something than fix another. This will be the successor of the prior version 'cli_chess'. That failed horribly due to rushing things and disregarding best practice. It is now stuck in tangle of sphaghetti code that is very hard to debug. 


Organization Plan

Main_menu
  #will either start a new game or load saved games
  #APIs 
    new_game 
      # start game round with all pieces in default
    load_game(load_game_name)
      # (input) a hash with whos turn and 2d array of the chess board
      #will start game round with the given board and who's turn it is to move
    list_load_game
      #list out all loaded game name

GameRound
  #Plays the game
  #MainMenu will give instance of ChessBoard that it will manipulate
  #handle:
    #prints board
    #gets player input
    #validate if move is valid
    #move pieces
    #player taking turn moving
    #saves game
  #APIs
    initialize
      #
    game_loop
      #loops game until player choose to save or a checkmate
    print_board
      #print a basic chess_board
    get_player_input
      #gets player input thru #gets and format it for use
      #save_game
      #saves game
    move_piece
      #move a piece by calling move_piece in chess_board
    Valid?
      #determines if the move is valid
      #check? path_clear? peice can move as such?
    #save_game
      access the save game DIR and save the ChessBoard instance

ChessBoard
  #


      

    