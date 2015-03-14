-- poknowledge\Trep_Thilcan.lua NPCID 202057 

function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Say("This matter is far too advanced for you to handle.  Come back after you've killed a few more large rats");
		end
end