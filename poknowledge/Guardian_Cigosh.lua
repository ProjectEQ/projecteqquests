-- poknowledge\Guardian_Cigosh.lua NPCID 202102

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Say("Welcome to New Tanaan, friend! Enjoy your visit and may your quest for enlightenment be a pleasant one!");
		end
end