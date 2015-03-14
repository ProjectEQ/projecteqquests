-- poknowledge\Serin_O-Danos.lua NPCID 202079

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Say("Greetings and well met,"..e.other:GetName()..". I am Serin O'Danos, one of three alchemists that have left our native world of Norrath in search of more peaceful pastures here in New Tanaan. We make a modest, humble living and pride ourselves on the benefit our knowledge gives to aspiring and adept alchemists alike. If you are in need of ingredients to brew a potion, then search our wares at your convenience and leisure. The O'Danos' are more than happy to accommodate your needs.");
		end
end