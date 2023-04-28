function event_say(e)
	local inktuta_status = tonumber(eq.get_data("inktuta_status-"..eq.get_zone_instance_id())) or 0
	local inktuta_bonus_loot = tonumber(eq.get_data("inktuta_bonus_loot-"..eq.get_zone_instance_id())) or 0
	if inktuta_status <= 1 then
		if e.message:findi("Hail") then
			e.self:Emote("screams");
			e.self:Say("No, don't kill me!' He relaxes slightly and gives you a strange look. 'Have you been afflicted by the curse? Are you mad!? Have you any idea [who Kelekdrix] is? She will be here any moment to destroy you all. Leave now, or there will be dire [consequences]!");
		elseif e.message:findi("who Kelekdrix") then
			e.self:Say("She watches over us as we eke out an existence in this forgotten place. She protects us from those that would do harm. She destroys the infidel that would dare trespass here. Don't take my word for it... ask her yourself.")
			eq.spawn2(296024,0,0,565,-495,6,0); -- NPC: Kelekdrix,_Herald_of_Trushar
			eq.set_data("inktuta_status-"..eq.get_zone_instance_id(), "1",tostring(eq.seconds("6h")));
			-- Bonus Loot
			local bonus_loot_value = tostring(inktuta_bonus_loot + 1)
			eq.set_data("inktuta_bonus_loot-"..eq.get_zone_instance_id(), bonus_loot_value,tostring(eq.seconds("6h")));
			eq.depop_with_timer();
		elseif e.message:findi("consequences") then
			e.self:Say("Very well, "..e.other:GetName()..". You brought this upon yourself.")
			eq.spawn2(296024,0,0,565,-495,6,0); -- NPC: Kelekdrix,_Herald_of_Trushar
			eq.set_data("inktuta_status-"..eq.get_zone_instance_id(), "1",tostring(eq.seconds("6h")));
			-- Bonus Loot
			local bonus_loot_value = tostring(inktuta_bonus_loot + 2)
			eq.set_data("inktuta_bonus_loot-"..eq.get_zone_instance_id(), bonus_loot_value,tostring(eq.seconds("6h")));
			eq.depop_with_timer();
		end
	end
end
