function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello there.  Froak!  May the The [Truthbringer] bless you and all your endeavors.");
	elseif e.message:findi("Truthbringer") then
		e.self:Say("Ah, well, it's generally bad form to get into long...  froak!...  discussions about one's worship here.  Too many people think that our break from the gods, if indeed there has been such a thing, is something that we should not discuss.  Though I certainly think differently, and I am more than willing to talk about it if you are [interested].");
	elseif e.message:findi("interested") then
		e.self:Say("Froak!  Wonderful.  I hope you have had time to read the great text called From Pond to Paladin.  It is very informative.  In it, you will learn how much we owe to the gods.  Despite any flaws that we may claim to see in them, they gave us life.  My people sprang to life from the essence of Mithaniel Marr.  There is no denying that we are the children of the gods.  I believe that just like many children we have upset our parents, and we need to make an effort to [atone].");
	elseif e.message:findi("atone") then
		e.self:Say("Certainly we owe something to those that have given us life.  We may indeed be growing up into what can be called our adulthood, but that does not give us the right, and shouldn't give us the desire, to cause harm to the gods.  I still seek a way to make amends to them for what we have done.  Until then, I remain a humble servant of the Truth.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end