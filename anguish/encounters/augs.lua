--[[
 Once 38 trash mobs are killed, 2 to 5 aug mobs will spawn (random-ish).
 zone_status handles all the logic
--]]

local trash_dead=0;

function Trash_Death(e)
	trash_dead=trash_dead+1;
	eq.debug("Trash Dead: " .. trash_dead);
	if trash_dead == 38 then		
		eq.signal(317116 , 3); -- NPC: zone_status
		eq.zone_emote(15,"The walls of the castle tremble for a moment.  Your interference has notified Mata Muram's lieutenants to your presence.");
	end
end

function event_encounter_load(e)
	eq.register_npc_event('augs', Event.death_complete, 317019 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317020 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317021 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317022 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317023 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317024 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317025 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317026 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317027 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317028 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317029 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317030 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317031 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317032 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317033 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317034 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317035 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317036 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317037 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317038 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317039 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317040 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317041 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317042 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317043 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317044 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317045 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317046 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317047 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317048 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317049 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317050 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317051 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317052 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317053 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317054 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317055 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317056 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317057 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317058 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317059 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317060 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317061 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317062 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317063 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317064 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317065 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317066 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317067 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317068 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317069 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317070 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317071 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317072 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317073 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317074 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317075 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317079 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317080 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317081 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317082 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317083 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317084 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317085 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317086 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317089 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317090 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317091 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317092 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317093 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317095 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317096 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317097 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317098 ,Trash_Death);
	eq.register_npc_event('augs', Event.death_complete, 317104 ,Trash_Death);
end

function event_encounter_unload(e)
end