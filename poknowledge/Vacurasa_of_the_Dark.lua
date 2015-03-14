-- poknowledge\Vacurasa_of_the_Dark.lua NPCID 202422

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Say("Hello "..e.other:GetName()..". If you possess a Dark Wedding Certificate you may hand it to me when you are ready to begin your wedding. If you are currently in a wedding party you may [" .. eq.say_link("enter the chapel",false,"enter the chapel") .. "] now.");
		end
end