--iip rewrite by Huffin
--colussus of war will still activate after poison script executes, confirmed on live. You can avoid killing the controllers to avoid this
local aneuk_emote = 0;
local poison = 0;
local box = require("aa_box");

local room_box = box();
room_box:add(-275, 389);
room_box:add(-289, 729);
room_box:add(-588, 727);
room_box:add(-599, 395);

function Ixvet_Spawn(e)
    eq.set_timer("popevent", 6 * 1000);
	poison = 0;
end

function Ixvet_Timer(e)
    if(e.timer=="popevent") then
        eq.stop_timer("popevent");
        eq.depop_all(283046); --Construct_of_War (283046)
        eq.depop_all(283153); --Talwin`s_remains (283153) untargettable
        eq.depop_all(283049); --#Colossus_of_War (283049)
        eq.depop_all(283047); --Aneuk_Controller (283047)
 
        eq.spawn2(283046,0,0,-457,672,-97,312); --Construct_of_War (283046)
        eq.spawn2(283046,0,0,-471,602,-97,449); --Construct_of_War (283046)
        eq.spawn2(283046,0,0,-533,631,-97,256); --Construct_of_War (283046)
        eq.spawn2(283046,0,0,-523,500,-97,0); --Construct_of_War (283046)
        eq.spawn2(283046,0,0,-490,500,-97,0); --Construct_of_War (283046)
        eq.spawn2(283046,0,0,-469,563,-97,384); --Construct_of_War (283046)

        eq.spawn2(283153,0,0,-574,568,-97,336); --Talwin`s_remains (283153) untargettable

        eq.spawn2(283049,0,0,-584,586,-89,130); --#Colossus_of_War (283049)

        eq.spawn2(283047,0,0,-530,533,-97,254); --Aneuk_Controller (283047)
        eq.spawn2(283047,0,0,-488,633,-97,436); --Aneuk_Controller (283047)
	elseif(e.timer=="flavor1") then
		eq.stop_timer("flavor1");
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Aneuk Controller says 'Bring that tray here, girl! I'm famished.");
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Aneuk Controller says 'Don't keep that all to yourself. Bring some of that fruit over here too!");
		eq.set_timer("flavor2", 6 * 1000);
	elseif(e.timer=="flavor2") then
		eq.stop_timer("flavor2");
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"The Aneuk Controllers quickly gorge themselves on the fruit. After a few moments, they both double over and cry out in pain.");
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"Ikaav Ixvet Pox says 'What have you done, slave! Try to poison me? You will pay for your insolence!");
		poison = poison + 1; -- aneuk controllers will not call the construct of wars to battle if poisoned
		--eq.get_entity_list():GetNPCByNPCTypeID(283081):AddToHateList(e.self, 1); -- on live abena was 'struck down' but didnt die right away
		eq.signal(283081,1); -- signal abena to lie down
    end
end

function Ixvet_Combat(e)
    if (e.joined == true) then
        eq.stop_timer("popevent");
    else
        eq.set_timer("popevent", 3 * 1000);
    end
end

function Ixvet_Death(e)
    eq.depop(283153); --Talwin`s_remains (283153) untargettable
    eq.spawn2(283048,0,0,-574,568,-98,336); -- NPC: #Talwin`s_remains loot
	eq.zone_emote(15,"As the dying cries of Ikaav Ixvet Pox echo off the city walls, the ranks of the Muramites are thrown into chaos. Seizing the opportunity, the many slaves of Barindu rise up and fight for their freedom.");
end
--killing ixvet should signal the Nihil to aggro nearby mobs, which Nihil still needs to be parsed: It seems to be random each time

function Ixvet_Signal(e)
    if (e.signal==1) then --signal from #Abena_Taifa
        e.self:Say("Be gone. I've no interest in your fruits today.");
		eq.set_timer("flavor1", 6 * 1000); 
    end
end

function Construct_Signal(e)
    if (e.signal==1) then --signal to remove immunity
        e.self:SetSpecialAbility(35, 0); --turn off immunity
        e.self:SetSpecialAbility(24, 0); --turn off anti aggro
	elseif (e.signal==2) then --signal to remove immunity
        e.self:SetSpecialAbility(35, 1); --turn on immunity
        e.self:SetSpecialAbility(24, 1); --turn on anti aggro
		e.self:WipeHateList();
    end
end

function Construct_Combat(e)
    if (e.joined == true) then
        eq.set_timer("oobcheck", 3 * 1000);
    else
        eq.stop_timer("oobcheck");
    end
end

function Construct_Timer(e)
    if not room_box:contains(e.self:GetX(), e.self:GetY()) then
        e.self:GotoBind()
        e.self:SetHP(e.self:GetMaxHP())
        e.self:CastSpell(3791, e.self:GetID())
        e.self:WipeHateList()
    end
end

function Colossus_Signal(e)
    if (e.signal==1) then --signal to remove immunity
        e.self:SetSpecialAbility(35, 0); --turn off immunity
        e.self:SetSpecialAbility(24, 0); --turn off anti aggro
    end
end

function Controller_Combat(e)
    if (e.joined == true) then
        eq.set_timer("aggrolink", 6 * 1000);
        eq.get_entity_list():GetNPCByNPCTypeID(283047):AddToHateList(e.other, 1);
        eq.get_entity_list():GetNPCByNPCTypeID(283050):AddToHateList(e.other, 1);
			if (poison == 0) then
        		eq.signal(283046,1); -- NPC: Construct of War wake up
			end
    else
        eq.stop_timer("aggrolink");
	aneuk_emote = 0;
    end
end

function Controller_Death(e)
    eq.signal(283049,1); -- NPC: Colossus of War wake up
end

function Controller_Timer(e)
	if (poison == 0) then
		if (e.timer == "aggrolink") then
			local npc_list =  eq.get_entity_list():GetNPCList();
			for npc in npc_list.entries do
			if (npc.valid and not npc:IsEngaged() and (npc:GetNPCTypeID() == 283046 or  npc:GetNPCTypeID() == 283049)) then
				npc:AddToHateList(e.self:GetHateRandom(),1); -- add Construct of War (283046) and Colossus of War 283049 to aggro list if alive
			end
			end
		end
	else
		eq.signal(283046,2); -- NPC: Construct of War go to sleep in case aggro happened before script finalizes
			if (poison == 1 and aneuk_emote == 0) then
				e.self:Emote("raises its scepter and calls out, 'Constructs, protect us from these intruders!");
				e.self:Emote("doubles over in pain, losing its concentration as the poison burns through its body.");
		
				aneuk_emote = 1; --reduce emote spam
			end
	end
end

function Talwin_Spawn(e)
	eq.set_timer("liedown", 500);
end

function Talwin_Timer(e)
	if (e.timer == "liedown") then
        	e.self:SetAppearance(3);
        	eq.stop_timer("liedown");
	end
end

function event_encounter_load(e)
eq.register_npc_event('iip', Event.spawn, 283153, Talwin_Spawn);
eq.register_npc_event('iip', Event.timer, 283153, Talwin_Timer);

eq.register_npc_event('iip', Event.spawn, 283048, Talwin_Spawn);
eq.register_npc_event('iip', Event.timer, 283048, Talwin_Timer);
	
eq.register_npc_event('iip', Event.combat, 283047, Controller_Combat);
eq.register_npc_event('iip', Event.timer, 283047, Controller_Timer);
eq.register_npc_event('iip', Event.signal, 283047, Controller_Signal);
eq.register_npc_event('iip', Event.death_complete, 283047, Controller_Death);

eq.register_npc_event('iip', Event.signal, 283049, Colossus_Signal);

eq.register_npc_event('iip', Event.signal, 283046, Construct_Signal);
eq.register_npc_event('iip', Event.combat, 283046, Construct_Combat);
eq.register_npc_event('iip', Event.timer, 283046, Construct_Timer);

eq.register_npc_event('iip', Event.signal, 283050, Ixvet_Signal);
eq.register_npc_event('iip', Event.spawn, 283050, Ixvet_Spawn);
eq.register_npc_event('iip', Event.combat, 283050, Ixvet_Combat);
eq.register_npc_event('iip', Event.timer, 283050, Ixvet_Timer);
eq.register_npc_event('iip', Event.death_complete, 283050, Ixvet_Death);

end
