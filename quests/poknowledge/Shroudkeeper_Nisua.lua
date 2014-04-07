-- poknowledge\Shroudkeeper_Nisua.lua NPCID 202327

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Say("You have come to take on the guise of Norrath's spirits? A wise choice you have made.  I am able to connect you to the ethereal world and offer you a great number of forms to take, all with varying power and abilities. The choice is yours!  When you wish to return to your natural form, ask me to [" .. eq.say_link("remove",false,"remove") .. "] the shroud.");
		end
end 