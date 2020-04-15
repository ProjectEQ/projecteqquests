-- Re-written to .lua and corrected by ##Drogerin##

local counter = 0;
local heal = 0;

function event_combat(e)
	if (e.joined) then
		eq.spawn2(207069,0,0,-34.73,-10.96,451.13,255.5); -- intially spawn a_minion_of_Maareq
		eq.set_timer("call_more", 5000);
		eq.set_timer("check_adds", 1);
		eq.set_timer("leash",1000);
	else
		eq.depop_all(207069);
		eq.stop_all_timers();
		e.self:ChangeSize(7);
		e.self:SetRace(1);
		e.self:SetSpecialAbility(7,1);
		e.self:SetSpecialAbility(5,0);
		e.self:SetSpecialAbility(4,0);
		counter = 0;
		heal = 0;
		e.self:GotoBind();
	end
end

function event_timer(e)
    if (e.timer == "call_more") then
        if e.self:IsEngaged() then
            eq.spawn2(207069,0,0,-34.73,-10.96,451.13,255.5);    --a_minion_of_Maareq (207069)
        else
            eq.stop_timer("call_more");
        end
	elseif (e.timer == "leash") then
		if e.self:GetZ() < 330 or e.self:GetZ() > 520 then
			e.self:Emote(" dissolves into a swirling mist and moves back across the room");
			e.self:GotoBind();
			eq.set_timer("heal",6000);
			e.self:HealDamage(8000);
			eq.set_timer("leash", 1000);
		end
	elseif (e.timer == "heal") then
			e.self:HealDamage(8000);
			heal = heal + 1;
			eq.debug("heal " .. heal );
				if heal == 3 then
					heal = 0;
					eq.stop_timer("heal");
				end
    elseif (e.timer == "check_adds") then
        local mob_list = eq.get_entity_list():GetMobList();
        
        if mob_list ~= nil then
            for mob in mob_list.entries do
                if mob:GetNPCTypeID() == 207069 and mob:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 5 then
                    mob:Emote("adheres to Maareq's flesh and is quickly absorbed!");
					counter = counter + 1;
					eq.debug("counter " .. counter );
					eq.signal(207004,1); -- NPC: Maareq_the_Prophet
                    mob:Depop();
                end
            end
        end
     end
end

function event_signal(e)
	if e.signal == 1 and counter == 10 then
		e.self:Emote("raises his arms towards the sky and screams! His exposed skin bulges and writhes, as the creatures that clung to him move beneath its surface.");
		e.self:Shout("My prophecy was fulfilled for Saryrn.  Your fate shall come to fruition as well!  I have a special vision for you.  Now, step forward like the obedient cattle you are.  Let us begin this harvest of pain!");
		e.self:ChangeSize(10);
		e.self:SetSpecialAbility(SpecialAbility.flurry, 40);
	elseif e.signal == 1 and counter == 21 then
		e.self:SetRace(281);
		e.self:SetSpecialAbility(8,1);	
		e.self:SetSpecialAbility(7,0);
		e.self:SetSpecialAbility(SpecialAbility.flurry, 0);
		e.self:SetSpecialAbility(SpecialAbility.area_rampage, 5);
		e.self:Say("Your assault only prolongs the inevitable!  I can feel the fear dripping for you.  Give into it.  Give up while you still have enough energy to suffer properly!");
		eq.get_entity_list():MessageClose(e.self, false, 200, 10, "A horrific roar reverberates throughout the zone!  Every surface shakes violently for a moment as the sound rolls past you!");
	elseif e.signal == 1 and counter == 42 then
		e.self:ChangeSize(20);
		e.self:SetSpecialAbility(SpecialAbility.area_rampage, 10);
		e.self:Emote(" radiates with rage!  The ferocity of its attacks increases dramatically as its skin begins to bubble and burst in places!");
	end
end

function event_death_complete(e)
	eq.get_entity_list():MessageClose(e.self, false, 200, 10, "A strange female voice drifts from the bloated corpse that lies slumped before you, Maareq, I cannot feel your presence. What has happened? My head feels strange.... what is happening to me?");
	eq.spawn2(207014,0,0,-0.18,-6.62,466.63,252.3); -- NPC: Tylis_Newleaf
	eq.depop_all(207069);
end
