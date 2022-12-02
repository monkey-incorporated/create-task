local board = {" ", " ", " ", " ", " ", " ", " ", " ", " "}
local player = "X"
local winner = nil

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
    if tie then
        winner = "tie"
    end
end

local function playTurn()
    local valid = false
    while not valid do
        print("Player " .. player .. ", enter a number from 1 to 9:")
        local input = io.read()
        local num = tonumber(input)
        if num ~= nil and num >= 1 and num <= 9 then
            if board[num] == " " then
                board[num] = player
                valid = true
            end
        end
    end
end

local function switchPlayer()
    if player == "X" then
        player = "O"
    else
        player = "X"
    end
end

local function main()
    while winner == nil do
        drawBoard()
        playTurn()
        checkWinner()
        checkTie()
        switchPlayer()
    end
    drawBoard()
    if winner == "tie" then
        print("It's a tie!")
    else
        print("Player " .. winner .. " wins!")
    end
end

main()

