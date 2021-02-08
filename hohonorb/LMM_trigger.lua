function event_spawn(e)
eq.set_timer('popscript', 1 * 1000);
end

function event_timer(e)
if (e.timer == 'popscript') then
eq.stop_timer('popscript');
eq.unique_spawn(220014,0,0,2366,-151,444,387); --Edium,_Guardian_of_Marr
eq.unique_spawn(220013,0,0,2366,154,444,387); --Halon_of_Marr
eq.unique_spawn(220012,0,0,2495,0,444,387); --Ralthazor,_Champion_of_Marr
eq.unique_spawn(220015,0,0,2727,0,471,387); --Lord_Mithaniel_Marr untargetable
end
end
