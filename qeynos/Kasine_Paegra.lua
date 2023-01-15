-- Turnin of Order of Thuder researched/discovered by @nilbog
-- Faction levels researched/coded by @noudess
-- items: 13287, 13288

function event_say(e)
	local standing = e.other.GetModCharacterFactionLevel(e.other, 280);

	if(e.message:findi("hail")) then
		e.self:Say("May the blessings of the Rainkeeper protect you in your travels. I am Kasine Paegra, keeper of the [Order of Thunder] medallions.");
	elseif(standing < 0) then
		e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself.  Now leave, sewer rat!");
	elseif(e.message:findi("order of thunder")) then
		e.self:Say("The Order of Thunder is the medal awarded to a Knight of Thunder who has proven himself superior to the average warrior. All knights and priests of Thunder have one, save for the youngest members. Along with the medal comes great respect. You might say the wearer becomes more charismatic. Should you find one, please return it to Kasine Paegra, unless told otherwise.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	local standing = e.other.GetModCharacterFactionLevel(e.other, 280);
		
	--Order of Thunder (WK Paladin)
    if(standing > -1 and item_lib.check_turn_in(e.trade, {item1 = 13287})) then
	e.self:Say("You are a very honorable person. You have returned an Order of Thunder which you truly do not need. I give you the protection of the Rainkeeper to watch over you. May it keep you from harm. Go and serve.");
	e.self:CastSpell(11,e.other:GetID()); -- holy armor
        e.other:Faction(280,10);	--KoT (actual)
        e.other:Faction(221,-10);	--BloodSabers
        e.other:Faction(341,7);		--Priest of Life
        e.other:Faction(262,7);		--Guards of Qeynos
	e.other:AddLevelBasedExp(14.2, 3); -- Guessed max level - data from lvl1
	end
	--Order of Thunder (Drosco)
    if(standing > -1 and item_lib.check_turn_in(e.trade, {item1 = 13288})) then
	e.self:Say("You have returned an Order of Thunder which has been drained of all its power.  I wonder how this could have happened.  No doubt evil is behind this.  Thank you for its return.  I give you the blessings of Karana.  Go and serve the Rainkeeper.");
	e.self:CastSpell(200,e.other:GetID()); -- minor healing
        e.other:Faction(280,20);	--KoT (actual)
        e.other:Faction(221,-20);	--BloodSabers
        e.other:Faction(341,15);	--Priest of Life
        e.other:Faction(262,15);	--Guards of Qeynos
	e.other:AddLevelBasedExp(14.2, 3); -- Guessed max level - data from lvl1
	end

	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1054 -- Kasine_Paegra
