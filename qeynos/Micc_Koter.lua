-- items: 13034
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Oh, hello, %s.  Don't mind my associate Klieb over there.  He gets quite grumpy when he drinks.  We are relatively new here ourselves but have made some fast friends in Qeynos.  This is a city of opportunity.",e.other:GetName()));
	elseif(e.message:findi("paw of opolla")) then
		e.self:Say("Some guy, don't know who he was, was in here claiming he had a lead where to find some information on the Paw of Opolla. I don't know anything about it except it is supposed to be the paw of some old gnoll bitch and have some magic powers. Buy me a Brandy and I might tell you where he was going.");
	elseif(e.message:findi("ranger")) then
		e.self:Say("Beats me. Try going to the north near Surefall Glade. That is where those goodie goodies tend to hang out.");
	elseif(e.message:findi("gnoll")) then
		e.self:Say("A gnoll is a stupid dog that walks upright. They are dirty and stinky and hate humans. Just like my pal Klieb here. Heh!");
		eq.signal(1071,1); -- NPC: Klieb_Torne
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13034})) then
		e.self:Say("Oh yes. Now I remember.. Ha ha.. He said he was going into the Plains of Karana to look for some gnoll lover by the name of Caninel. He said Caninel knew something about the location of the Paw of Opolla. It sounds like a bunch of rat crap to me , I never heard of no one named Caninel. But off he went.. Heck , finding one person in the Plains of Karana without a [ ranger ] to guide you is like looking for a clean spot on ol'Klieb here. Ha ha!!");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
		
function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Ha ha ha ha!");
	elseif(e.signal == 2) then
		e.self:Say("Lighten up, will ya, Klieb? You act like a dang [gnoll] sometimes..");
	end
end
