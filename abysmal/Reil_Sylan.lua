function event_say(e)
	if e.message:findi("Hail") then
		e.other:Message(MT.White,"Hail,' Reil says as he stares out into the sea. 'I'm amazed, really.  She's such a beautiful and massive ship, and yet she rides the waves like a bit of cork.  I'm proud of the work we've done here.  I'm glad I did my [part].");
	elseif e.message:findi("part") then
		e.self:Say("My efforts were little.  I helped gather people together at the start, traveling from camp to camp and telling people what others said needed to be done.  Then later I assisted in the gathering of lumber and put my hands to work on shaping the hull.  I was nothing more than grunt labor, holding pieces where I was told and doing what the [shipwright] told me to do.");
	elseif e.message:findi("shipwright") then
		e.self:Say(" had the pleasure of working with Hemae Twinebraid himself.  He's tireless and brilliant.  Why, if we hadn't been there to help, I suspect he'd have built the [Queen] all by himself!");
	elseif e.message:findi("Queen") then
		e.self:Say("Aye.  I suppose there aren't that many folks that know why Morden named this ship Queen of Thorns.  I wasn't lucky enough to be there the day he made that decision, but I've heard two different tales about it.  The first says that he named it in memory of his first ship, Thorn of the White Rose.  The other, says that he named it after all of us Wayfarers, as we are constantly a pain in everyone's rear.' Reil smiles. 'I believe that both are true, but regardless of her name, her purpose has been fulfilled.  I've done my small part.  I guess now it's up to heroes like you to do the rest.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
