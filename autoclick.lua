local autoclicking = false

concommand.Add("autoclick_20ms", function()
    autoclicking = not autoclicking
    print("Auto-clicker is now: " .. (autoclicking and "ON" or "OFF"))
end)

local isClicking = false

hook.Add("CreateMove", "FastestAutoClicker", function(cmd)
    if autoclicking then
        -- This alternates every single frame between clicking and not clicking
        isClicking = not isClicking
        
        if isClicking then
            cmd:SetButtons(bit.bor(cmd:GetButtons(), IN_ATTACK))
        else
            cmd:RemoveKey(IN_ATTACK)
        end
    end
end)