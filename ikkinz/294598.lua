--#Vrex_Xalkak`s_Sentinel (294598)
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
	if (qglobals[instance_id .. "vrexkill2"] ==nil) then	
		local random_class=pick_class();
		eq.set_global(instance_id .. "vrexkill2", tostring(random_class), 3, "H6");
	end
end

function event_death_complete(e)
	local qglobals = eq.get_qglobals(e.self);
	if (qglobals[instance_id .. "vrexkill2"] == tostring(e.other:GetClass())) then
		eq.zone_emote(15,"The sentinel's rubble drops to the ground. It has been defeated.");
		eq.signal(294597,1,0); -- NPC: #Trigger_Ikkinz_3
	else
		eq.zone_emote(15,"Your skills were insufficient to defeat the sentinel!");
		if(qglobals[instance_id .. "vrexkill2"] == "1") then
			eq.zone_emote(15,"The creature fears brute force and brawn");
		elseif(qglobals[instance_id .. "vrexkill2"] == "2") then
			eq.zone_emote(15,"The creature has a dread of celestial spirits");
		elseif(qglobals[instance_id .. "vrexkill2"] == "3") then
			eq.zone_emote(15,"A holy blade daunts the creature");
		elseif(qglobals[instance_id .. "vrexkill2"] == "4") then
			eq.zone_emote(15,"The creature fears true shots and fast blades")
		elseif(qglobals[instance_id .. "vrexkill2"] == "5") then
			eq.zone_emote(15,"It appears that this creature dreads the strike of death");
		elseif(qglobals[instance_id .. "vrexkill2"] == "6") then
			eq.zone_emote(15,"The creature seems weak in the face of the power of nature");
		elseif(qglobals[instance_id .. "vrexkill2"] == "7") then
			eq.zone_emote(15,"The creature fears focused tranquility");
		elseif(qglobals[instance_id .. "vrexkill2"] == "8") then
			eq.zone_emote(15,"The creature fears a foreboding melody");
		elseif(qglobals[instance_id .. "vrexkill2"] == "9") then
			eq.zone_emote(15,"The creature ignores anything behind it");
		elseif(qglobals[instance_id .. "vrexkill2"] == "10") then
			eq.zone_emote(15,"You sense the creature cringe at the appearance of talismans");
		elseif(qglobals[instance_id .. "vrexkill2"] == "11") then
			eq.zone_emote(15,"The creature cowers from the doom of death");
		elseif(qglobals[instance_id .. "vrexkill2"] == "12") then
			eq.zone_emote(15,"falters when struck with the power of the elements");
		elseif(qglobals[instance_id .. "vrexkill2"] == "13") then
			eq.zone_emote(15,"The creature appears vulnerable to summoned elements.");
		elseif(qglobals[instance_id .. "vrexkill2"] == "14") then
			eq.zone_emote(15,"The creature's mind and body are vulnerable");
		elseif(qglobals[instance_id .. "vrexkill2"] == "15") then
			eq.zone_emote(15,"The creature fears deep gashes of feral savagery");
		elseif(qglobals[instance_id .. "vrexkill2"] == "16") then
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