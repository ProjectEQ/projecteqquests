-- poknowledge\Zosran_Hammertail.lua NPCID 202073 

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Emote("'s voice come forth in a drawling hiss. though unlike the other reptilian voices of the Cabilisian Iksars. this one's is almost melodic like the hum of a soft breeze through a winding canyon. 'Greetings traveler. If you are an adept in the art of smithing. then look no further than the Hammertails of New Tanaan for your supplies.'");
		end
end