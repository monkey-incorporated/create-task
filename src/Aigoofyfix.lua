local board = {" ", " ", " ", " ", " ", " ", " ", " ", " "}
local winner = nil

local function drawBoard()
    print(" " .. board[1] .. " | " .. board[2] .. " | " .. board[3] .. " ")
    print("-----------")
    print(" " .. board[4] .. " | " .. board[5] .. " | " .. board[6] .. " ")
    print("-----------")
    print(" " .. board[7] .. " | " .. board[8] .. " | " .. board[9] .. " ")
end

local function isValidMove(move)
    return board[move] == " "
end

local function checkWinner()
    local winCombinations = {
        {1, 2, 3}, {4, 5, 6}, {7, 8, 9}, -- horizontal
        {1, 4, 7}, {2, 5, 8}, {3, 6, 9}, -- vertical
        {1, 5, 9}, {3, 5, 7}              -- diagonal
    }

    for i = 1, #winCombinations do
        local combination = winCombinations[i]
        local a, b, c = board[combination[1]], board[combination[2]], board[combination[3]]
        if a == b and b == c and a ~= " " then
            return a
        end
    end

    return nil
end

local function checkTie()
    for i = 1, 9 do
        if board[i] == " " then
            return false
        end
    end
    return true
end

local function playerMove(player)
    local move = tonumber(io.read())
    if isValidMove(move) then
        board[move] = player
    else
        print("That space is taken!")
        playerMove(player)
    end
end

local function computerMove(player)
    local move = math.random(1, 9)
    if isValidMove(move) then
        board[move] = player
    else
        computerMove(player)
    end
end

local function changePlayer(player)
    if player == "X" then
        return "O"
