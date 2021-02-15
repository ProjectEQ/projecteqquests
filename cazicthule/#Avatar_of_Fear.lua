-- huffdaddy re-vamp

local AMYGDALAN_KNIGHT_TYPE = 48248;
local GORGON_TYPE = 48246;
local SHIVERBACK_TYPE = 48247;
local SPINECHILLER_TYPE = 48245;
local TENTACLE_TYPE = 48252;
local wave = 0;

function event_spawn(e)
    wave = 0;
    eq.zone_emote(0,"Avatar of Fear shouts, 'Minions of fear hear me now! The temple of the great Cazic Thule has been defiled. I summon you to assist me in its cleansing!");
    e.self:SpellFinished(2128, e.self); -- Avatar of Fear
end

function event_waypoint_arrive(e)

    if (e.wp == 5) then
        wave = wave +1;
            if wave == 5 then
                eq.zone_emote(0,"Avatar of Fear shouts, 'In the name of the fearful one, I call forth from the abyss... DREAD!");
                eq.unique_spawn(48237, 0,0, 625, 1090, -94, 388);
                SpawnWave();
                e.self:SpellFinished(2128, e.self); -- Avatar of Fear
            elseif wave == 10 then
                eq.zone_emote(0,"Avatar of Fear shouts, 'In the name of the fearful one, I call forth from the abyss... FRIGHT!");
                eq.unique_spawn(48239, 0,0, 587, 1128, -94, 254);
                SpawnWave();
                e.self:SpellFinished(2128, e.self); -- Avatar of Fear
            elseif wave == 15 then
                eq.zone_emote(0,"Avatar of Fear shouts, 'In the name of the fearful one, I call forth from the abyss... TERROR!");
                eq.unique_spawn(48240, 0,0, 550, 1090, -94, 126);
                SpawnWave();
                e.self:SpellFinished(2128, e.self); -- Avatar of Fear
            elseif wave == 20 then
                eq.signal(48237,1);  --dread
                SpawnWave();            
            elseif wave == 22 then
                eq.signal(48239,1); --fright
                SpawnWave();
            elseif wave == 24 then
                eq.signal(48240,1); --terror
                SpawnWave();
            elseif wave == 25 then
                e.self:SetSpecialAbility(24, 0); -- Will Not Aggro off
                e.self:SetSpecialAbility(25, 0); -- Immune to Aggro off 
                e.self:SetSpecialAbility(35, 0); -- No Harm from Players off
                --active avatar of fear
            else
                eq.zone_emote(0,"Avatar of Fear shouts, 'In the name of the faceless, I command you, the minions of fear, ARISE!");
                SpawnWave();
            end
    end
end


function SpawnWave()
	
	local roll = math.random(1, 100);
	if ( roll <= 12 ) then
		eq.spawn2(SPINECHILLER_TYPE, 0, 0, 547, 1135, -93, 128);
		eq.spawn2(SPINECHILLER_TYPE, 0, 0, 630, 1090, -93, 128);
		eq.spawn2(SPINECHILLER_TYPE, 0, 0, 630, 1135, -93, 128);
		eq.spawn2(SPINECHILLER_TYPE, 0, 0, 590, 1150, -93, 128);
		eq.spawn2(SPINECHILLER_TYPE, 0, 0, 530, 1090, -93, 128);
		eq.spawn2(SPINECHILLER_TYPE, 0, 0, 630, 1050, -93, 128);
		eq.spawn2(SPINECHILLER_TYPE, 0, 0, 547, 1050, -93, 128);
		eq.spawn2(SPINECHILLER_TYPE, 0, 0, 590, 1035, -93, 128);
	elseif ( roll <= 23 ) then
		eq.spawn2(TENTACLE_TYPE, 0, 0, 566, 1088, -93, 128);
		eq.spawn2(TENTACLE_TYPE, 0, 0, 587, 1114, -93, 128);
		eq.spawn2(TENTACLE_TYPE, 0, 0, 608, 1091, -93, 128);
		eq.spawn2(TENTACLE_TYPE, 0, 0, 590, 1092, -97, 128);
		eq.spawn2(TENTACLE_TYPE, 0, 0, 588, 1067, -93, 128);
	elseif ( roll <= 34 ) then
		eq.spawn2(TENTACLE_TYPE, 0, 0, 608, 1090, -92, 128);
		eq.spawn2(TENTACLE_TYPE, 0, 0, 565, 1090, -92, 128);
		eq.spawn2(TENTACLE_TYPE, 0, 0, 600, 1107, -92, 128);
		eq.spawn2(TENTACLE_TYPE, 0, 0, 580, 1073, -92, 128);
		eq.spawn2(TENTACLE_TYPE, 0, 0, 600, 1073, -92, 128);
	elseif ( roll <= 52 ) then
		eq.spawn2(SHIVERBACK_TYPE, 0, 0, 623, 1130, -93, 128);
		eq.spawn2(SHIVERBACK_TYPE, 0, 0, 590, 1130, -93, 128);
		eq.spawn2(SHIVERBACK_TYPE, 0, 0, 638, 1093, -93, 128);
		eq.spawn2(SHIVERBACK_TYPE, 0, 0, 552, 1130, -93, 128);
		eq.spawn2(SHIVERBACK_TYPE, 0, 0, 537, 1097, -93, 128);
	elseif ( roll <= 56 ) then
		eq.spawn2(SHIVERBACK_TYPE, 0, 0, 590, 1150, -93, 128);
		eq.spawn2(SHIVERBACK_TYPE, 0, 0, 565, 1015, -93, 128);
		eq.spawn2(SHIVERBACK_TYPE, 0, 0, 610, 1015, -93, 128);
	elseif ( roll <= 74 ) then
		eq.spawn2(AMYGDALAN_KNIGHT_TYPE, 0, 0, 580, 1055, -91.7, 128);
		eq.spawn2(AMYGDALAN_KNIGHT_TYPE, 0, 0, 595, 1055, -91.7, 128);
		eq.spawn2(AMYGDALAN_KNIGHT_TYPE, 0, 0, 565, 1055, -91.7, 128);
		eq.spawn2(AMYGDALAN_KNIGHT_TYPE, 0, 0, 610, 1055, -91.7, 128);
	elseif ( roll <= 78 ) then
		eq.spawn2(AMYGDALAN_KNIGHT_TYPE, 0, 0, 645, 1090, -93, 128);
		eq.spawn2(AMYGDALAN_KNIGHT_TYPE, 0, 0, 540, 1090, -93, 128);
		eq.spawn2(AMYGDALAN_KNIGHT_TYPE, 0, 0, 590, 1150, -93, 128);
	elseif ( roll <= 96 ) then
		eq.spawn2(GORGON_TYPE, 0, 0, 629, 1132, -93, 128);
		eq.spawn2(GORGON_TYPE, 0, 0, 543, 1132, -93, 128);
		eq.spawn2(GORGON_TYPE, 0, 0, 546, 1050, -93, 128);
		eq.spawn2(GORGON_TYPE, 0, 0, 590, 1025, -93, 128);
		eq.spawn2(GORGON_TYPE, 0, 0, 632, 1050, -93, 128);
	else
		eq.spawn2(GORGON_TYPE, 0, 0, 630, 1050, -93, 128);
		eq.spawn2(GORGON_TYPE, 0, 0, 547, 1050, -93, 128);
		eq.spawn2(GORGON_TYPE, 0, 0, 590, 1035, -93, 128);
	end		
end

function event_death_complete(e)
eq.signal(48030,1); -- tahia signal of victory
eq.depop_all(48253); -- unstable rift
end
