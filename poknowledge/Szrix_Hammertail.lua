-- poknowledge\Szrix_Hammertail.lua NPCID 202071

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Emote("speaks in a drawling hiss. his voice tainted with the dark accent of Cabilis. 'The Hammertails greet you. traveler. If you seek supplies of which to craft iron and steel weaponry. then you need search no further. The Hammertails will accommodate all of your needs at a fair price.'");
		end
end