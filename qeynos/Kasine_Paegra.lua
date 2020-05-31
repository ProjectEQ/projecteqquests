-- Turnin of Order of Thuder researched/discovered by @nilbog
-- Faction levels researched/coded by @noudess

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

	--Order of Thunder
    if(standing > -1 and item_lib.check_turn_in(e.trade, {item1 = 13288})) then
	e.self:CastSpell(200,e.other:GetID()); -- minor healing
        e.other:Faction(280,20);	--KoT
        e.other:Faction(221,-20);	--BloodSabers
        e.other:Faction(341,15);	--Priest of Life
        e.other:Faction(262,15);	--Guards of Qeynos
	end

	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1054 -- Kasine_Paegra
