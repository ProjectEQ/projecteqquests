function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Gobu gobu. bakula erila [shamu eku]?");
	elseif(e.message:findi("shamu eku")) then
		e.self:Say("Weeee Weeee! Shamiku! Weeee!");
		e.self:CastSpell(2063,e.other:GetID()); -- Spell: Desert Sending
	end
end
