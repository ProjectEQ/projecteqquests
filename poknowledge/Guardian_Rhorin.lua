-- poknowledge\Guardian_Rhorin.lua NPCID 202106

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Emote("grins a wide toothy smile and says. 'You may want to watch yourself. unless you are looking to enter a painful situation.  The portals in this district will lead someone of your race to a city of the wrong alignment.  If you use the portals and end up in the wrong place. you'll be crushed for certain.");
		end
end