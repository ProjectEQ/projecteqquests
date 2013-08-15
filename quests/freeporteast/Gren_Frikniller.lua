function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Aya. howdy there. %s.  The name's Gren Frikniller.  'Niller the Killer' The only person who can give me a run for my money is my [sister].",e.other:GetName()));
	elseif(e.message:findi("sister")) then
		e.self:Say("Ah, my sister Falia has traveled here all the way from Rivervale. I hear that she's been staying up in North Freeport, but I haven't had a chance to find her yet. If you get some spare time, could you take this letter to her for me? Thanks, $name, you're really not so bad after all.");
		e.other:SummonItem(18925); -- Letter to Falia
	elseif(e.message:findi("rivervale")) then
		e.self:Say("Rivervale?  Well. it's far from here. thank Fizzlethorpe.  They got more wanted posters with my face on 'em than they got trees there.  I mean. 'tweren't my fault either.  Just a friendly game of cards. and this little weasel catches me with an extra ace up my sleeve.  Can you believe this kid calls ol' Grenny here a cheater. right in front of the whole bar?!!  So. you know. I gave him a quick cut. ear to ear. with me dagger...  just to shut him up. you know.  Suddenly. I'm a murderer?  For simply defending myself?! Go figure!");
	elseif(e.message:findi("elisi")) then
		e.self:Say("Elisi runs the show around here.  She's usually a pretty busy lady.  Dang smart. too.  And it's my sworn duty to protect her at any cost. even with my very own life.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13159})) then
		e.self:Say(string.format("What's this? Oh, ol' Grandpa Frikniller's lucky necklace, huh? I'll bet this broken piece of junk won't even get me a sip of ale up at the bar. And lucky? How lucky could this thing be? Poor gramps was lonely and copperless his whole life. Bah!! Oh, well. Here's some coin for your efforts, thanks, %s.",e.other:GetName()));
		e.other:Ding();
		e.other:Faction(48,1,0); -- Coalition of Tradefolk Underground
		e.other:Faction(47,1,0); -- Coalition of Trade Folk
		e.other:Faction(31,1,0); -- Carson McCabe
		e.other:Faction(53,1,0); -- Corrupt Qeynos Guards
		e.other:Faction(105,1,0); -- Freeport Militia
		e.other:AddEXP(200);
		e.other:GiveCash(6,1,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	e.self:Say("Yea.. Bite that tongue of yours, there shorty, or I might just have to cut it off to shut you up for good.");
end

-- END of FILE Zone:freeporteast -- Gren_Frikniller
