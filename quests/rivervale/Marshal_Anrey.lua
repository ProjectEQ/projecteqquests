--Quest: Leatherfoot Raiders

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Stand at attention!! You don't look fit enough to toe-wrestle my grandma!! You cannot be in my squad!! Are you [petitioning] or are you a [visitor]?");
	elseif(e.message:findi("visitor")) then
		e.self:Say("Well, why didn't you say so?! Forgive me for hollering. Allow me to introduce myself. I am Marshal Anrey Leadladle, commander of the [Leatherfoot Raiders].");
	elseif(e.message:findi("petitioning")) then
		e.self:Say("So you want to be a [Leatherfoot Raider]? What kind of joke is this? Look at you! You're a mess! Where are you [from]?");
	elseif(e.message:findi("leatherfoot raiders")) then
		e.self:Say("You must be a visitor. The Leatherfoot Raiders are the elite force of the Guardians of the Vale. I command them. It is good to meet an outsider.");
	elseif(e.message:findi("from rivervale")) then
		e.self:Say("So you're from Rivervale?!! You must be some kind of freak. No halfling from Rivervale would look, smell and act anything like you. Well, freak, if you think you're stout enough to be a Leatherfoot Raider, you prove it!! You travel the lands and return to me a polar bear skin, a grizzly bear skin, a shark skin and an alligator skin. Then maybe, just maybe, I will let you wear the cap of a Leatherfoot Raider.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13761,item2 = 13756,item3 = 13075,item4 = 13749})) then -- Polar Bear Skin, Thick Grizzly Bear Skin, Shark Skin, Alligator Skin
		e.self:Say("Good work, "..e.other:GetName()..". You passed the first test. If you think you are one of us, return this cap to me along with a dagger from a Dark Elf for your true reward.");
		e.other:SummonItem(13941); -- Leatherfoot Skullcap
		e.other:Ding();
		e.other:AddEXP(1000);
		e.other:GiveCash(8,1,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13941,item2 = 13942})) then -- Leatherfoot Skullcap, Dragoon Dirk
		e.self:Say("Wonderful, "..e.other:GetName()..". You have proven yourself to the Leatherfoot Squad. Take this and wear it with honor.");
		e.other:SummonItem(12259); -- Leatherfoot Raider Skullcap
		e.other:Ding();
		e.other:AddEXP(5000);
		e.other:GiveCash(7,3,2,1);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:rivervale  ID:19059 -- Marshal_Anrey