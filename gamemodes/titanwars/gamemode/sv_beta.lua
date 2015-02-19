--[[
    Closed beta
    Adds hooks to allow certain 64bit Steam IDs in the server, and bar others from entering
]]

var betaIds = {
    "76561197997724399"
}

function GM:CanEnterBeta(steamid)
    if IsSinglePlayer() then
        return true
    end
    
    if not table.HasValue(betaIds, steamid) then
        return false
    end
    return true
end