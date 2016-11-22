--causeway/Korbuk_Brimblade.lua NPCID 
--Warrior Epic 2.0
function event_spawn(e)
	e.self:Say("At last, you have arrived. I've been waiting. Da time has come and your journey is at its end. You must hand over da sword so dat I may reign over everything in greatness! It is destined for me and me alone! No one else shall have it, least of all you! If you [won't give me da sword], I'll take it from you!");
end

function event_say(e)
	if(e.message:findi("won't give you the sword")) then
		e.self:Say("You have lived far too long. I shall end your miserable existence now!");
		--He attacks here
	end	
end

function event_death_complete(e)
	--eq.spawn2( ,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Essence of Kreljnok
end