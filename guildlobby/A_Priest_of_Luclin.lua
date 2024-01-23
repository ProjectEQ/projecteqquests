function event_say(e)
	if e.message:findi("hail") then
		e.self:Emote("continues to chant towards the altar as you approach. 'If you are in need of our aid speak to the disciple and bring me one of the soulstones that he sells. I must continue to delve into the twilight of our world in search of lost souls.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local failure = "This focus is not powerful enough to summon the remnants of your former self.  The disciple of Luclin can help you select an appropriate focus."
	local player_level = e.other:GetLevel();

	if item_lib.check_turn_in(e.trade, {item1 = 76013}) then -- Items: Minor Soulstone
		if player_level < 21 then
			summon_corpse(e);
		else
			e.self:Say(failure);
			e.other:SummonItem(76013);
		end
	elseif item_lib.check_turn_in(e.trade, {item1 = 76014}) then -- Items: Lesser Soulstone
		if player_level < 31 then
			summon_corpse(e);
		else
			e.self:Say(failure);
			e.other:SummonItem(76014);
		end
	elseif item_lib.check_turn_in(e.trade, {item1 = 76015}) then -- Items: Soulstone
		if player_level < 41 then
			summon_corpse(e);
		else
			e.self:Say(failure);
			e.other:SummonItem(76015);
		end
	elseif item_lib.check_turn_in(e.trade, {item1 = 76016}) then -- Items: Greater Soulstone
		if player_level < 51 then
			summon_corpse(e);
		else
			e.self:Say(failure);
			e.other:SummonItem(76016);
		end
	elseif item_lib.check_turn_in(e.trade, {item1 = 76017}) then -- Items: Faceted Soulstone
		if player_level < 56 then
			summon_corpse(e);
		else
			e.self:Say(failure);
			e.other:SummonItem(76017);
		end
	elseif item_lib.check_turn_in(e.trade, {item1 = 76018}) then -- Items: Pristine Soulstone
		if player_level < 71 then
			summon_corpse(e);
		else
			e.self:Say(failure);
			e.other:SummonItem(76018);
		end
	elseif item_lib.check_turn_in(e.trade, {item1 = 76019}) then -- Items: Glowing Soulstone
		if player_level < 76 then
			summon_corpse(e);
		else
			e.self:Say(failure);
			e.other:SummonItem(76019);
		end
	elseif item_lib.check_turn_in(e.trade, {item1 = 76048}) then -- Items: Prismatic Soulstone
		if player_level < 81 then
			summon_corpse(e);
		else
			e.self:Say(failure);
			e.other:SummonItem(76048);
		end
	elseif item_lib.check_turn_in(e.trade, {item1 = 76065}) then -- Items: Iridescent Soulstone
		if player_level < 86 then
			summon_corpse(e);
		else
			e.self:Say(failure);
			e.other:SummonItem(76065);
		end
	elseif item_lib.check_turn_in(e.trade, {item1 = 76274}) then -- Items: Phantasmal Soulstone
		if player_level < 91 then
			summon_corpse(e);
		else
			e.self:Say(failure);
			e.other:SummonItem(76274);
		end
	elseif item_lib.check_turn_in(e.trade, {item1 = 76274}) then -- Items: Luminous Soulstone
		if player_level < 96 then
			summon_corpse(e);
		else
			e.self:Say(failure);
			e.other:SummonItem(76274);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function summon_corpse(e)
	local x, y, z, h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading();
	local char_id = e.other:CharacterID();
	local corpse_count = e.other:GetCorpseCount();

	if corpse_count > 0 then
		eq.summon_all_player_corpses(char_id,x,y,z,h)
	end

	e.self:Emote("takes your stone and places it on the altar. Shadows begin to drift across the floor and over the altar and finally onto the soulstone.  The priest's voice chants with intensity and is soon joined with several others as the shadows slowly coalesce into a wispy mass that feels familiar.  The two candles near the altar explode with light and there, before you, appears all that remains of your former life.");
end
