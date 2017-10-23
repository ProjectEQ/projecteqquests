--Vrex_Xalkak`s_Sentinel (294593)
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
function event_spawn(e)
	local qglobals = eq.get_qglobals(e.self);
	if (qglobals["vrexkill1"] ==nil) then	
		local random_class=pick_class();
		eq.set_global("vrexkill1", tostring(random_class), 3, "H6");
		e.self:Say("rc:" .. random_class);
	end
end

function event_death_complete(e)
	local qglobals = eq.get_qglobals(e.self);
	if (qglobals["vrexkill1"] == tostring(e.other:GetClass())) then
		eq.zone_emote(15,"The sentinel's rubble drops to the ground. It has been defeated.");
		eq.signal(294597,1,0);
	else
		eq.zone_emote(15,"Your skills were insufficient to defeat the sentinel!");
		if(qglobals["vrexkill1"] == "1") then
			eq.zone_emote(15,"The creature fears brute force and brawn");
		elseif(qglobals["vrexkill1"] == "2") then
			eq.zone_emote(15,"The creature has a dread of celestial spirits");
		elseif(qglobals["vrexkill1"] == "3") then
			eq.zone_emote(15,"A holy blade daunts the creature");
		elseif(qglobals["vrexkill1"] == "4") then
			eq.zone_emote(15,"The creature fears true shots and fast blades")
		elseif(qglobals["vrexkill1"] == "5") then
			eq.zone_emote(15,"The creature dreads the strike of dead");
		elseif(qglobals["vrexkill1"] == "6") then
			eq.zone_emote(15,"The creature seems weak in the face of the power of nature");
		elseif(qglobals["vrexkill1"] == "7") then
			eq.zone_emote(15,"The creature fears focused tranquility");
		elseif(qglobals["vrexkill1"] == "8") then
			eq.zone_emote(15,"The creature fears a foreboding melody");
		elseif(qglobals["vrexkill1"] == "9") then
			eq.zone_emote(15,"The creature ignores anything behind it");
		elseif(qglobals["vrexkill1"] == "10") then
			eq.zone_emote(15,"The creature cringes at the appearance of talismans");
		elseif(qglobals["vrexkill1"] == "11") then
			eq.zone_emote(15,"The creature fears doom of death");
		elseif(qglobals["vrexkill1"] == "12") then
			eq.zone_emote(15,"falters when struck with the power of the elements");
		elseif(qglobals["vrexkill1"] == "13") then
			eq.zone_emote(15,"The creature appears vulnerable to summoned elements.");
		elseif(qglobals["vrexkill1"] == "14") then
			eq.zone_emote(15,"The creature's mind and body are vulnerable");
		elseif(qglobals["vrexkill1"] == "15") then
			eq.zone_emote(15,"The creature fears deep gashes of feral savagery");
		elseif(qglobals["vrexkill1"] == "16") then
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
	
	for i=1, 16 do
		if (class_in_zone[i]~=0) then
			eq.zone_emote(0,"class: " .. i .. " " .. class_in_zone[i]);
		end
	end	
	
	::rollclass::
	local random_class = math.random(16)
	if class_in_zone[random_class]==0 then
		goto rollclass
	end
	return random_class
end