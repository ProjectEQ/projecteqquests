--Ikkinz Raid #4: Chambers of Destruction 
function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 3 * 1000);
		eq.set_timer("crumbling",  math.random(1,3) * 1000);
		eq.set_timer("earthen",  math.random(1,3) * 1000);
		eq.set_timer("cataclysm",   math.random(1,3) * 1000);
		eq.set_timer("random", 5 * 1000);
		
	else
		eq.stop_timer("OOBcheck");
		eq.stop_timer("crumbling");
		eq.stop_timer("earthen");
		eq.stop_timer("cataclysm");
		eq.stop_timer("random");
	end
end


function event_timer(e)
if(e.timer=="OOBcheck") then
eq.stop_timer("OOBcheck");
	if (e.self:GetX() < 500 or e.self:GetX() > 700 or e.self:GetY() > -120 or e.self:GetY() < -300) then
		e.self:CastSpell(3791,e.self:GetID()); -- Spell: Ocean's Cleansing
		e.self:GotoBind();
		e.self:WipeHateList();
		e.self:SetHP(e.self:GetMaxHP());
	else
		eq.set_timer("OOBcheck", 3 * 1000);
	end
elseif(e.timer=="crumbling") then
  eq.stop_timer("crumbling");
  e.self:CastedSpellFinished(4662, e.self:GetHateRandom()); --Crumbling Stone (4662)
  eq.set_timer("crumbling", math.random(30,32) * 1000);
elseif(e.timer=="earthen") then
  eq.stop_timer("earthen");
  e.self:CastedSpellFinished(4188, e.self:GetHateRandom()); --Earthen Shrapnel (4188)
  eq.set_timer("earthen", math.random(30,32) * 1000);
elseif(e.timer=="cataclysm") then
  eq.stop_timer("cataclysm");
  e.self:CastedSpellFinished(4661, e.self:GetHateRandom()); --Cataclysm of Stone (4661)
  eq.set_timer("cataclysm", math.random(30,32) * 1000);
elseif (e.timer == "random") then
		local rand = math.random(1,100);
		if (rand >= 85) then -- 15 % for adds to spawn
		e.self:Emote("trembles violently as lesser constructs emerge from the ground.");
		eq.spawn2(294616,0,0,534,-261,-50,127);
		eq.spawn2(294616,0,0,553,-239,-50,127);
		eq.spawn2(294616,0,0,554,-189,-50,127);
		eq.spawn2(294616,0,0,536,-167,-50,127);
    end
end
end

function event_death_complete(e)
	eq.unique_spawn(294620,0,0,815,139,-72,256); -- NPC: #Keeper_of_the_Altar
	eq.zone_emote(0, "As the construct falls you sense that a very powerful protector of the altar is waiting for you.");
end
