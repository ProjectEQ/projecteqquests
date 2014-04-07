-- poknowledge\Severg_O-Danos.lua NPCID 202139

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Emote("Aaah. . . Good day to you. "..e.other:GetName()..". I am Severg O'Danos. once a great alchemist upon Norrath with my brothers. but I have found a new calling here in New Tanaan. If you yourself are a dabbler in the art of potion making. then perhaps my wares will serve you well. Please. feel free to peruse my wares at your leisure.");
		end
end