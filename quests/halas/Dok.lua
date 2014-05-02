function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Fine day to ye, " .. e.other:GetName() .. ".  Welcome to me shop.  If ye're searchin' fer a [cigar], ye won't be findin' any, more's th' pity.");
	elseif(e.message:findi("cigar")) then
		e.self:Say("I was hoping to perfect me creation I was callin' the 'cigar.' but I'm afraid I just couldn't get it right.  To keep from settin' meself on fire, I switched me talents to makin' candles.  I could use help from a person such as yerself.  Ye could [collect the wax] fer me - the candle-makin's.");
	elseif(e.message:findi("collect the wax")) then
		e.self:Say("Grreatt!!  Take this wax jarr.  Head to any place ye can find the wee ones they call bixies. I'm afraid ye're going to hafta bash 'em and search to find out if they're carrying any honeycombs.  If they are, then ye can fill the jar with them and combine them, then return the full honeycomb jar to me. I'll be givin' ye a special candle if ye can do that fer me.");
		e.other:SummonItem(17958);
	elseif(e.message:findi("any information about the crime")) then
		e.self:Say("Aye. I happened upon the crime scene, but too late, more's the pity.  I grabbed fer one of the rogues and got only a handful of his shirt.  Before I knew it, I was left holding his sweaty shirt and he was far from the scene.  I called fer the guards and they summoned the shaman.  Methinks one died and one got away in the chase.  I've heard rumors that the leader of [Clan McMannus] has spotted the culprit.  Ye should go to the leader of Clan McMannus and tell him ye're [searching for the fugitive].");
	elseif(e.message:findi("clan mcmannus")) then
		e.self:Say("Clan McMannus were instructed by the Council to live far away from Halas.  They now live in the Western Plains of Karana and supply Halas with food and materials from the warmer regions.");
	elseif(e.message:findi("sweaty shirt")) then
		e.self:Say("Now, why would ye be wantin' that smelly thing?!!  I no longer have it.  [Tundra Jack] came into me shop and bought it from me.  He says he can wash it good and make a new collar for Iceberg out of it.");
	elseif(e.message:findi("tundra jack")) then
		e.self:Say("Well, now, let's see...  His name is Tundra Jack.. me first guess would be that ye might find him on the frozen tundra of Everfrost, eh?");
	elseif(e.message:findi("candle of bravery")) then
		e.self:Say("I can make ye a Candle o' Bravery. I'll need th' candlestick, or pieces of it!! And I need a honeycomb. Oh!! And I need a pouch o' Underfoot soil as well.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12222})) then
		e.self:Say("Great work!! Now I can make more candles! Here ye are, me fri. I call this the Everburn Candle. It has a wee bit o' magic in it. I hope ye like it.");
		e.other:SummonItem(12220);
		e.other:GiveCash(0,0,0,1);
		e.other:AddEXP(250);
		e.other:Ding();
		e.other:Faction( 213,3);
		e.other:Faction( 361,3);
		e.other:Faction( 294,3);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12275, item2 = 12276, item3 = 12282, item4 = 13953})) then
		e.self:Say("Here is your Candle o' Bravery.");
		e.other:Faction(213,25);
		e.other:Faction(361,25);
		e.other:Faction(294,25);
		e.other:AddEXP(50000);
		e.other:SummonItem(12277);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
