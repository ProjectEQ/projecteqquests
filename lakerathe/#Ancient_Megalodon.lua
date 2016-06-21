#Quest file for Lake Rathe - #Ancient_Megalodon: Shaman Epic 1.5

function event_spawn(e)
  eq.set_timer("depop",1800000); --Despawn after 30 minutes
end

function event_timer(e)
  eq.stop_timer("depop");
  eq.depop();
end

function event_death_complete(e)
  eq.stop_timer("depop");
end
