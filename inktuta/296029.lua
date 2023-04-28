-- #a_pile_of_bones (296029) -- Final Reward based on path

--[[
	Bonus Loot Structure

	Bits
	1 = Keledrix (Who is Kelekdrix)
	2 = Keledrix (What Consequences)
	4 = Monolith (Save Jomica)
	8 = Monolith (Kill Jomica)
	16 = Cursecaller (We plan to kill you)
	32 = Cursecaller (We will keep you alive)
	64 = Cursecaller (I truly understand)

	Bucket Total =
	21 = Pikebladed Ripper of the Arch-Thief (68943)
	22 = Segmented Staff of Ceremony (68941)
	25 = Cerulean Painted Veil (68953)
	26 = Relic of the Unremembered (68950)
	37 = Effigy of Kelekdrix (68952)
	38 = Sash of Enveloping Quiescence (68951)
	41 = Jeweled Stud of Madness (68958)
	42 = Stained Threadbare Cape (68954)
	69 = Muramite Chest Armor (68226)
	70 = Muramite Greaves Armor (68225)
	73 = Shattered Jade Band of Anger (68948)
	74 = Noqufiel's Wand of Infinite Enmity (68945)

	Anything else = Random
]]

function event_spawn(e)
	local inktuta_bonus_loot = tonumber(eq.get_data("inktuta_bonus_loot-"..eq.get_zone_instance_id())) or 0

	if inktuta_bonus_loot == 21 then
		e.self:AddItem(68943,1); -- Item: Pikebladed Ripper of the Arch-Thief (68943)
	elseif inktuta_bonus_loot == 22 then
		e.self:AddItem(68941,1); -- Item: Segmented Staff of Ceremony (68941)
	elseif inktuta_bonus_loot == 25 then
		e.self:AddItem(68953,1); -- Item: Cerulean Painted Veil (68953)
	elseif inktuta_bonus_loot == 26 then
		e.self:AddItem(68950,1); -- Item: Relic of the Unremembered (68950)
	elseif inktuta_bonus_loot == 37 then
		e.self:AddItem(68952,1); -- Item: Effigy of Kelekdrix (68952)
	elseif inktuta_bonus_loot == 38 then
		e.self:AddItem(68951,1); -- Item: Sash of Enveloping Quiescence (68951)
	elseif inktuta_bonus_loot == 41 then
		e.self:AddItem(68958,1); -- Item: Jeweled Stud of Madness (68958)
	elseif inktuta_bonus_loot == 42 then
		e.self:AddItem(68954,1); -- Item: Stained Threadbare Cape (68954)
	elseif inktuta_bonus_loot == 69 then
		e.self:AddItem(68226,1); -- Item: Muramite Chest Armor (68226)
	elseif inktuta_bonus_loot == 70 then
		e.self:AddItem(68225,1); -- Item: Muramite Greaves Armor (68225)
	elseif inktuta_bonus_loot == 73 then
		e.self:AddItem(68948,1); -- Item: Shattered Jade Band of Anger (68948)
	elseif inktuta_bonus_loot == 74 then
		e.self:AddItem(68945,1); -- Item: Noqufiel's Wand of Infinite Enmity (68945)
	else
		e.self:AddItem(eq.ChooseRandom(68943,68941,68953,68950,68952,68951,68958,68954,68226,68225,68948,68945),1); -- Item: Random
	end
end
