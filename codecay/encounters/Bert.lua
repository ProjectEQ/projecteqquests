--[[
 Bertox Event ## By Drogerin
--]]
local trash_dead=0;
local raddi_spawned=false;
local wavadozzik_spawned=false;
local zandal_spawned=false;
local akkapan_spanwed=false;
local bhaly_spawned=false;
local pzo_spawned=false;
local meedo_spawned=false;
local qezzin_spawned=false;
local bert_spawned=false;
local darwol_spawned=false;
local feig_spawned=false;
local xhut_spawned=false;
local kavillis_spawned=false;


function Spectre_Death(e)
	local el = eq.get_entity_list();
	if ( el:IsMobSpawnedByNpcTypeID(200016) == false) then
	trash_dead=0;
	eq.zone_emote(10,"Crazed laughter is heard as you notice a foul creature standing before you. The creature then speaks saying, 'Violaters of the depths of Lxanvom shall pay with your lives!'  The foul minion of decay then begins chanting a dark ritual.  Deeper within the depths of the crypt more chanting can be heard.");
	eq.signal(200056, 1); -- NPC: Summoner_of_Bertoxxulous
	end
end


function Trash_Death(e)
	local el = eq.get_entity_list();
	trash_dead=trash_dead+1;
	eq.debug("Trash Dead: " .. trash_dead);
		if trash_dead == 42 and darwol_spawned == false then		--42 Trash
		eq.zone_emote(10,"An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you corrupted King of Lxanvom, Darwol Adan, your master has need of you!' A bestial squeak thunders through the crypt as a foul fiend of Bertoxxulous is summoned forth.");
		eq.spawn2(200046,0,0,-3.09,280.74,-245.20,255.5); -- NPC: #Darwol_Adan
		darwol_spawned=true;
	
		elseif trash_dead == 46 and feig_spawned == false then	--46 Trash
		eq.spawn2(200045,0,0,-203.46,0.68,-275.82,128.8); -- Spawn Feig Adan
		eq.zone_emote(10,"An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you corrupted King of Lxanvom, Feig Adan, your master has need of you!' A bestial squeak thunders through the crypt as a foul fiend of Bertoxxulous is summoned forth.");
		feig_spawned=true;
		
		elseif trash_dead == 50 and xhut_spawned == false then	--50 Trash
		eq.spawn2(200044,0,0,-1.24,-280.37,-245.82,511.2); -- Spawn Xhut Adan
		eq.zone_emote(10,"An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you corrupted King of Lxanvom, Xhut Adan, your master has need of you!' A dark vision flashes through the crypt as a foul fiend of Bertoxxulous is summoned forth.");
		xhut_spawned=true;
		elseif trash_dead == 54 and kavillis_spawned == false then	--54 Trash
		eq.spawn2(200047,0,0,203.03,1.63,-275.82,381.8); -- Spawn Kavilis Adan
		eq.zone_emote(10,"An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you corrupted King of Lxanvom, Kavilis Adan, your master has need of you!' A faint buzzing is heard through the crypt as a foul fiend of Bertoxxulous is summoned forth.");
		kavillis_spawned=true;
		end
			if ( el:IsMobSpawnedByNpcTypeID(200046) == false and el:IsMobSpawnedByNpcTypeID(200045) == false and el:IsMobSpawnedByNpcTypeID(200044) == false and el:IsMobSpawnedByNpcTypeID(200047) == false) and trash_dead >=108 and raddi_spawned == false then -- 108 trash
			eq.spawn2(200049,0,0,-2.79,278.72,-245.82,259.5); --  Spawn Raddi Adan but only if none of the first 4 kings are spawned.
			eq.zone_emote(10,"An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you corrupted King of Lxanvom,  Raddi Adan, your master has need of you!' A wailing cry echoes through the crypt as a foul fiend of Bertoxxulous is summoned forth.");
			raddi_spawned=true;
			end
			if ( el:IsMobSpawnedByNpcTypeID(200046) == false and el:IsMobSpawnedByNpcTypeID(200045) == false and el:IsMobSpawnedByNpcTypeID(200044) == false and el:IsMobSpawnedByNpcTypeID(200047) == false) and trash_dead >=112 and wavadozzik_spawned == false then --112 trash
			eq.spawn2(200048,0,0,-203.46,0.68,-275.82,128.8); -- Spawn Wavadozzik Adain, same conditions as Raddi
			eq.zone_emote(10,"An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you corrupted King of Lxanvom, Wavadozzik Adan, your master has need of you!' Chittering is heard through the crypt as a foul fiend of Bertoxxulous is summoned forth.");
			wavadozzik_spawned=true;
			end
			if ( el:IsMobSpawnedByNpcTypeID(200046) == false and el:IsMobSpawnedByNpcTypeID(200045) == false and el:IsMobSpawnedByNpcTypeID(200044) == false and el:IsMobSpawnedByNpcTypeID(200047) == false) and trash_dead >=116 and zandal_spawned == false then --116 trash
			eq.spawn2(200050,0,0,-1.24,-280.37,-245.82,511.2); -- Spawn Zandal Adan, same conditions as Raddi & Wavadozzik
			eq.zone_emote(10,"An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you corrupted King of Lxanvom, Zandal Adan, your master has need of you!' Chittering is heard through the crypt as a foul fiend of Bertoxxulous is summoned forth.");
			zandal_spawned=true;
			end
			if ( el:IsMobSpawnedByNpcTypeID(200046) == false and el:IsMobSpawnedByNpcTypeID(200045) == false and el:IsMobSpawnedByNpcTypeID(200044) == false and el:IsMobSpawnedByNpcTypeID(200047) == false) and trash_dead >=120 and akkapan_spanwed == false then
			eq.spawn2(200051,0,0,203.03,1.63,-275.82,381.8); -- Spawn Akkapan Adan, same conditions as Raddi, Wavadozzik& Zandal
			eq.zone_emote(10,"An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you corrupted King of Lxanvom, Akkapan Adan, your master has need of you!' A maddened whispering is heard through the crypt as a foul fiend of Bertoxxulous is summoned forth.");
			akkapan_spanwed=true;
			end
			if ( el:IsMobSpawnedByNpcTypeID(200049) == false and el:IsMobSpawnedByNpcTypeID(200048) == false and el:IsMobSpawnedByNpcTypeID(200050) == false and el:IsMobSpawnedByNpcTypeID(200051) == false and el:IsMobSpawnedByNpcTypeID(200044) == false and el:IsMobSpawnedByNpcTypeID(200045) == false and el:IsMobSpawnedByNpcTypeID(200046) == false and el:IsMobSpawnedByNpcTypeID(200047) == false) and trash_dead >=125 and bhaly_spawned == false and pzo_spawned == false and qezzin_spawned == false and meedo_spawned == false then
			eq.spawn2(200054,0,0,203.03,1.63,-275.82,381.8); -- Bhaly West
			eq.spawn2(200053,0,0,-2.79,278.72,-245.82,259.5); -- Meedo North Spawn the final 4 Kings all at once if at 125 kills or more & all previous kings are dead.
			eq.spawn2(200052,0,0,-203.46,0.68,-275.82,128.8); -- Qezzin East
			eq.spawn2(200022,0,0,-1.24,-280.37,-245.82,511.2); -- Pzo South
			eq.zone_emote(10,"An unsettling feeling of fear passes through you as you hear the summoners finish a dark incantation then cry out saying, 'We call to you the last corrupted Kings of Lxanvom. Meedo Adan! Qezzin Adan! Pzo Adan! Bhaly Adan! Your master has need of you!' Four separate howls of rage and despair echo throughout the lower depths of the crypt as four foul fiends of Bertoxxulous are summoned forth.");		
			qezzin_spawned=true;
			meedo_spawned=true;
			pzo_spawned=true;
			bhaly_spawned=true;
			end
			if (el:IsMobSpawnedByNpcTypeID(200054) == false and el:IsMobSpawnedByNpcTypeID(200053) == false and el:IsMobSpawnedByNpcTypeID(200052) == false and el:IsMobSpawnedByNpcTypeID(200022) == false) and trash_dead >=125 and bhaly_spawned == true and pzo_spawned == true and qezzin_spawned == true and meedo_spawned == true and bert_spawned == false then
			eq.spawn2(200055,0,0,-61.75,-.22,-288.5,384.8); -- Summon Bertoxxulous.  Make sure no kings are up before you do.
			eq.zone_emote(10,"A sinister vision enters your mind of a faceless one handsome yet dead and decaying. The vision then shifts to that of a torn bestial creature and a loud shout is heard, 'Defilers death comes for you today!'")
			bert_spawned=true;
			end
end


function Bert_Death(e)
	local el = eq.get_entity_list();
	if ( el:IsMobSpawnedByNpcTypeID(200055) == false) then
		eq.zone_emote(10,"A nimbus of light floods throughs the crypt in one magnificent wave as an earth shattering howl is heard.  The bringer of plagues, lord of all disease and decay, Bertoxxulous has been defeated. Suddenly an urgent whisper fills your head simply saying, 'The Torch of Lxanvom shall burn bright again.  Freedom is now ours, for that we thank you.");
		eq.depop_all(200043);
		eq.depop_all(200042);
		eq.depop_all(200062); -- Despawn all Quest NPC's that have spawned.
		eq.depop_all(200063);
		eq.depop_all(200064);
		eq.depop_all(200065);
		eq.depop_all(200046);
		eq.depop_all(200045);
		eq.depop_all(200044); -- Despawn all Kings if any spawned
		eq.depop_all(200047);
		eq.depop_all(200049);
		eq.depop_all(200048);
		eq.depop_all(200050);
		eq.depop_all(200051);
		eq.depop_all(200054);
		eq.depop_all(200053);
		eq.depop_all(200052);
		eq.depop_all(200022);
		eq.depop_all(200055);
		eq.depop_all(200056);
		eq.depop_all(200024);
		eq.spawn_condition("codecay",0,1,0);
		eq.spawn2(218068,0,0,-61.75,-.22,-288.5,384.8); -- NPC: A_Planar_Projection
	end
end




function event_encounter_load(e)
	eq.register_npc_event('Bert', Event.death_complete, 			200016, Spectre_Death);
	
	
	eq.register_npc_event('Bert', Event.death_complete, 200042, 			Trash_Death);
	eq.register_npc_event('Bert', Event.death_complete, 200043, 			Trash_Death);
	eq.register_npc_event('Bert', Event.death_complete, 200062, 			Trash_Death);
	eq.register_npc_event('Bert', Event.death_complete, 200063, 			Trash_Death);
	eq.register_npc_event('Bert', Event.death_complete, 200064, 			Trash_Death);
	eq.register_npc_event('Bert', Event.death_complete, 200065, 			Trash_Death);
	
	eq.register_npc_event('Bert', Event.death_complete, 200055, 			Bert_Death);
end
