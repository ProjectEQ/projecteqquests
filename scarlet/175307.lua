--scarlet\#Trigger_EliteSunRevenant.lua NPC ID 175307
--Wizard Epic 1.5
--scarlet\Elite_Sun_Revenant.lua Trigger

function event_spawn(e)
	eq.set_timer("delay",3000);
--	eq.zone_emote(15,"timer set");
end

function event_timer(e)
	eq.stop_timer("delay");
	eq.set_proximity(e.self:GetX()-50, e.self:GetX()+50, e.self:GetY()-50, e.self:GetY()+50);
--	eq.set_proximity(-407-18, -407+18, 782-18, 782+18);
--	eq.zone_emote(15,"proximity set");
--	eq.zone_emote(15,"x range: " .. e.self:GetX()-18 .. " " .. e.self:GetX()+18 .. "y range: " .. e.self:GetY()-18 .. " " .. e.self:GetY()+18);
	eq.enable_proximity_say();
end

function event_proximity_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if (e.message:findi("debug")) then
		e.self:Say("Lua Version: " .. _VERSION);
		e.self:Say("QGlobal 'debug': " .. qglobals["debug"]);
		if (qglobals["wiz_epic"] == "1") then
			e.self:Say("QGlobal 'wiz_epic': " .. qglobals["wiz_epic"]);
		else
			e.self:Say("QGlobal 'wiz_epic' not set");
		end
	end
	if (e.message:findi("gems") and qglobals["wiz_epic"] == "1") then
		eq.zone_emote(15, "A voice booms from the center of the cauldron. These gems are sacred, important to our survival, you shall not have them.");
		eq.spawn2(175306,525410,0,-334.12,-3.41,-37.06,10);
		eq.depop_with_timer();
	elseif (e.message:findi("gems")) then
		eq.zone_emote(15, "Unfortunately my friend, you are not a student of the sorcerous arts, and cannot be trusted with information so vital to our cause.");
	end
end

-- 