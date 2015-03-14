-- poknowledge\Zosran_Hammertail.lua NPCID 202074

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Emote("addresses you in a hissing voice overwhelmed by the familiar accent of Cabilis. 'Welcome. stranger. to New Tanaan. You shall find little difficulty in gathering supplies for all known trades upon Norrath. If you seek to forge weaponry or armor of iron and steel. then the Hammertails are those at whom your search ends.'");
		end
end