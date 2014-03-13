function event_say(e)
	local fac = e.other:GetFaction(e.self);
	
	if(e.message:findi("hail")) then
		e.self:Say('May Karana guide your strengths.  Are you a [citizen of Qeynos] or a visitor?');
	-- Same dialogue for both : 'I am a citizen' and 'I am not a citizen'
	elseif(e.message:findi("citizen of qeynos")) then
		e.self:Say("Then I would urge you to attend daily services in the Temple of Thunder.  You are a [member of Thunder] are you not?  Or maybe I am mistaken and you are just [lost].");
	elseif(e.message:findi("lost")) then
		e.self:Say("Then study and spread the words of Karana the Rainkeeper.  May all the storms in your heart be controlled by the Rainkeeper.  You are young to the world just as [Cheslin] is.");
	elseif(e.message:findi("member of thunder") and fac <= 4) then
		e.self:Say("I welcome you. Karana cares for all of His flock. He bestows a touch of His power upon the souls of the Clerics and Paladins of our temple. We look after His flock. Speaking of which, I require the assistance of a young paladin to [deliver provisions to needy members].");
	elseif(e.message:findi("ready") and fac > 4) then
		e.self:Say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us.  But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
	elseif(e.message:findi("karana bandit")) then
		e.self:Say("In the Plains of Karana can be found the [Karana Bandits].  They plague our followers and dare to use the name of the Rainkeeper as title.  For this, Karana commands their deaths.  I have a bounty for every returned Bandit Sash, collectible by members only.  For clerics, Gehna has a bounty on Binder Spectacles.");
	elseif(e.message:findi("cheslin")) then
		e.self:Say("My son, Cheslin, is currently in training to be a Qeynos Guard.  I fear it was not his calling.  He is not quite in our realm of reality.  He spent too many years of playing games of warriors and dragons.  He will be doing his first patrols in Qeynos Hills this week.  If you are near there, I would appreciate it if you would watch and see him safely through his first patrols.  Tell him I sent you.");
	elseif(e.message:findi("deliver provisions to needy members")) then
		e.self:Say("Good show!! Here you are, young knight. Take these blankets to any resident who desires warmth. Ask them if they are followers of Karana, then ask if they require temple blankets. Be careful, the plains are quite dangerous for a young knight.");
		e.other:SummonItem(12102);
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 12100})) then
		e.self:Say("Good work $class. The Karana Bandits have been plaguing the Rainkeepers flock for some time.  Take this as a small reward for your devotion.  Continue the fight against the Karana Bandits.  Ahh... I wish [Cheslin] was equally as skilled.");
		-- random bronze item reward
		e.other:SummonItem(eq.ChooseRandom(7012,7013,7014,7016,4204,4201,4202,4203,4204,4205,4206,4207,4208,4209,4210,4211,4212,4213,4214,4215,4216,4217,4218,4219,4220,4221,4222,4223,4224,4225,5035,5036,6019,6021));
		e.other:Ding();
		e.other:Faction(183,10,0); -- Knights of Thunder
		e.other:Faction(21,-10,0); -- Blood Sabers
		e.other:Faction(257,10,0); -- Priests of Life
		e.other:Faction(135,10,0); -- Guards of Qeynos
		e.other:AddEXP(2000);
		e.other:GiveCash(0,12,1,0); -- 1 gold, 12 silver
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18839})) then
		e.self:Say("Hmmph!! My son is living in a fantasy world. Still, you have done well. Take this as a token of appreciation. It is not much, but it may come in handy.");
		-- Backpack, Cast-Iron Warhammer, Raw-hide Gorget, Small Raw-hide Mask
		e.other:SummonItem(eq.ChooseRandom(17005,6041,2139,2150));
		e.other:Ding();
		e.other:Faction(183,10,0); -- Knights of Thunder
		e.other:Faction(21,-10,0); -- Blood Sabers
		e.other:Faction(257,10,0); -- Priests of Life
		e.other:Faction(135,10,0); -- Guards of Qeynos
		e.other:AddEXP(1500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end