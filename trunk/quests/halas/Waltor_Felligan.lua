function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello, me friend! I'm the resident healer o' Halas. Please inform me when ye've a need fer me talents to [bind wounds], [cure disease] or [cure poison]. Might I add, if ye're a young shaman o' Halas, ye can also [assist in gathering fungus].");
	if(e.other:GetFaction(e.self) < 6) then
		if(e.message:findi("cure disease")) then
			e.self:Say("Two small quantities o' wooly fungus are needed before we can cure yer malady.");
		elseif(e.message:findi("bind wounds")) then 
			e.self:Say("Before I bind yer wounds, ye must pay tribute to the Tribunal in the amount of ten gold coins.");
		elseif(e.message:findi("cure poison")) then
			e.self:Say("I'll be needing mammoth steaks to feed the unfortunate.  Then we'll drain the poison from yer veins.");
		elseif(e.message:findi("assist in gathering fungus")) then
			e.self:Say("As the wooly spiderlings get ready to molt, they'll carry wooly fungus. Oftentimes, one can find wooly fungus growing on their bellies. I use this in me healing practices. I'll reward ye if ye can fill this jar full o' the valuable fungus. Don't forget to combine them before ye return it to me. And have yerself some rations handy, or ye may find yerself snacking on this tasteless food source.");
			e.other:SummonItem(17946);
		end
	else
		if(e.message:findi("cure disease") or e.message:findi("bind wounds") or e.message:findi("cure poison") or e.message:findi("assist in gathering fungus")) then
			e.self:Say("The scales o' the Shamans o' Justice dinnae tip in yer favor. Ye'd best flee ye still have the chance.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13966})) then 						-- Jar of Fungus turn in for random spell
		e.other:SummonItem(eq.ChooseRandom(15203, 15270, 15271, 15275, 15036, 15075));
		e.self:Say("Aye! Ye've filled the jar. I'll see to it that Holana locks this away. Tis difficult to obtain and we can only spare the talents of our young shamans. Allow me to give ye a reward. Thank ye kindly fer yer service.");
		e.other:Faction(294, 10);													--faction with Shamen of Halas increased
		e.other:Faction(213, 10);													--faction with Merchants of Halas increased
		e.other:Faction(33, -30);													--faction with Circle of Unseen Hands decreased
		e.other:Faction(47,-30);													--faction with Coalition of Tradefolk decreased
		e.other:Faction(90,-30);													--faction with Ebon Mask decreased
		e.other:GiveCash(0,0,4,0);
		e.other:AddEXP(50);
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {gold = 10})) then
		e.self:Say("The scales have been balanced and the Tribunal has spoken. Yer body shall be saved.");
		e.other:Ding();
		e.self:CastSpell(17,e.other:GetID());
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13445})) then					-- poison cure for steak totally bogus text
		e.self:CastSpell(203,e.other:GetID());
		e.other:Ding();
		e.self:Say("Aye! I will draw the poison from your veins!");
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13967, item2 = 13967})) then 	-- disease cure for wooly fungus totally bogus text
		e.self:CastSpell(213,e.other:GetID());
		e.other:Ding();
		e.self:Say("Ah! Now I can cure yer malady.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
