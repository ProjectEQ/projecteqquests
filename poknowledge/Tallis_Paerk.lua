-- poknowledge\Tallis_Paerk.lua NPCID 202143

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Say("'Greetings, traveler, and good day to you. If you are a blacksmith and are searching for supplies to further your trade, then perhaps my wares might be of service to you. Come and search my stock if you wish, and if anything catches your eye, do not hesitate to purchase them. My prices are always fair.'");
		end
end 