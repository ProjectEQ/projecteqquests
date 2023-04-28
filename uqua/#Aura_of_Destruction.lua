--#Aura_of_Destruction (292028).lua

function event_spawn(e)
	eq.set_timer("aoe", 60 * 1000);
	eq.set_timer("checkstuff", 60 * 1000);
end

function event_timer(e)
    if e.timer == "aoe" then
		local get_client=eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),360 * 360);
		--get client within 360 radius: can you get selected while outside room?		
		if get_client.valid then
			e.self:CastSpell(5120,get_client:GetID()); --Spell: withering destruction
		end
    elseif e.timer == "checkstuff" then
        if eq.get_entity_list():IsMobSpawnedByNpcTypeID(292067) then
	        eq.signal(292067,1); -- #Guardian_of_Destruction (292067) heal him
	        eq.zone_emote(MT.Yellow,"I can feel the energy from the guardian course through my soul! More! Give me more, I say! Trushar, give me the power to destroy these creatures and send them and the others back from where they came!");
        else
	        eq.signal(292069,2); --#Vrex_Barxt_Qurat (292069) heal him instead
	        eq.zone_emote(MT.Yellow,"They have destroyed the guardian before the transfer could be completed. Regardless, you must transfer your remaining energy to me, my minions.");
        end
    end
end
