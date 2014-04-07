-- poknowledge\Derin_O-Danos.lua NPCID 202141

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Say("Welcome, traveler! If you are in need of supplies to brew potions, then you have come to the right man! Please, search my wares and perhaps you may find what you need.");
		end
end