function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oooh.. Hello, [guard]. Please do not let the [Teir'Dal] at me again. I can take no more.");
	elseif(e.message:findi("teir'dal")) then
		e.self:Say("The Teir'Dal are what all elves call the dark elves, such as those vile torturers. I don't know what they are doing in Highpass.");
	elseif(e.message:findi("guard")) then
		e.self:Say("Then what are you doing down here? Leave before they shackle you to this cage or strap you to the operating table!");
	elseif(e.message:findi("fenn kaedrick")) then
		e.self:Say("Are you searching for the rogue named Fenn Kaedrick? He used to be locked in here with me. That Lady McCabe bailed him out just minutes before the Teir'Dal planned to operate on him. He said that if I ever did escape, to venture to the very roof of this keep and wait till he showed up to escort me away from here.");
		eq.unique_spawn(6184,0,0,-87,2,66,256); -- NPC: Fenn_Kaedrick
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
