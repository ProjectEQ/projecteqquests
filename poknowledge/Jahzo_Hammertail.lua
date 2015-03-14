-- poknowledge\Jahzo_Hammertail.lua NPCID 202072

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Emote("speaks forth in a slow and almost whispered hiss of the Cabilisian accent. 'Aaaah. . . Good day to you. traveler. Perhaps you have come in search of supplies to further your trade as a smith. yes? Well. then look no further. $name. for the Hammertails hold the highest quality in their inventories and there is nothing that you won't find in our stock. we assure you.'");
		end
end
