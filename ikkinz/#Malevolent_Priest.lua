--Ikkinz Group Trial #2: Twin Struggles  
function event_enter(e)
	eq.set_timer("nukes", 5 * 1000);
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 3 * 1000);	
	else
		eq.stop_timer("OOBcheck");
	end
end

function event_spawn(e)
	eq.set_timer("regen", 3 * 1000);
end

function event_timer(e)
if(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetX() < -40 or e.self:GetX() > 32) then
				e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
				e.self:GotoBind();
				e.self:WipeHateList();
			else
				eq.set_timer("OOBcheck", 3 * 1000);
			end
elseif(e.timer=="regen") then
	eq.stop_timer("regen");
	e.self:ModifyNPCStat("hp_regen", "1");
	e.self:SetOOCRegen(0);
	local ex = e.self:GetX();
	local ey = e.self:GetY();
	local ez = e.self:GetZ();
	eq.set_proximity(ex - 60, ex + 60, ey - 60, ey + 60, ez - 10, ez + 20);
elseif(e.timer=="nukes") then

	local get_client=eq.get_entity_list():GetRandomClient(e.self:GetX(),e.self:GetY(),e.self:GetZ(),3136);

	--get client within 56 radius			
		if (get_client.valid) then
			local rand = math.random(1,3);
				if (rand == 1) then
					e.self:CastSpell(4992,get_client:GetID()); --Malevolent Assault (4992)
					e.self:Say("I can feel your distress as you defend against this malevolent assault!");
				elseif (rand == 2) then
					e.self:CastSpell(4991,get_client:GetID()); --Coordinated Strike (4991)
					e.self:Say("Our combined powers shall destroy you!");
				elseif (rand == 3) then
					e.self:CastSpell(4993,get_client:GetID()); --Malevolent Vex (4993)
					e.self:Say("May your soul be torn by this spiteful vexer!");

				end
		end
end
end

function event_signal(e)
 local hp = e.self:GetMaxHP() * .10;
    if ( (e.self:GetHP() - hp ) > 0 ) then 
      e.self:SetHP( e.self:GetHP() - hp );
	local el = eq.get_entity_list();
  	if (el:IsMobSpawnedByNpcTypeID(294086) == false and el:IsMobSpawnedByNpcTypeID(294087) == false and el:IsMobSpawnedByNpcTypeID(294088) == false and el:IsMobSpawnedByNpcTypeID(294089) == false and el:IsMobSpawnedByNpcTypeID(294090) == false) then --all servitors are down
	e.self:SetSpecialAbility(24, 0); --turn off immunity
        e.self:SetSpecialAbility(35, 0); --turn off immunity
	end
end
end


function event_death_complete(e)
	local el = eq.get_entity_list();
  	
	if (el:IsMobSpawnedByNpcTypeID(294629) == false) then --#Malevolent_Priest_ (294629)
		Instance_Win();
		--check for other malevolent priest, if both are down, instance is won
	end
end

function Instance_Win(e)
local dz = eq.get_expedition()
    if dz.valid then
      dz:SetLocked(true, ExpeditionLockMessage.Close)
      dz:AddReplayLockoutDuration(eq.seconds("16h"))

      eq.spawn2(294140,0,0,-18,-139,-2,384); -- NPC: a_pile_of_bones
      eq.spawn2(294139,0,0,-18,-271,-2,128); -- NPC: a_pile_of_bones
	eq.zone_emote(15, "Your expedition is nearing its close. You cannot bring any additional people into your expedition at this time.")
      eq.zone_emote(0, "The Malevolent Priests have been defeated! Though the legion may send replacements, you have finished what you sought out to do and delayed their progress for a time! Congratulations!")
      eq.ZoneMarquee(10, 510, 1, 1, 6000, "The Malevolent Priests have been defeated! Congratulations!");
    end
  end
