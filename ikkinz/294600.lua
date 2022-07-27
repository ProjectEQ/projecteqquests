--Ikkinz Raid #3: Chambers of Transcendence   
--Vrex_Xalkak`s_Sentinel_ (294600)
--[[
1	Warrior
2	Cleric
3	Paladin
4	Ranger
5	Shadow Knight
6	Druid
7	Monk
8	Bard
9	Rogue
10	Shaman
11	Necromancer
12	Wizard
13	Mage
14	Enchanter
15	Beastlord
16	Berserker
--]]
local instance_id = eq.get_zone_instance_id();

function event_spawn(e)
	local qglobals = eq.get_qglobals(e.self);
	if (qglobals[instance_id .. "vrexkill3"] ==nil) then	
		local random_class=pick_class();
		eq.set_global(instance_id .. "vrexkill3", tostring(random_class), 3, "H6");
	end
end

function event_death_complete(e)
	local qglobals = eq.get_qglobals(e.self);
	if (qglobals[instance_id .. "vrexkill3"] == tostring(e.other:GetClass())) then
		eq.zone_emote(15,"The sentinel's rubble drops to the ground. It has been defeated.");
		eq.signal(294597,1,0); -- NPC: #Trigger_Ikkinz_3
	else
		eq.zone_emote(15,"Your skills were insufficient to defeat the sentinel!");
		if(qglobals[instance_id .. "vrexkill3"] == "1") then
			eq.zone_emote(15,"The creature fears brute force and brawn");
		elseif(qglobals[instance_id .. "vrexkill3"] == "2") then
			eq.zone_emote(15,"The creature has a dread of celestial spirits");
		elseif(qglobals[instance_id .. "vrexkill3"] == "3") then
			eq.zone_emote(15,"A holy blade daunts the creature");
		elseif(qglobals[instance_id .. "vrexkill3"] == "4") then
			eq.zone_emote(15,"The creature fears true shots and fast blades")
		elseif(qglobals[instance_id .. "vrexkill3"] == "5") then
			eq.zone_emote(15,"It appears that this creature dreads the strike of death");
		elseif(qglobals[instance_id .. "vrexkill3"] == "6") then
			eq.zone_emote(15,"The creature seems weak in the face of the power of nature");
		elseif(qglobals[instance_id .. "vrexkill3"] == "7") then
			eq.zone_emote(15,"The creature fears focused tranquility");
		elseif(qglobals[instance_id .. "vrexkill3"] == "8") then
			eq.zone_emote(15,"The creature fears a foreboding melody");
		elseif(qglobals[instance_id .. "vrexkill3"] == "9") then
			eq.zone_emote(15,"The creature ignores anything behind it");
		elseif(qglobals[instance_id .. "vrexkill3"] == "10") then
			eq.zone_emote(15,"You sense the creature cringe at the appearance of talismans");
		elseif(qglobals[instance_id .. "vrexkill3"] == "11") then
			eq.zone_emote(15,"The creature cowers from the doom of death");
		elseif(qglobals[instance_id .. "vrexkill3"] == "12") then
			eq.zone_emote(15,"falters when struck with the power of the elements");
		elseif(qglobals[instance_id .. "vrexkill3"] == "13") then
			eq.zone_emote(15,"The creature appears vulnerable to summoned elements.");
		elseif(qglobals[instance_id .. "vrexkill3"] == "14") then
			eq.zone_emote(15,"The creature's mind and body are vulnerable");
		elseif(qglobals[instance_id .. "vrexkill3"] == "15") then
			eq.zone_emote(15,"The creature fears deep gashes of feral savagery");
		elseif(qglobals[instance_id .. "vrexkill3"] == "16") then
			eq.zone_emote(15,"The creature shies from heavy blades");
		end
		eq.zone_emote(15,"It is reforming to come at you again!");
		eq.spawn2(294593,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading())
	end
end

function pick_class()
	local class_in_zone = {}
	for i=1, 16 do
		class_in_zone[i]=0
	end

	local clist = eq.get_entity_list():GetClientList();
	if (clist ~= nil ) then
		for currclient in clist.entries do
			class_in_zone[currclient:GetClass()]=1
		end
	end
	
	local random_class = math.random(16)
	while class_in_zone[random_class]==0 do
		random_class = math.random(16)
	end
	return random_class
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
end
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 3 * 1000);	
	else
		eq.stop_timer("OOBcheck");
	end
end
