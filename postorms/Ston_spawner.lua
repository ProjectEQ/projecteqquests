function event_signal(e)
if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(210088) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(210087) == false) then
eq.spawn2(210237,0,0,-178,690,-374,330); -- NPC: a_Koka`Vor_elder
eq.spawn2(210236,0,0,-223,655,-374,330); -- NPC: a_Koka`Vor_chieftain
eq.spawn2(210236,0,0,-173,628,-374,449); -- NPC: a_Koka`Vor_chieftain
eq.spawn2(210236,0,0,-250,713,-374,195); -- NPC: a_Koka`Vor_chieftain
eq.spawn2(210237,0,0,209,1427,-374,248); -- NPC: a_Koka`Vor_elder
eq.spawn2(210237,0,0,272,1387,-374,363); -- NPC: a_Koka`Vor_elder
eq.spawn2(210236,0,0,227,1314,-374,493); -- NPC: a_Koka`Vor_chieftain
eq.spawn2(210236,0,0,155,1350,-374,99); -- NPC: a_Koka`Vor_chieftain
eq.depop_with_timer();
end
end
