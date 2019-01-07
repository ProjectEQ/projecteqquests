function event_spawn(e)
eq.set_timer('spawn', 6 * 1000);
end

function event_timer(e)
if (e.timer == 'spawn') then
eq.stop_timer('spawn');
eq.spawn2(340382, 0, 0, 221, 1293, -19, 8);
eq.spawn2(340383, 0, 0, 770, -1172, 18.5, 227);
eq.spawn2(340384, 0, 0, 1014, 80, 38.875, 93);
end
end
