function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Welcome aboard!  I hope you came prepared.  There's plenty of [danger] here for those looking for it.");
    elseif e.message:findi("danger") then
        e.self:Say("That's hard to tell for certain.  Few of our [scouts] return from Taelosia, so we're not exactly sure what dangers we face, but with all those that have gone missing, I can assure you that the danger is real.");
    elseif e.message:findi("scouts") then
        e.self:Say("Many Wayfarer scouts were sent out there when we first arrived.  So many good men and women that we fear will never return.  If you hear anything of them while you are on the continent, please let us know.  Help them if you can.  They have risked the most to get us here and we owe them whatever help we can offer.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end