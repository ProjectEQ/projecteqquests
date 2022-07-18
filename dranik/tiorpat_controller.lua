function event_spawn(e)
  eq.set_timer('spawnscript', 6 * 1000);
end

function event_timer(e)
  if (e.timer == 'spawnscript') then
    eq.unique_spawn(336061, 0, 0, -335, 524, -219, 259); -- Tiorpat_Tornwing (336061)
    eq.spawn2(eq.ChooseRandom(336059,336060), 0, 0, -467, 530, -217.75, 320); -- NPC(s): a_pensive_Dragorn (336059), a_sympathetic_Dragorn (336060)
    eq.spawn2(eq.ChooseRandom(336059,336060), 0, 0, -372, 471, -217.75, 360); -- NPC(s): a_pensive_Dragorn (336059), a_sympathetic_Dragorn (336060)
    eq.spawn2(eq.ChooseRandom(336059,336060), 0, 0, -274, 470, -217.75, 184); -- NPC(s): a_pensive_Dragorn (336059), a_sympathetic_Dragorn (336060)
    eq.spawn2(eq.ChooseRandom(336059,336060), 0, 0, -420, 701, -209.75, 144); -- NPC(s): a_pensive_Dragorn (336059), a_sympathetic_Dragorn (336060)
    eq.spawn2(eq.ChooseRandom(336059,336060), 0, 0, -263, 673, -217.75, 16); -- NPC(s): a_pensive_Dragorn (336059), a_sympathetic_Dragorn (336060)
    eq.spawn2(eq.ChooseRandom(336059,336060), 0, 0, -230, 579, -217.75, 368); -- NPC(s): a_pensive_Dragorn (336059), a_sympathetic_Dragorn (336060)
    eq.spawn2(eq.ChooseRandom(336058,336057), 0, 0, -389, 612, -217.75, 248); -- NPC(s): a_Dragorn_realist (336058), a_Dragorn_heckler (336057)
    eq.spawn2(eq.ChooseRandom(336058,336057), 0, 0, -146, 450, -217.75, 376); -- NPC(s): a_Dragorn_realist (336058), a_Dragorn_heckler (336057)
    eq.spawn2(eq.ChooseRandom(336058,336057), 0, 0, -437, 312, -142.75, 288); -- NPC(s): a_Dragorn_realist (336058), a_Dragorn_heckler (336057)
    eq.spawn2(eq.ChooseRandom(336058,336057), 0, 0, -374, 397, -215.625, 176); -- NPC(s): a_Dragorn_realist (336058), a_Dragorn_heckler (336057)
    eq.spawn2(eq.ChooseRandom(336058,336057), 0, 0, -311, 723, -217.75, 50); -- NPC(s): a_Dragorn_realist (336058), a_Dragorn_heckler (336057)
    eq.spawn2(eq.ChooseRandom(336058,336057), 0, 0, -193, 582, -216.25, 376); -- NPC(s): a_Dragorn_realist (336058), a_Dragorn_heckler (336057)
    eq.spawn2(eq.ChooseRandom(336058,336057), 0, 0, -289, 324, -217.75, 104); -- NPC(s): a_Dragorn_realist (336058), a_Dragorn_heckler (336057)
    eq.spawn2(eq.ChooseRandom(336058,336057), 0, 0, -469, 422, -208.375, 488); -- NPC(s): a_Dragorn_realist (336058), a_Dragorn_heckler (336057)
    eq.stop_timer('spawnscript');
  elseif (e.timer == 'reset') then
    eq.stop_timer('reset');
    eq.unique_spawn(336061, 0, 0, -335, 524, -219, 259); -- Tiorpat_Tornwing (336061)
    eq.spawn2(eq.ChooseRandom(336059,336060), 0, 0, -467, 530, -217.75, 320); -- NPC(s): a_pensive_Dragorn (336059), a_sympathetic_Dragorn (336060)
    eq.spawn2(eq.ChooseRandom(336059,336060), 0, 0, -372, 471, -217.75, 360); -- NPC(s): a_pensive_Dragorn (336059), a_sympathetic_Dragorn (336060)
    eq.spawn2(eq.ChooseRandom(336059,336060), 0, 0, -274, 470, -217.75, 184); -- NPC(s): a_pensive_Dragorn (336059), a_sympathetic_Dragorn (336060)
    eq.spawn2(eq.ChooseRandom(336059,336060), 0, 0, -420, 701, -209.75, 144); -- NPC(s): a_pensive_Dragorn (336059), a_sympathetic_Dragorn (336060)
    eq.spawn2(eq.ChooseRandom(336059,336060), 0, 0, -263, 673, -217.75, 16); -- NPC(s): a_pensive_Dragorn (336059), a_sympathetic_Dragorn (336060)
    eq.spawn2(eq.ChooseRandom(336059,336060), 0, 0, -230, 579, -217.75, 368); -- NPC(s): a_pensive_Dragorn (336059), a_sympathetic_Dragorn (336060)
    eq.spawn2(eq.ChooseRandom(336058,336057), 0, 0, -389, 612, -217.75, 248); -- NPC(s): a_Dragorn_realist (336058), a_Dragorn_heckler (336057)
    eq.spawn2(eq.ChooseRandom(336058,336057), 0, 0, -146, 450, -217.75, 376); -- NPC(s): a_Dragorn_realist (336058), a_Dragorn_heckler (336057)
    eq.spawn2(eq.ChooseRandom(336058,336057), 0, 0, -437, 312, -142.75, 288); -- NPC(s): a_Dragorn_realist (336058), a_Dragorn_heckler (336057)
    eq.spawn2(eq.ChooseRandom(336058,336057), 0, 0, -374, 397, -215.625, 176); -- NPC(s): a_Dragorn_realist (336058), a_Dragorn_heckler (336057)
    eq.spawn2(eq.ChooseRandom(336058,336057), 0, 0, -311, 723, -217.75, 50); -- NPC(s): a_Dragorn_realist (336058), a_Dragorn_heckler (336057)
    eq.spawn2(eq.ChooseRandom(336058,336057), 0, 0, -193, 582, -216.25, 376); -- NPC(s): a_Dragorn_realist (336058), a_Dragorn_heckler (336057)
    eq.spawn2(eq.ChooseRandom(336058,336057), 0, 0, -289, 324, -217.75, 104); -- NPC(s): a_Dragorn_realist (336058), a_Dragorn_heckler (336057)
    eq.spawn2(eq.ChooseRandom(336058,336057), 0, 0, -469, 422, -208.375, 488); -- NPC(s): a_Dragorn_realist (336058), a_Dragorn_heckler (336057)
  end
end

function event_signal(e)
  if(e.signal == 1) then	
			eq.depop_all(336058);
			eq.depop_all(336057);
			eq.depop_all(336059);
			eq.depop_all(336060);
      eq.depop_all(336061);
			eq.set_timer('reset', 5400*1000); -- 90 minute reset
	end
end
