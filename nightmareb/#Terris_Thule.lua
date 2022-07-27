       
local DEFILER_SMALL_TYPE = 221006;
local DEFILER_LARGE_TYPE = 221012;
        
 function event_spawn(e)
	eq.set_next_hp_event(95);
	eq.set_timer("gargs", 1000); --pop untargettable gargs
end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("oobcheck", 6000);
		eq.stop_timer("wipereset");
	else
		eq.stop_timer("oobcheck");
		eq.set_timer("wipereset", 60000);
	end
end
        
function SpawnDefilers(mob)
	local numSpawns = 0;
	local hateList = mob:GetHateList();
	
	for ent in hateList.entries do
		if ( ent.ent:IsClient() and ent.damage > 0 ) then
			numSpawns = numSpawns + 1;
		end
	end

	local t;
	for i = 1, numSpawns do
		t = math.random(1, 2);
		if ( t == 1 ) then
			t = DEFILER_SMALL_TYPE;
		else
			t = DEFILER_LARGE_TYPE;
		end
		eq.spawn2(t, 0, 0, -1639, -138, 133, 0); -- defilers seem to all spawn from this single point
	end
end
        
function event_hp(e)

	if ( e.hp_event == 95 ) then
		eq.get_entity_list():MessageClose(e.self, true, 250, 0, "The sound of a thousand terrified screams fills your head.  You feel yourself becoming a part of the fabric of this nightmare realm.");
		eq.set_next_hp_event(79);
		eq.set_next_inc_hp_event(96); --reset on wipe
		
	elseif ( e.hp_event == 79 ) then
		eq.set_next_hp_event(69);
		SpawnDefilers(e.self);
	
	elseif ( e.hp_event == 69 ) then
		eq.set_next_hp_event(50);
		SpawnDefilers(e.self);
	
	elseif ( e.hp_event == 50 ) then
		eq.set_next_hp_event(45);
		eq.get_entity_list():MessageClose(e.self, true, 250, 0, "As if in a waking nightmare, you feel your movements slow and your arms begin to fail you.  Each swing of your weapon feels as if it will miss its mark.   Even your legs begin to fail you, as you fall deeper into the dreamlike state!");
		e.self:CastSpell(3150, e.self:GetID()); -- Direption of Dreams
		
	elseif ( e.hp_event == 45 ) then
		e.self:SpellFinished(1139, e.self:GetHateTop()); --Defilement of Hope
		eq.set_next_hp_event(40);
	
	elseif ( e.hp_event == 40 ) then
		e.self:Shout("You will not escape my realm so easily!");
		eq.get_entity_list():MessageClose(e.self, true, 250, 0, "The air grows thick with the smell of burning mana.  A rumbling sound draws your attention to the massive statues that rest above the ancient monoliths.  The statues begin to crumble, as they shift their attention from the heavens to you!");
		eq.signal(221013, 1); --signal untargettable statues to wake up
	elseif (e.inc_hp_event == 96) then
		eq.set_next_hp_event(95);
	end
 end
        
 function event_timer(e)
	if ( e.timer == "oobcheck" ) then
            	if ( e.self:GetX() > -1580 or e.self:GetX() < -2090 or e.self:GetY() > 250 or e.self:GetY() < -280 ) then
			eq.get_entity_list():MessageClose(e.self, true, 200, 0, "Terris Thule disappears into the ether and reforms at the center of her chamber, cleansed of your magic!");
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
		end
	elseif ( e.timer == "gargs" ) then
		eq.stop_timer("gargs");
		eq.spawn2(221013,0,0,-1954,99,202,191):SetAppearance(3);  --untargettable statue
		eq.spawn2(221013,0,0,-1748,91,202,330):SetAppearance(3);  --untargettable statue
		eq.spawn2(221013,0,0,-1736,-125,202,454):SetAppearance(3);  --untargettable statue
		eq.spawn2(221013,0,0,-1958,-104,202,67):SetAppearance(3);  --untargettable statue
	elseif ( e.timer == "wipereset" ) then
		eq.stop_timer("wipereset");
		eq.depop_all(221007); -- depop active gargs
		eq.depop_all(221013); -- depop inactive gargs
		
		eq.spawn2(221013,0,0,-1954,99,202,191):SetAppearance(3);  --untargettable statue
		eq.spawn2(221013,0,0,-1748,91,202,330):SetAppearance(3);  --untargettable statue
		eq.spawn2(221013,0,0,-1736,-125,202,454):SetAppearance(3);  --untargettable statue
		eq.spawn2(221013,0,0,-1958,-104,202,67):SetAppearance(3);  --untargettable statue
	end
end
        
function event_death_complete(e)
          eq.spawn2(202368,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- planar projection
end
