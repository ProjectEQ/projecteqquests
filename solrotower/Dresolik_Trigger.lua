function event_spawn(e)
  eq.set_timer('guards', 6 * 1000);
end

function event_timer(e)
  if(e.timer=='guards') then
    eq.stop_timer('guards');
    eq.spawn2(212046,0,0,837,1519,-155.38,444); --Guardian_of_Dresolik
    eq.spawn2(212046,0,0,830,1652,-155.38,313); --Guardian_of_Dresolik
    eq.spawn2(212046,0,0,701,1651,-155.38,187); --Guardian_of_Dresolik
    eq.spawn2(212046,0,0,696,1513,-155.38,61); --Guardian_of_Dresolik
  end
end
