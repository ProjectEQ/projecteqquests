-- A_Mystic_Voice (152019) in the Nexus - coordinator for spire teleports

local ThreadManager = require("thread_manager");
 
function event_spawn(e)
	eq.set_timer("heartbeat", 100);
    
	ThreadManager:Clear();
	ThreadManager:Create("Norrath", old_world_cycle, e);
	ThreadManager:Create("Velious", velious_cycle, e);
end
 
function event_timer(e)
    evt = e;
    ThreadManager:Resume("Norrath");
    ThreadManager:Resume("Velious");
end

function old_world_cycle(evt)
    while true do
        ThreadManager:Wait(300);
        eq.zone_emote(MT.Default, "A Mystic Voice says 'The portals to Odus, Antonica, Faydwer, and Kunark will become active in five minutes. Please begin gathering in the portal areas.'")
        ThreadManager:Wait(120);
        eq.zone_emote(MT.Default, "A Mystic Voice says 'As a reminder, the portals to Odus, Antonica, Faydwer, and Kunark will become active in three minutes.'")
        ThreadManager:Wait(120);
        eq.zone_emote(MT.Default, "A Mystic Voice says 'One minute till teleportation to Odus, Antonica, Faydwer, and Kunark. Please stand on the pad and you will be teleported shortly.'")
        ThreadManager:Wait(60);
        old_world_port(eq.get_entity_list():GetClientList());
    end
end

function velious_cycle(evt)
    while true do
        eq.zone_emote(MT.Default, "A Mystic Voice says 'In approximately ten minutes the portals will become active and will transport you back to Odus, Antonica, Faydwer, and Kunark.  In five minutes the portal to Velious will become active.'")
        ThreadManager:Wait(120)
        eq.zone_emote(MT.Default, "A Mystic Voice says 'The portal to Velious will become active in three minutes.  Please begin gathering in the portal area.'")
        ThreadManager:Wait(120);
        eq.zone_emote(MT.Default, "A Mystic Voice says 'One minute till teleportation to Velious.  Please stand on the pad and you will be teleported shortly.'")
        ThreadManager:Wait(60);
        velious_port(eq.get_entity_list():GetClientList());
        ThreadManager:Wait(300);
    end
end

function old_world_port(player_list)
	if player_list ~= nil then
		for player in player_list.entries do
            if player:CalculateDistance(-363, 39, -44) <= 22 then -- antonica platform & port
				player:SpellFinished(2708, player);
			elseif player:CalculateDistance(30, 350, -44) <= 22 then -- faydwer platform & port
				player:SpellFinished(2706, player);
            elseif player:CalculateDistance(370, -37, -44) <= 22 then -- odus platform & port (shared locs with velious)
				player:SpellFinished(2707, player);
			elseif player:CalculateDistance(110, -462, -59) <= 22 then -- kunark platform & port
				player:SpellFinished(2709, player);
			end
		end
	end
end

function velious_port(player_list)
	if player_list ~= nil then
		for player in player_list.entries do
            if player:CalculateDistance(370, -37, -44) <= 22 then -- velious platform & port (shared locs with odus)
				player:SpellFinished(2062, player);
			end
		end
	end
end