local kill_count = 0

local function npc_death(e)
  if kill_count < 50 then
    kill_count = kill_count + 1
    eq.debug(string.format("Mob kill count: [%s]", kill_count))
    if kill_count >= 50 then
      eq.spawn2(290062, 0, 0, -1137.00, 246.00, 469.97, 405.00) -- NPC: #Stonespiritist_Ekikoa
    end
  end
end

-- this is still an awful way to do this
function event_encounter_load(e)
  -- ignore in paladin epic expedition
  if eq.get_zone_instance_version() ~= 0 then
    return
  end

  eq.register_npc_event("vxed", Event.death_complete, 290057, npc_death) -- #Chavoor_the_Trickster
  eq.register_npc_event("vxed", Event.death_complete, 290058, npc_death) -- #Ikaav_Firecaller
  eq.register_npc_event("vxed", Event.death_complete, 290060, npc_death) -- #Kyv_Hunter
  eq.register_npc_event("vxed", Event.death_complete, 290061, npc_death) -- #misguided_beludu_Creque
  eq.register_npc_event("vxed", Event.death_complete, 290064, npc_death) -- #Ukun_Bloodbeast
  eq.register_npc_event("vxed", Event.death_complete, 290063, npc_death) -- #Umbiki
  eq.register_npc_event("vxed", Event.death_complete, 290015, npc_death) -- an_aneuk_ebonspirit
  eq.register_npc_event("vxed", Event.death_complete, 290028, npc_death) -- an_aneuk_ebonspirit
  eq.register_npc_event("vxed", Event.death_complete, 290056, npc_death) -- an_aneuk_ebonspirit
  eq.register_npc_event("vxed", Event.death_complete, 290021, npc_death) -- an_aneuk_fleshweaver
  eq.register_npc_event("vxed", Event.death_complete, 290026, npc_death) -- an_aneuk_fleshweaver
  eq.register_npc_event("vxed", Event.death_complete, 290036, npc_death) -- an_aneuk_fleshweaver
  eq.register_npc_event("vxed", Event.death_complete, 290049, npc_death) -- an_arisen_beludu
  eq.register_npc_event("vxed", Event.death_complete, 290052, npc_death) -- an_arisen_beludu
  eq.register_npc_event("vxed", Event.death_complete, 290033, npc_death) -- an_ikaav_detestor
  eq.register_npc_event("vxed", Event.death_complete, 290001, npc_death) -- an_ikaav_fleshflare
  eq.register_npc_event("vxed", Event.death_complete, 290013, npc_death) -- an_ikaav_fleshflare
  eq.register_npc_event("vxed", Event.death_complete, 290032, npc_death) -- an_ikaav_fleshflare
  eq.register_npc_event("vxed", Event.death_complete, 290037, npc_death) -- an_ikaav_irelette
  eq.register_npc_event("vxed", Event.death_complete, 290039, npc_death) -- an_ikaav_irelette
  eq.register_npc_event("vxed", Event.death_complete, 290053, npc_death) -- an_ikaav_irelette
  eq.register_npc_event("vxed", Event.death_complete, 290014, npc_death) -- an_ikaav_psychagonist
  eq.register_npc_event("vxed", Event.death_complete, 290016, npc_death) -- an_ikaav_psychagonist
  eq.register_npc_event("vxed", Event.death_complete, 290011, npc_death) -- an_ukun_boneretriever
  eq.register_npc_event("vxed", Event.death_complete, 290030, npc_death) -- an_ukun_boneretriever
  eq.register_npc_event("vxed", Event.death_complete, 290029, npc_death) -- an_ukun_deathfang
  eq.register_npc_event("vxed", Event.death_complete, 290038, npc_death) -- an_ukun_deathfang
  eq.register_npc_event("vxed", Event.death_complete, 290046, npc_death) -- an_ukun_deathfang
  eq.register_npc_event("vxed", Event.death_complete, 290012, npc_death) -- a_coerced_granite_worker
  eq.register_npc_event("vxed", Event.death_complete, 290022, npc_death) -- a_coerced_granite_worker
  eq.register_npc_event("vxed", Event.death_complete, 290008, npc_death) -- a_coerced_granite_worker
  eq.register_npc_event("vxed", Event.death_complete, 290047, npc_death) -- a_feeble_beludu_shade
  eq.register_npc_event("vxed", Event.death_complete, 290048, npc_death) -- a_feeble_beludu_shade
  eq.register_npc_event("vxed", Event.death_complete, 290051, npc_death) -- a_feeble_beludu_shade
  eq.register_npc_event("vxed", Event.death_complete, 290009, npc_death) -- a_flinty_cragbeast
  eq.register_npc_event("vxed", Event.death_complete, 290005, npc_death) -- a_hynid_ravager
  eq.register_npc_event("vxed", Event.death_complete, 290043, npc_death) -- a_hynid_ravager
  eq.register_npc_event("vxed", Event.death_complete, 290045, npc_death) -- a_hynid_ravager
  eq.register_npc_event("vxed", Event.death_complete, 290025, npc_death) -- a_kyv_eyecollector
  eq.register_npc_event("vxed", Event.death_complete, 290035, npc_death) -- a_kyv_eyecollector
  eq.register_npc_event("vxed", Event.death_complete, 290003, npc_death) -- a_kyv_heartstriker
  eq.register_npc_event("vxed", Event.death_complete, 290055, npc_death) -- a_kyv_heartstriker
  eq.register_npc_event("vxed", Event.death_complete, 290017, npc_death) -- a_mastruq_decapitator
  eq.register_npc_event("vxed", Event.death_complete, 290018, npc_death) -- a_mastruq_decapitator
  eq.register_npc_event("vxed", Event.death_complete, 290034, npc_death) -- a_mastruq_decapitator
  eq.register_npc_event("vxed", Event.death_complete, 290010, npc_death) -- a_mastruq_warmedic
  eq.register_npc_event("vxed", Event.death_complete, 290027, npc_death) -- a_mastruq_warmedic
  eq.register_npc_event("vxed", Event.death_complete, 290041, npc_death) -- a_mountain_pooka
  eq.register_npc_event("vxed", Event.death_complete, 290006, npc_death) -- a_mountain_pooka
  eq.register_npc_event("vxed", Event.death_complete, 290004, npc_death) -- a_mountain_pooka
  eq.register_npc_event("vxed", Event.death_complete, 290066, npc_death) -- a_noc_darklurch
  eq.register_npc_event("vxed", Event.death_complete, 290023, npc_death) -- a_noc_havocblade
  eq.register_npc_event("vxed", Event.death_complete, 290024, npc_death) -- a_noc_havocblade
  eq.register_npc_event("vxed", Event.death_complete, 290031, npc_death) -- a_noc_havocblade
  eq.register_npc_event("vxed", Event.death_complete, 290002, npc_death) -- a_noc_sprayblood
  eq.register_npc_event("vxed", Event.death_complete, 290007, npc_death) -- a_noc_sprayblood
  eq.register_npc_event("vxed", Event.death_complete, 290000, npc_death) -- a_noc_sprayblood
  eq.register_npc_event("vxed", Event.death_complete, 290019, npc_death) -- a_ra`tuk_decimator
  eq.register_npc_event("vxed", Event.death_complete, 290020, npc_death) -- a_ra`tuk_decimator
  eq.register_npc_event("vxed", Event.death_complete, 290054, npc_death) -- a_ra`tuk_decimator
  eq.register_npc_event("vxed", Event.death_complete, 290067, npc_death) -- a_ra`tuk_screambringer
  eq.register_npc_event("vxed", Event.death_complete, 290040, npc_death) -- a_venomous_stonemite
  eq.register_npc_event("vxed", Event.death_complete, 290042, npc_death) -- a_venomous_stonemite
  eq.register_npc_event("vxed", Event.death_complete, 290044, npc_death) -- a_venomous_stonemite
  eq.register_npc_event("vxed", Event.death_complete, 290050, npc_death) -- a_weeping_beludu_mother
end
