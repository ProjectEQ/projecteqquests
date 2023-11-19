function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello.  Please don't obscure my view of the [buoys].  I need to keep an eye on them.");
    elseif e.message:findi("buoys") then
        e.self:Say("Those small buoys are held in place by magic.  They are the only thing that keeps us from being destroyed by the maelstrom.  Without those augmentation stones, we would never have survived the journey out here, and this ship would be destroyed if only a few of them were to fail.  I am one of many tasked to watch over them and [lend them] my magic should they grow weak.");
    elseif e.message:findi("lend them") then
        e.self:Emote("looks at you for the first time since your conversation began. 'Honestly, I am not certain how this is done.  I understand the method well enough, and have had much training to learn that method, but I do not understand how it is that these devices actually work, or how long they will last.  We can only pray to Prexus that they last [long enough].");
    elseif e.message:findi("long enough") then
        e.self:Say("That, too, is something that I do not know.  I believe that only the leaders of the brotherhood fully understand what will happen here.  Please, discuss this with someone that is not on duty.  None of us can afford to be too distracted here.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end