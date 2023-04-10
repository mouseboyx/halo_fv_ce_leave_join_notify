package.loadlib("playwavfile.dll", "luaopen_playwavfile")()

set_callback("tick", "OnTick")
set_callback("map load", "OnMapLoad")


local prev_player_join_count=0


function OnMapLoad()
    prev_player_join_count=0

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

    if (prev_player_join_count>player_join_count) then
        play_wav("player_leave.wav")
    end
   
    prev_player_join_count=player_join_count
    
end
--[[
Sound Effect by https://pixabay.com/users/universfield-28281460/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=143034 UNIVERSFIELD from https://pixabay.com//?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=music&amp;utm_content=143034 Pixabay
]]--
