local hp_threshold		= 50;						-- HP Threshold at which HoT will be cast.
local interval			= 35 * 1000;				-- Frequency in ms with which the timer is executed.
local max_distance		= 100;						-- How close a player must be for a chance to be buffed

local mana_regen_spells	= {697, 174, 1693, 6898};	-- Spells: Breeze, Clarity, Clarity II, Servant's Breath
local haste_spells		= {10, 170, 171, 172};		-- Spells: Augmentation, Alacrity, Celerity, Swift like the wind
local hot_spells		= {2502, 2175, 1283, 1522}; -- Spells: Celestial Remedy,  Health, Cleansing, Elixir
local ac_spells			= {18, 19, 20, 3470};		-- Spells: Guard, Armor of Faith, Shield of Words, Ward of Gallantry

function event_spawn(e)
	eq.set_timer("action", interval);
end

function event_timer(e)
	local pet_owner = e.self:GetOwner();

	if pet_owner.valid then
		local owner_x,owner_y,owner_z = pet_owner:GetX(), pet_owner:GetY(), pet_owner:GetZ();
		local owner_distance = e.self:CalculateDistance(owner_x,owner_y,owner_z) or 999999;

		if owner_distance < max_distance then
			if buff_player(e,pet_owner) then
				return;
			end
		end
	end

	-- Owner didn't need buffs, grab local client
	local random_player = eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),max_distance);

	if random_player.valid then
		buff_player(e,random_player)
	end
end

function buff_player(e,client)
	if client.valid then
		local client_hp_ratio	= client:GetHPRatio();
		local client_level		= client:GetLevel();
		local spell_set			= 1;

		if client_level >= 50 then
			spell_set = 4;
		elseif client_level >= 30 then
			spell_set = 3
		elseif client_level >= 15 then
			spell_set = 2
		end

		if client_hp_ratio <= hp_threshold then
			if not client:FindBuff(hot_spells[spell_set]) then
				if client:CanBuffStack(hot_spells[spell_set],e.self:GetLevel(),true) then
					e.self:FaceTarget(client);
					e.self:CastSpell(hot_spells[spell_set], client:GetID());
					return true;
				end
			end
		end

		if client:GetMaxMana() > 0 then
			if not client:FindBuff(mana_regen_spells[spell_set]) then
				if client:CanBuffStack(mana_regen_spells[spell_set],e.self:GetLevel(),true) then
					e.self:FaceTarget(client);
					e.self:CastSpell(mana_regen_spells[spell_set], client:GetID());
					return true;
				end
			end
		end

		local buffs = {haste_spells[spell_set], ac_spells[spell_set]};

		for i = 1, #buffs do
			if not client:FindBuff(buffs[i]) then
				if client:CanBuffStack(buffs[i],e.self:GetLevel(),true) then
					e.self:FaceTarget(client);
					e.self:CastSpell(buffs[i], client:GetID());
					return true;
				end
			end
		end

		return false;
	end
end