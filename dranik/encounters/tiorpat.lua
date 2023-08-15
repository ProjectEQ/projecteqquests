-- event info by Huffin
-- a_pensive_Dragorn (336059)
-- a_sympathetic_Dragorn (336060)
-- a_Dragorn_realist (336058)
-- a_Dragorn_heckler (336057)
--Tiorpat_Tornwing (336061)
local add_sequence = 0;

function Tiorpat_Spawn(e)
	eq.set_timer('spawnscript', 6 * 1000);
	eq.set_timer('flavor', 300 * 1000);
	add_sequence = 0;
end

function Tiorpat_Timer(e)
  if (e.timer == 'flavor') then
    eq.zone_emote(MT.White,"Tiorpat Tornwing shouts, 'The invaders have ruined our lands, our home, our way of life.  We must not take this lying down.");
    eq.zone_emote(MT.White,"A Dragorn realist shouts, 'Are you mad?  We haven't a chance against them.  We've already lost and you must be blind not to see this.");
    eq.set_timer('flavor2', 300 * 1000);
    eq.stop_timer('flavor');
  elseif (e.timer == 'flavor2') then
    eq.zone_emote(MT.White,"Tiorpat Tornwing shouts, 'Can you remember a time when we were a proud people?  Before our subjugation to these heartless monsters?");
    eq.zone_emote(MT.White,"A sympathetic Dragorn shouts, 'Yes.  I long to relive those times again.'");
    eq.set_timer('flavor3', 300 * 1000);
    eq.stop_timer('flavor2');
  elseif (e.timer == 'flavor3') then
    eq.zone_emote(MT.White,"Tiorpat Tornwing shouts, 'To live under the thumb of the invaders is not to live at all.  I would rather be dead than a slave.");
    eq.zone_emote(MT.White,"A Dragorn realist shouts, 'You will be dead, and any fool that follows suit sacrifices their life needlessly as well.");
    eq.set_timer('flavor4', 300 * 1000);
    eq.stop_timer('flavor3');
  elseif (e.timer == 'flavor4') then
    eq.zone_emote(MT.White,"Tiorpat Tornwing shouts, 'It's never too late to make a last stand.  Drive them out!");
    eq.zone_emote(MT.White,"A sympathetic Dragorn shouts, 'Death to the invaders!");
    eq.set_timer('flavor', 600 * 1000);
    eq.stop_timer('flavor4');
  elseif (e.timer == 'depop') then
    --eq.signal(336128,1); --signal controller to do things tiorpat_controller (336128)
    eq.stop_timer('depop');
	eq.depop_all(336058);
	eq.depop_all(336057);
	eq.depop_all(336059);
	eq.depop_all(336060);
      	eq.depop_with_timer(336061); -- event goes into full respawn mode if reset timer met
elseif (e.timer == 'link') then
    
    local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
			if (npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 336058 or npc:GetNPCTypeID() == 336057)) then
			npc:AddToHateList(e.self:GetHateRandom(),1);
			end
		end
elseif (e.timer == 'adds') then
	eq.zone_emote(MT.White,"Tiorpat Tornwing shouts, 'Help me, brother!");
		eq.signal(336058,1);
		eq.signal(336057,1);
		-- a_Dragorn_realist (336058)
		-- a_Dragorn_heckler (336057)
		
elseif (e.timer == 'spawnscript') then
    --eq.unique_spawn(336061, 0, 0, -335, 524, -219, 259); -- Tiorpat_Tornwing (336061)
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
  end
end

function Tiorpat_Signal(e)
  if (e.signal==1) then
    e.self:SetSpecialAbility(24, 0);
    e.self:SetSpecialAbility(35, 0);
    eq.zone_emote(MT.White,"Tiorpat Tornwing shouts, 'I'm not afraid of you, and I will not back down. This time you've threatened the wrong Dragorn.");
    eq.stop_timer('flavor');
    eq.stop_timer('flavor2');
    eq.stop_timer('flavor3');
    eq.stop_timer('flavor4');
    eq.set_timer('depop', 1200 * 1000);
  end
end

function Tiorpat_Combat(e)
 if e.joined then
		eq.set_timer('link', 5 * 1000); -- cycle aggro link every 5 sec
		eq.set_timer('adds', 20 * 1000);
		if(not eq.is_paused_timer('depop')) then
			eq.pause_timer('depop');
		end
	else
		eq.resume_timer('depop');
		eq.stop_timer('link');
		eq.stop_timer('adds');
	end
end

function Add_Signal(e)
	if add_sequence == 0 then
		
		if (e.self:CastToNPC():GetX() == -389) then
			add_sequence = add_sequence + 1;
			e.self:SetSpecialAbility(24, 0);
    			e.self:SetSpecialAbility(35, 0);
			eq.zone_emote(MT.White,  e.self:GetCleanName() .. " shouts, 'It is an honor to fight at your side again, Tornwing.");
			eq.debug("add sequence: " ..  add_sequence);
			
		end
	
	elseif add_sequence == 1 then
		if e.self:GetX() == -146 then
			add_sequence = add_sequence + 1;
			e.self:SetSpecialAbility(24, 0);
    			e.self:SetSpecialAbility(35, 0);
			eq.zone_emote(MT.White,  e.self:GetCleanName() .. " shouts, 'It is an honor to fight at your side again, Tornwing.");
			eq.debug("add sequence: " ..  add_sequence);
		end
	
	elseif add_sequence == 2 then
		if e.self:GetX() == -437 then
			add_sequence = add_sequence + 1;
			e.self:SetSpecialAbility(24, 0);
    			e.self:SetSpecialAbility(35, 0);
			eq.zone_emote(MT.White,  e.self:GetCleanName() .. " shouts, 'It is an honor to fight at your side again, Tornwing.");
			eq.debug("add sequence: " ..  add_sequence);
		end
	elseif add_sequence == 3 then
		if e.self:GetX() == -374 then
			add_sequence = add_sequence + 1;
			e.self:SetSpecialAbility(24, 0);
    			e.self:SetSpecialAbility(35, 0);
			eq.zone_emote(MT.White,  e.self:GetCleanName() .. " shouts, 'It is an honor to fight at your side again, Tornwing.");
			eq.debug("add sequence: " ..  add_sequence);
		end
	elseif add_sequence == 4 then
		if e.self:GetX() == -311 then
			add_sequence = add_sequence + 1;
			e.self:SetSpecialAbility(24, 0);
    			e.self:SetSpecialAbility(35, 0);
			eq.zone_emote(MT.White,  e.self:GetCleanName() .. " shouts, 'It is an honor to fight at your side again, Tornwing.");
			eq.debug("add sequence: " ..  add_sequence);
		end
	elseif add_sequence == 5 then
		if e.self:GetX() == -193 then
			add_sequence = add_sequence + 1;
			e.self:SetSpecialAbility(24, 0);
    			e.self:SetSpecialAbility(35, 0);
			eq.zone_emote(MT.White,  e.self:GetCleanName() .. " shouts, 'It is an honor to fight at your side again, Tornwing.");
			eq.debug("add sequence: " ..  add_sequence);
		end
	elseif add_sequence == 6 then
		if e.self:GetX() == -289 then
			add_sequence = add_sequence + 1;
			e.self:SetSpecialAbility(24, 0);
    			e.self:SetSpecialAbility(35, 0);
			eq.zone_emote(MT.White,  e.self:GetCleanName() .. " shouts, 'It is an honor to fight at your side again, Tornwing.");
			eq.debug("add sequence: " ..  add_sequence);
		end
	elseif add_sequence == 7 then
		if e.self:GetX() == -469 then
			add_sequence = add_sequence + 1;
			e.self:SetSpecialAbility(24, 0);
    			e.self:SetSpecialAbility(35, 0);
			eq.zone_emote(MT.White,  e.self:GetCleanName() .. " shouts, 'It is an honor to fight at your side again, Tornwing.");
			eq.debug("add sequence: " ..  add_sequence);
		end
	end
end

function Tiorpat_Death(e)
	eq.depop_all(336058);
	eq.depop_all(336057);
	eq.depop_all(336059);
	eq.depop_all(336060);
end

function event_encounter_load(e)
eq.register_npc_event('tiorpat', Event.spawn,          336061, Tiorpat_Spawn);

eq.register_npc_event('tiorpat', Event.combat,          336061, Tiorpat_Combat);
eq.register_npc_event('tiorpat', Event.timer,          336061, Tiorpat_Timer);
eq.register_npc_event('tiorpat', Event.signal,          336061, Tiorpat_Signal);
	eq.register_npc_event('tiorpat', Event.death_complete,          336061, Tiorpat_Death);
	
eq.register_npc_event('tiorpat', Event.signal,          336058, Add_Signal);
eq.register_npc_event('tiorpat', Event.signal,          336057, Add_Signal);
	
end
