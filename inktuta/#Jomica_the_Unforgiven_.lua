function event_say(e)
	e.self:Say("Watch yourself, "..e.other:GetName()..". These beasts bear the mark of a curse of indescribable power.")
end

function event_signal(e)
	local inktuta_bonus_loot = tonumber(eq.get_data("inktuta_bonus_loot-"..eq.get_zone_instance_id())) or 0
	if e.signal == 1 then -- Save Jom
		e.self:Say("That was close! Thank you for saving me."); -- TODO: Get Live Text
		local bonus_loot_value = tostring(inktuta_bonus_loot + 4);
		eq.set_data("inktuta_bonus_loot-"..eq.get_zone_instance_id(), bonus_loot_value,tostring(eq.seconds("6h")));
		eq.depop();
	elseif e.signal == 2 then -- Kill Jom
		e.self:Emote("screams in terror, 'Auugh, nooooo!'");
		eq.zone_emote(MT.Yellow, "As the cursebearer comes into contact with the prophet, Jomica unleashes an ear-piercing scream. Within moments his pale flesh writhes, blood oozes from his pale crackled skin and drips down his robes to form a foul steaming puddle. The scream transitions into a pathetic gurgle as his larynx and internal organs liquefy.")
		local bonus_loot_value = tostring(inktuta_bonus_loot + 8);
		eq.set_data("inktuta_bonus_loot-"..eq.get_zone_instance_id(), bonus_loot_value,tostring(eq.seconds("6h")));
		eq.depop();
	end
end
