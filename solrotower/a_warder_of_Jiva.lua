
  
-- I believe at one point this would death touch anyone trying to pass them, inactive for now

function event_spawn(e)
eq.set_timer('depop', 1800 * 1000);
end

function event_timer(e)
if (e.timer == 'depop') then
eq.stop_timer('depop');
eq.depop();
end
end
