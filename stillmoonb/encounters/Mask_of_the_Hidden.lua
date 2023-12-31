--[[  Mask of the Hidden

- zone polls every 1 minute for a client at z > 438.5 wearing the Mask of the Hidden and triggers chest for first client found
  * 1 minute polling only semi-confirmed, think it might start polling/trigger a check on client immediately on equipping the mask? or lucky to trigger immediately
- when a character spawns chest from equipped mask, they get a client only message and OP_FindPersonReply packet to mark location on map:
  MT.Yellow (15): "As you don the mask, your vision blurs for a moment. As your eyes come into focus, you see a glittering path guiding you... somewhere."
  OP_FindPersonReply yxz: 6375, 1330, 763.0192260742188
  packet order is: OP_SendFindableNPCs, Spawn, Message, OP_FindPersonReply
- other players in zone/group members only get OP_SendFindableNPCs and Spawn packets for the chest
- chest always spawns in same location: #a_mysterious_chest @ x = 1330, y = 6375, z = 760, h = 37
  * note after zoning in with an already spawned chest the spawn packet is settled to ground at z=755, but spawning it at z=760 is correct
- chest spawn starts a 1 hour cooldown timer where no other chests can be spawned by other players (polling paused/no-op)
  * if a player /opens a chest near the end of the 1 hour cooldown that chest remains rotting for 30 min and a second chest can be spawned when initial cooldown expires
    this can occur with the same player spawning both chests (this doesn't matter since mask is required to loot and gets removed, item is nodrop/lore anyway)
- chest remains spawned for 1 hour and depops without interaction but anyone can /open it which starts the 30min corpse rot timer
  * new chest spawns 5s (first tick) after first chest depops, so checks on first tick of restarted polling
  * actual time from spawn to depop was 59min55s (1hour - 1tick), then next tick @ 1hour (+2 secs variance - different script ticking?) allowed spawning another
- anyone in zone can /open the chest, but if anyone but player that spawned it tries to loot it gives loot rejection packet resulting in client message:
  eqstr 3562: "You are not allowed to loot the item: %1."
  * note think emu might require sending this message manually with rejection packet (need to double check), live generates message client side in a loot packet
- mask must be in player's inventory or equipped at the time of trying to loot, if it was banked after spawning chest then player will get loot rejection
  pulling the mask back out of bank into inventory will then allow looting the item
- camping out after spawning the chest and logging back in has no effect, can still loot it
- when player loots their chest item they get a client only message and their Mask of Hidden is destroyed (either while equipped or in inventory):
  MT.Yellow (15): "You find an item made solely for you. As it comes into your hands you feel the mask dissolve and slip off your face into oblivion."
- if the chest item is succesfully looted the 1 hour cooldown is cancelled and it starts polling again to allow another chest to spawn
  * the poll timer didn't't appear to be paused so after looting the next chest can trigger anytime within a minute depending on timer's current state
]]--

local chest_id			= 339300;
local chest_loc			= {x = 1330, y = 6375, z = 760, h = 37};
local zone_status_id	= 259159;
local chest_spawned		= false;

local mask_id			= 69988;
local loot_table		= {
	[Class.WARRIOR]			= 70971, -- Bladed Fang Mantle	
	[Class.CLERIC]			= 70972, -- Braided Kirin Mane
	[Class.PALADIN]			= 70973, -- Mantle of the Wyrmguard
	[Class.RANGER]			= 70974, -- Sash of Dragon Kind
	[Class.SHADOWKNIGHT]	= 70975, -- Mark of the Dragon Slayer
	[Class.DRUID]			= 70976, -- Mask of the Ancients
	[Class.MONK]			= 70977, -- Cloak of Scale Spines
	[Class.BARD]			= 70978, -- Speaker of the Scale
	[Class.ROGUE]			= 70979, -- Dragonshade Mask
	[Class.SHAMAN]			= 70980, -- Mark of the Brood Warden
	[Class.NECROMANCER]		= 70981, -- Mark of the Grave Finder
	[Class.WIZARD]			= 70982, -- Chain of the Kindred Scale
	[Class.MAGICIAN]		= 70983, -- Mark of the Last Wing
	[Class.ENCHANTER]		= 70984, -- Chain of Talon's Charm
	[Class.BEASTLORD]		= 70985, -- Chain of Dragon Kin
	[Class.BERSERKER]		= 70986  -- Fire Fury Cloak
}

function zs_spawn(e)
	eq.set_timer("heartbeat", 60 * 1000);
end

function heartbeat(e)
	local event_locked_out	= tonumber(eq.get_data("moth_lockout")) or 0;

	if e.timer == "heartbeat" then
		if event_locked_out == 0 and chest_spawned then -- 1 Hour Lockout is over and chest is still up - Depop
			eq.depop(chest_id);
		elseif event_locked_out == 0 and not chest_spawned then -- Not Locked Out and Not Spawned - Start Logic to check for player at the correct step
			check_players(e);
		end
	end
end

function check_players(e)
	local player_list = eq.get_entity_list():GetClientList();

	if player_list ~= nil then
		for pc in player_list.entries do
			if pc.valid and pc:GetY() > 5000 and not pc:GetGM() then -- Player is at check location, check for equipped mask.
				if pc:GetItemIDAt(Slot.Face) == mask_id then -- Mask of the Hidden
					eq.set_data("moth_lockout", "1", "H1"); -- 1 Hour zone-wide Lockout
					pc:CastToClient():SetBucket("moth_loot", "1", "H1"); -- 1 Hour personal lockout (for Loot Check)
					chest_spawned = true;
					eq.unique_spawn(chest_id, 0, 0, chest_loc.x, chest_loc.y, chest_loc.z, chest_loc.h):CastToNPC():AddItem(loot_table[pc:CastToClient():GetClass()], 1);
					pc:CastToClient():Message(MT.Yellow, "As you don the mask, your vision blurs for a moment. As your eyes come into focus, you see a glittering path guiding you... somewhere.");
					pc:CastToClient():MarkSingleCompassLoc(chest_loc.x, chest_loc.y, chest_loc.z);
					break; -- No reason to keep checking
				end
			end
		end
	end
end

function player_loot(e)
	local player_allowed_to_loot	= tonumber(e.self:GetBucket("moth_loot")) or 0;

	if e.corpse:GetNPCTypeID() == chest_id then
		if player_allowed_to_loot == 1 and e.self:HasItem(mask_id) then
			e.self:Message(MT.Yellow, "You find an item made solely for you. As it comes into your hands you feel the mask dissolve and slip off your face into oblivion.");
			e.self:NukeItem(mask_id);
			chest_spawned = false;
			e.self:ClearCompassMark();
			e.self:DeleteBucket("moth_loot");
			eq.delete_data("moth_lockout"); -- Clears lockout and allows to start right away
		else
			return 1;
		end
	end
end

function event_encounter_load(e)
	eq.register_npc_event(Event.spawn,	zone_status_id, zs_spawn);
	eq.register_npc_event(Event.timer,	zone_status_id, heartbeat);

	eq.register_player_event(Event.loot, player_loot);

	eq.unique_spawn(zone_status_id, 0, 0, 0, 0, 0, 0);
end
