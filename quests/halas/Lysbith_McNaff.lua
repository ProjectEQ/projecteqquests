function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail! Ye've come to [serve Halas]. have ye not? We're the Wolves o' the North and it is our task to defend our city from harm.");
	elseif(e.message:findi("serve halas")) then
		e.self:Say("Halas is surrounded by barren arctic tundra. We've many foes. Among them are the [orc troopers]. [ice goblins] and the ever-present polar bears.");
	elseif(e.message:findi("what orc troopers")) then
		e.self:Say("So. Ye think yerself strong enough to battle the snow orc troopers?  I pray to the Tribunal that ye are.  If ye can return to me four wrath orc wristbands  from the troopers' bodies. I'll reward ye with the [Seax].");
	elseif(e.message:findi("what ice goblins")) then
		e.self:Say("The ice goblins have plagued our community fer some time now.  At times. they even manage to get inside our walls. Fer the most part. they prey on travelers who pass through Everfrost Peaks. Since they're a weak race. we employ our youngest warriors to [protect the pass].");
	elseif(e.message:findi("what seax")) then
		e.self:Say("The Seax is a Northman warrior's piercing weapon.  Dinnae confuse this with another [weapon] related to the Seax called the Langseax.  The local rogues have also learned to master the Seax.  I'll only offer it to those who battle the [orc troopers].");
	elseif(e.message:findi("gnoll bounty")) then
		e.self:Say("I've placed a bounty on the gnolls o'Blackburrow.  Their whelps have invaded our land and we must carry the fight into their dens.  Join the fight and return three gnoll fangs as proof of yer victory in Blackburrow.  Do so, and earn the respect o' the Wolves o' the North.");
	elseif(e.message:findi("protect the pass")) then
		e.self:Say("Then travel to the Everfrost Peaks and take this pack with you.  I want you to return this pack to me when it is filled with the beaded ice necklaces of the Ice Goblins.  When it is filled, combine the items and return it to me and I shall decide if you deserve a reward for your deed.");
		e.other:SummonItem(17944);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12223, item2 = 12223, item3 = 12223, item4 = 12223})) then
		e.self:Say("Well done! You've proved yerself worthy o' this!");
		e.other:SummonItem(7322);
		e.other:AddEXP(300);
		e.other:Ding();
		e.other:Faction(361,5);			-- Wolves of the North
		e.other:Faction(294,5);			-- Shamen of Justice
		e.other:Faction(213,5);			-- Merchants of Halas
		e.other:Faction(311,5);			-- Steel Warriors
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13898})) then
		e.self:Say("Ye've done well, me young " .. e.other:Class() .. " .  We've gathered these to add to yer provisions.  While in the Everfrost Peaks, be on the watch fer any gnolls ye may find.  I declare there to be a [gnoll bounty].");
		e.other:AddEXP(3800);
		e.other:GiveCash(0,0,4,0);
		e.other:Ding();
		e.other:SummonItem(13005,1);	-- Reward: Iron Ration
		e.other:Faction(361,5);			-- Wolves of the North
		e.other:Faction(294,5);			-- Shamen of Justice
		e.other:Faction(213,5);			-- Merchants of Halas
		e.other:Faction(311,5);			-- Steel Warriors
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13915, item2 = 13915, item3 = 13915})) then	-- Gnoll Bounty - Return 3 Gnoll Fangs
		e.self:Say("Fine work, fine work!  The gnoll threat must be extinguished before it can ever fully grow.  Ye've done yer part to aid our cause.  Please allow me to repay ye with a few provisions and a wee bit o' coin.  Then, continue with yer good deeds.");
		e.other:AddEXP(3800);
		e.other:GiveCash(0,0,5,0);
		e.other:Ding();
		e.other:SummonItem(13005,1);	-- Reward: Iron Ration
		e.other:Faction(361,10);		-- Wolves of the North
		e.other:Faction(294,10);		-- Shamen of Justice
		e.other:Faction(213,10);		-- Merchants of Halas
		e.other:Faction(311,10);		-- Steel Warriors
	end
item_lib.return_items(e.self, e.other, e.trade)
end

-- Updated by Blaz
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
