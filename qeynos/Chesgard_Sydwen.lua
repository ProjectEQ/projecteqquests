-- items: 12102, 12100, 7012, 7013, 7014, 7016, 4204, 4201, 4202, 4203, 4205, 4206, 4207, 4208, 4209, 4210, 4211, 4212, 4213, 4214, 4215, 4216, 4217, 4218, 4219, 4220, 4221, 4222, 4223, 4224, 4225, 5035, 5036, 6019, 6021, 18839, 17005, 6041, 2139, 2150
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
		e.other:SummonItem(12102); -- Item: Temple Blankets
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 12100})) then
		e.self:Say("Good work $class. The Karana Bandits have been plaguing the Rainkeepers flock for some time.  Take this as a small reward for your devotion.  Continue the fight against the Karana Bandits.  Ahh... I wish [Cheslin] was equally as skilled.");
		-- random bronze item reward
		e.other:SummonItem(eq.ChooseRandom(7012,7013,7014,7016,4204,4201,4202,4203,4204,4205,4206,4207,4208,4209,4210,4211,4212,4213,4214,4215,4216,4217,4218,4219,4220,4221,4222,4223,4224,4225,5035,5036,6019,6021)); -- Item(s): Bronze Dagger (7012), Bronze Rapier (7013), Bronze Spear (7014), Bronze Shortened Spear (7016), Bronze Breastplate (4204), Bronze Helm (4201), Bronze Mask (4202), Bronze Collar (4203), Bronze Breastplate (4204), Bronze Pauldron (4205), Splinted Bronze Cloak (4206), Bronze Girdle (4207), Bronze Vambraces (4208), Bronze Bracers (4209), Bronze Gauntlets (4210), Bronze Greaves (4211), Bronze Boots (4212), Small Bronze Helm (4213), Small Bronze Mask (4214), Small Bronze Collar (4215), Small Bronze Breastplate (4216), Small Bronze Pauldron (4217), Small Splinted Bronze Cloak (4218), Small Bronze Girdle (4219), Small Bronze Vambraces (4220), Small Bronze Bracers (4221), Small Bronze Gauntlets (4222), Small Bronze Greaves (4223), Small Bronze Boots (4224), Large Bronze Helm (4225), Bronze Scythe (5035), Bronze Claymore (5036), Bronze Mace (6019), Bronze Two Handed Hammer (6021)
		e.other:Ding();
		e.other:Faction(280,20,0); -- Knights of Thunder
		e.other:Faction(221,-20,0); -- Blood Sabers
		e.other:Faction(341,15,0); -- Priests of Life
		e.other:Faction(262,15,0); -- Guards of Qeynos
		e.other:AddEXP(6200);
		e.other:GiveCash(0,12,1,0); -- 1 gold, 12 silver
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18839})) then
		e.self:Say("Hmmph!! My son is living in a fantasy world. Still, you have done well. Take this as a token of appreciation. It is not much, but it may come in handy.");
		-- Backpack, Cast-Iron Warhammer, Raw-hide Gorget, Small Raw-hide Mask
		e.other:SummonItem(eq.ChooseRandom(17005,6041,2139,2150)); -- Item(s): Backpack (17005), Cast-Iron Warhammer (6041), Raw-hide Gorget (2139), Small Raw-hide Mask (2150)
		e.other:Ding();
		e.other:Faction(280,10,0); -- Knights of Thunder
		e.other:Faction(221,-10,0); -- Blood Sabers
		e.other:Faction(341,10,0); -- Priests of Life
		e.other:Faction(262,10,0); -- Guards of Qeynos
		e.other:AddEXP(1500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
