--#Innoruuk (186107) real
--Innoruuk (186158) fake
--an_evil_little_imp (186195)
--#Evangelist_of_Hate (186198)
--a_spite_golem (186199)
--a_cleric_of_hate (186200)
--Event_Control_Inny (186201)

local ADDS_TYPES = {
	186199, -- a_spite_golem
	186200, -- a_cleric_of_hate
};

local imps = 0;
local addset = 0;

function Control_Spawn(e)
  eq.set_timer("popinny", 60 * 1000);
end

function Control_Signal(e)
  eq.set_timer("popinny", math.random(14400,21600) * 1000); --4-6 hrs (14400 -21600s) reset if event failed
end

function Control_Timer(e)
    if(e.timer=="popinny") then
        eq.stop_timer("popinny");
        eq.unique_spawn(186158,0,0,-460,-1597,83,0); -- Innoruuk (186158) fake
    end
end

function Real_Death(e)
    eq.depop_with_timer(186201);
end
    
function Real_Combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 3 * 1000);
		eq.stop_timer("resetevent");
	else
		eq.stop_timer("OOBcheck");
		eq.set_timer("resetevent", 300 * 1000);
	end
end


function Real_Timer(e)
if(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetY() > -1215) then
				e.self:CastSpell(3230,e.self:GetID()); -- Spell: Balance of the Nameless
				e.self:GotoBind();
				e.self:WipeHateList();
			else
				eq.set_timer("OOBcheck", 3 * 1000);
			end
elseif(e.timer=="resetevent") then
		eq.stop_timer("resetevent");
		eq.signal(186201,1); -- Event_Control_Inny (186201)
		eq.depop_all(186195); --an_evil_little_imp (186195)
		eq.depop_all(186198); --#Evangelist_of_Hate (186198)
		eq.depop_all(186199); --a_spite_golem (186199)
		eq.depop_all(186200); --a_cleric_of_hate (186200)
		eq.depop();
elseif(e.timer=="hate") then
    eq.stop_timer("hate");
    local npc_list =  eq.get_entity_list():GetNPCList();
		for npc in npc_list.entries do
		if (npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 186198)) then
			npc:AddToHateList(e.self:GetHateRandom(),1); -- add #Evangelist_of_Hate (186198) to aggro list if alive
		end
		end
end
end

function Real_Spawn(e)
	eq.set_timer("resetevent", 300 * 1000);
    eq.set_next_hp_event(30);
end

function Real_Hp(e)
    if(e.hp_event == 30) then
        eq.signal(186198,1); --#Evangelist_of_Hate (186198) wake up
        eq.set_next_hp_event(5);
        eq.set_timer("hate", 1 * 1000);
    elseif(e.hp_event == 5) then
	    if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(186198) == true) then
		    e.self:SetSpecialAbility(35, 1); --turn on immunity since EOH is alive
	    end
    end
end

function Real_Signal(e)
    e.self:SetSpecialAbility(35, 0); --turn off immunity since EOH was killed
end

function Evangelist_Signal(e)
    if (e.signal == 1) then
        e.self:SetSpecialAbility(35, 0); --turn off immunity
        e.self:SetSpecialAbility(24, 0); --turn off anti aggro
    elseif (e.signal == 2) then
        imps = imps - 1;
    elseif (e.signal == 3) then
        addset = addset - 1;
    end
end

function Evangelist_Death(e)
	eq.signal(186107,1); --signal #Evangelist_of_Hate (186198) reduce mob count
end

function Evangelist_Spawn(e)
    e.self:Say("Fools... All of you.");
    eq.set_timer("text", 3 * 1000);
	imps = 0;
	addset = 0;
end

function Evangelist_Timer(e)
    if(e.timer=="text") then
        eq.stop_timer("text");
        e.self:Say("Did you honestly believe your pathetic efforts could extinguish the unstoppable might of HATE?  I loathe you and your naivete with every fiber of my being. Know that our Lord and Master will survive as long as we children fuel his existence.");
        eq.set_timer("text2", 30 * 1000);
    elseif(e.timer=="text2") then
        eq.stop_timer("text2");
        eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 150,"The air around you is thick with tension and the walls seem to bend inward as the Evangelist continues, 'With the sum of our wicked spite, rage, and animosity... Your children call out to you.  Your exalted presence is required, your extraordinary power is desired, and a gaggle of babbling fools is in need of trial by fire. Master, allow us a true demonstration of your might.");
        eq.set_timer("spawninny", 4 * 1000);
    elseif(e.timer=="spawninny") then
        eq.stop_timer("spawninny");
        eq.unique_spawn(186107,0,0,-420,-1292,25,255); --#Innoruuk (186107) real
        eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 150,"Evangelist of Hate shouts, 'ALL PRAISE INNORUUK, OUR LORD AND CREATOR!");
        eq.set_timer("checkadds", 2 * 1000);
    elseif(e.timer=="checkadds") then
        eq.stop_timer("checkadds");
  
            if ( imps < 9 ) then
                e.self:Say("Join us, my hateful brethren!");
	            local rng = math.random(2, 3);
	            local spawned = 0;
	
	            for i = imps+1, 9 do
				    eq.spawn2(186195, 0, 0, -420, -1292, 25, 255);
		
				    spawned = spawned + 1;
				if ( spawned == rng ) then
					break;
				end
			end
			imps = imps + spawned;
		end
            if ( addset < 4 ) then
                e.self:Say("Join us, my hateful brethren!");
	            local rng = math.random(1, 2);
	            local spawned = 0;
	
	            for i = addset+1, 4 do
				    eq.spawn2(eq.ChooseRandom(ADDS_TYPES[1], ADDS_TYPES[2]), 0, 0, -420, -1292, 25, 255);				
				spawned = spawned + 1;
				if ( spawned == rng ) then
					break;
				end
			end
			addset = addset + spawned;
		end
	eq.set_timer("checkadds", 5 * 1000);
end
end

function Imp_Death(e)
    eq.signal(186198,2); --signal #Evangelist_of_Hate (186198) reduce mob count
end

function Addset_Death(e)
    eq.signal(186198,3); --signal #Evangelist_of_Hate (186198) reduce mob count
end

function Fake_Death(e)
    eq.unique_spawn(186198,25,0,-460,-1455,65,255); -- #Evangelist_of_Hate (186198)
end

function event_encounter_load(e)
    eq.register_npc_event('inny', Event.spawn, 186201, Control_Spawn);
    eq.register_npc_event('inny', Event.signal, 186201, Control_Signal);
    eq.register_npc_event('inny', Event.timer, 186201, Control_Timer);

    eq.register_npc_event('inny', Event.spawn, 186107, Real_Spawn);
    eq.register_npc_event('inny', Event.signal, 186107, Real_Signal);
    eq.register_npc_event('inny', Event.timer, 186107, Real_Timer);
    eq.register_npc_event('inny', Event.combat, 186107, Real_Combat);
    eq.register_npc_event('inny', Event.death_complete, 186107, Real_Death);
    eq.register_npc_event('inny', Event.hp, 186107, Real_Hp);

    eq.register_npc_event('inny', Event.spawn, 186198, Evangelist_Spawn);
    eq.register_npc_event('inny', Event.signal, 186198, Evangelist_Signal);
    eq.register_npc_event('inny', Event.timer, 186198, Evangelist_Timer);
    eq.register_npc_event('inny', Event.death_complete, 186198, Evangelist_Death);

    eq.register_npc_event('inny', Event.death_complete, 186158, Fake_Death);

    eq.register_npc_event('inny', Event.death_complete, 186195, Imp_Death);

    eq.register_npc_event('inny', Event.death_complete, 186199, Addset_Death);
    eq.register_npc_event('inny', Event.death_complete, 186200, Addset_Death);

end
