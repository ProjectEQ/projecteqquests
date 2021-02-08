-- event info by Huffin
-- a_pensive_Dragorn (336059)
-- a_sympathetic_Dragorn (336060)
-- a_Dragorn_realist (336058)
-- a_Dragorn_heckler (336057)

function event_spawn(e)
  eq.set_timer('flavor', 300 * 1000);
  eq.set_timer('spawnscript', 6 * 1000);
end

function event_timer(e)
  if (e.timer == 'flavor') then
    eq.zone_emote(0,"Tiorpat Tornwing shouts, 'The invaders have ruined our lands, our home, our way of life.  We must not take this lying down.'");
    eq.zone_emote(0,"A Dragorn realist shouts, 'Are you mad?  We haven't a chance against them.  We've already lost and you must be blind not to see this.'");
    eq.set_timer('flavor2', 300 * 1000);
    eq.stop_timer('flavor');
  elseif (e.timer == 'flavor2') then
    eq.zone_emote(0,"Tiorpat Tornwing shouts, 'Can you remember a time when we were a proud people?  Before our subjugation to these heartless monsters?'");
    eq.zone_emote(0,"A sympathetic Dragorn shouts, 'Yes.  I long to relive those times again.'");
    eq.set_timer('flavor3', 300 * 1000);
    eq.stop_timer('flavor2');
  elseif (e.timer == 'flavor3') then
    eq.zone_emote(0,"Tiorpat Tornwing shouts, 'To live under the thumb of the invaders is not to live at all.  I would rather be dead than a slave.'");
    eq.zone_emote(0,"A Dragorn realist shouts, 'You will be dead, and any fool that follows suit sacrifices their life needlessly as well.'");
    eq.set_timer('flavor4', 300 * 1000);
    eq.stop_timer('flavor3');
  elseif (e.timer == 'flavor4') then
    eq.zone_emote(0,"Tiorpat Tornwing shouts, 'It's never too late to make a last stand.  Drive them out!'");
    eq.zone_emote(0,"A sympathetic Dragorn shouts, 'Death to the invaders!'");
    eq.set_timer('flavor', 600 * 1000);
    eq.stop_timer('flavor4');
  elseif (e.timer == 'spawnscript') then
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
  elseif (e.timer == 'depop') then
    eq.depop_with_timer();
  end
end

function event_signal(e)
  if (e.signal==1) then
    e.self:SetSpecialAbility(24, 0);
    e.self:SetSpecialAbility(35, 0);
    eq.zone_emote(0,"Tiorpat Tornwing shouts, 'I'm not afraid of you, and I will not back down. This time you've threatened the wrong Dragorn.'");
    eq.stop_timer('flavor');
    eq.stop_timer('flavor2');
    eq.stop_timer('flavor3');
    eq.stop_timer('flavor4');
    eq.set_timer('depop', 1800 * 1000);
  end
end

function event_combat(e)
  if (e.joined == true) then
    eq.stop_timer('depop');
  else
    eq.set_timer('depop', 1800 * 1000);
  end
end
