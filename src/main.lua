local board = {" ", " ", " ", " ", " ", " ", " ", " ", " "}
local player = "X"
local winner = nil

local play = true

--make the player go againt the computer

local function drawBoard()
    print(" " .. board[1] .. " | " .. board[2] .. " | " .. board[3] .. " ")
    print("-----------")
    print(" " .. board[4] .. " | " .. board[5] .. " | " .. board[6] .. " ")
    print("-----------")
    print(" " .. board[7] .. " | " .. board[8] .. " | " .. board[9] .. " ")
end

local function checkWinner()
    if board[1] == board[2] and board[2] == board[3] and board[1] ~= " " then
        winner = board[1]
    elseif board[4] == board[5] and board[5] == board[6] and board[4] ~= " " then
        winner = board[4]
    elseif board[7] == board[8] and board[8] == board[9] and board[7] ~= " " then
        winner = board[7]
    elseif board[1] == board[4] and board[4] == board[7] and board[1] ~= " " then
        winner = board[1]
    elseif board[2] == board[5] and board[5] == board[8] and board[2] ~= " " then
        winner = board[2]
    elseif board[3] == board[6] and board[6] == board[9] and board[3] ~= " " then
        winner = board[3]
    elseif board[1] == board[5] and board[5] == board[9] and board[1] ~= " " then
        winner = board[1]
    elseif board[3] == board[5] and board[5] == board[7] and board[3] ~= " " then
        winner = board[3]
    end
end

local function checkTie()
    local tie = true
    for i = 1, 9 do
        if board[i] == " " then
            tie = false
        end
    end
    if tie == true then
        winner = "tie"
    end
end

local function playerMove()
    print("Player " .. player .. ", enter a number from 1 to 9:")
    local move = tonumber(io.read())
    if board[move] == " " then
        board[move] = player
    else
        print("That space is taken!")
        playerMove()
    end
end

local function computerMove()
    local move = math.random(1, 9)
    if board[move] == " " then
        board[move] = player
    else
        computerMove()
    end
end

local function changePlayer()
    if player == "X" then
        player = "O"
    else
        player = "X"
    end
end

local function play()
    while winner == nil do
        drawBoard()
        playerMove()
        checkWinner()
        checkTie()
        changePlayer()
        computerMove()
        checkWinner()
        checkTie()
        changePlayer()
    end
    drawBoard()
    if winner == "tie" then
        print("It's a tie!")
    elseif
        winner == "X" then
        print("You win!")
    else
        print("Try again! computer wins!")
    

        
    end
end

while play do 
    play()
    print("Do you want to play again? (y/n)")
    local answer = io.read()
    if answer == "y" then
        board = {" ", " ", " ", " ", " ", " ", " ", " ", " "}
        player = "X"
        winner = nil
    else
        print("Thanks for playing!")
        play = false
    end


end



