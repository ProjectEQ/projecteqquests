

function event_encounter_load(e)

  eq.register_npc_event('rujd', Event.death_complete, 245199, TM_Devrak_Death); --#Taskmaster_Devrak 

  eq.register_npc_event('rujd', Event.timer, 245199, TM_Timer); --#Taskmaster_Devrak 

  eq.register_npc_event('rujd', Event.combat, 245199, TM_Combat); --#Taskmaster_Devrak 

  
  eq.register_npc_event('rujd', Event.spawn,	245217, Maziyae_Spawn); --#Maziyae_Xanl`Utin
    
  eq.register_npc_event('rujd', Event.signal,			245261, RPG_Pris_Signal); --#Jealac_Yzinaql (245261)

end

