package.loadlib("playwavfile.dll", "luaopen_playwavfile")()

set_callback("tick", "OnTick")
set_callback("map load", "OnMapLoad")
set_callback("command", "OnCommand")

    local always=true
    local file = io.open("player_join_sound_settings.txt", "r")
    if (file) then
        io.input(file)
        local setting=io.read()
        if (setting=="always") then
            always=true
        end
        if (setting=="empty") then
            always=false
        end
        io.close(file)
    else
        local file = io.open("player_join_sound_settings.txt", "w")
        if (file) then
            io.output(file)
            io.write("always")
            io.close(file)
        end
    end
    
local prev_player_join_count=17

function OnMapLoad()
    prev_player_join_count=17

end

function OnCommand(command)
    if (command=="player_join_sound always") then
        always=true
        console_out("Every player that joins will make a sound")
        local file = io.open("player_join_sound_settings.txt", "w")
        if (file) then
            io.output(file)
            io.write("always")
            io.close(file)
            console_out("Sound setting preference saved")
        end
        return false
    end
    if (command=="player_join_sound empty") then
        always=false
        console_out("If you are alone, the first player that joins will make a sound")
        local file = io.open("player_join_sound_settings.txt", "w")
        if (file) then
            io.output(file)
            io.write("empty")
            io.close(file)
            console_out("Sound setting preference saved")
        end
        return false
    end
    if (command=="player_join_sound") then
        if (always==true) then
            console_out("Every player that joins will make a sound")
            console_out("Use `player_join_sound empty` or `player_join_sound always`")
        else
            console_out("If you are alone, the first player that joins will make a sound")
            console_out("Use `player_join_sound empty` or `player_join_sound always`")
        end
        return false
    end
end

function OnTick()
    
    
    local player_join_count=0
    for i=0,16,1 do
        local player = get_player(i)
        if (player ~= nil) then
            local client=get_player()
            if (player~=client) then
                player_join_count=player_join_count+1
            end
        end
    end
    if (always==true) then
        if (prev_player_join_count<player_join_count) then
            play_wav("player_join.wav")
            --console_out("player_join.wav")
        end
    else
        if (prev_player_join_count==0 and prev_player_join_count<player_join_count) then
            play_wav("player_join.wav")
            --console_out("sound_played")
        end
    end
    prev_player_join_count=player_join_count
    
end
--[[
Sound Effect by https://pixabay.com/users/universfield-28281460/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=124476 UNIVERSFIELD from https://pixabay.com/sound-effects//?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=124476 Pixabay
]]--
