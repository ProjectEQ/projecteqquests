local inst_cata=1
local inst_sewer=1

function event_say(e)
local instance_id_list = {["dranikcatacombsa"] = 0, ["dranikcatacombsb"] = 0, ["dranikcatacombsc"] = 0, ["draniksewersa"] = 0, ["draniksewersb"] = 0, ["draniksewersc"] = 0};
local inst_name;

	if (e.message:findi("hail")) then
		--expedition sentence is a hack until they are implemented
		e.self:Say("Greetings, traveler. I am Grand Historian Rygua and I can open your mind to the history of our people if you wish.  I can show you the [" .. eq.say_link("catacombs",false,"catacombs") .. "] or the [" .. eq.say_link("sewers",false,"sewers") .. "]. I can also show you how to abandon your [" .. eq.say_link("expedition",false,"expedition") .. "]");			
	elseif (e.message:findi("catacombs")) then
		--instance A
		if (inst_cata==1) then
			e.self:Say("You have chosen to explore the Catacombs of Dranik. I have heard tales of frightening creatures of great power that lurk in the darkest shadows of the catacombs. Should you come across a dragorn known as Dragorn Marshal Greshka, or an ikaav enchantress known as High Enchantress Zy'chia, prepare yourself for a tough battle. The battle might be hard fought, but some would say the riches are well worth it.");
			e.self:Say("Be safe in your travels through the Catacombs, " .. e.other:GetName());
			inst_name='dranikcatacombsa';
		--instance B
		elseif (inst_cata==2) then
			e.self:Say("You have chosen to explore the Catacombs of Dranik. I have heard tales of frightening creatures of great power that lurk in the darkest shadows of the catacombs. Should you come across a noc known as Elite Overlord Vijaz, or an ikaav wizard known as High Sorceress Vi'Tara, prepare yourself for a tough battle. The battle might be hard fought, but some would say the riches are well worth it.");
			e.self:Say("Be safe in your travels through the Catacombs, " .. e.other:GetName());
			inst_name='dranikcatacombsb';
		elseif (inst_cata==3) then
		--instance C
			e.self:Say("You have chosen to explore the Catacombs of Dranik. I have heard tales of frightening creatures of great power that lurk in the darkest shadows of the catacombs. Should you come across a noc known as the Master of the Watch, or an ikaav mage named, Elite Pixxt K’illiga, prepare yourself for a tough battle. The battle might be hard fought, but some would say the riches are well worth it.");
			e.self:Say("Be safe in your travels through the Catacombs, " .. e.other:GetName());
			inst_name='dranikcatacombsc';
		end
																				
		--verify not in any sewers or cata instance
		for k,v in pairs(instance_id_list) do
			instance_id_list[k] = eq.get_instance_id(k,v);
		end
		local in_an_instance = false;
		for k,v in pairs(instance_id_list) do
			if (v > 0) then
				if (in_an_instance == false) then
					in_an_instance = true;
				end
			end
		end
		if (in_an_instance == true) then
			e.other:Message(13, "You are already in an instance.");
		else
			local instance_requests = require("instance_requests");
			local lockouts = { { 'dranikcatacombsc','dranikcatacombsc'} } 																			--change to minplayer 3
			local requests = instance_requests.ValidateRequest('group',inst_name, 0, 3, 6, 65, nil, e.other, lockouts);
			if (requests.valid and requests.flags == 1) then
			  instance_requests.DisplayLockouts(e.other, e.other, lockouts);
			elseif (requests.valid and requests.flags == 0) then		 
			  local instance_id = eq.create_instance(inst_name,0, 21600);
			  eq.assign_group_to_instance(instance_id);
			  local group = e.other:GetGroup();
			  set_compass_cata(group);
			  e.other:Message(15,"Catacombs of Dranik is now available to you.");
			  inst_cata=math.mod(inst_cata,3)+1;
			end				
		end

	elseif (e.message:findi("sewers")) then
		--instance A
		if (inst_sewer==1) then
			e.self:Say("You have chosen to explore the Sewers of Dranik. Beware during your travels there should you come across discordling named Craftsman Ferinio, or a golem known as Stonefoot. Both are rare and powerful adversaries. Should they come out of hiding, you will have a tough battle on your hands. However, some would say the riches are well worth it.");
			inst_name='draniksewersa';
		--instance B
		elseif (inst_sewer==2) then
			e.self:Say("You have chosen to explore the Sewers of Dranik. Beware during your travels there should you come across an ikaav mage named Silania Janaid, or a bat known as the Nightfang Glider. Both are rare and powerful adversaries. Should they come out of hiding, you will have a tough battle on your hands. However, some would say the riches are well worth it.");
			inst_name='draniksewersb';
		elseif (inst_sewer==3) then
		--instance C
			e.self:Say("You have chosen to explore the Sewers of Dranik. Beware during your travels there should you come across a dragorn known as the Dragorn Foreman, or an ukun known as the Ukun Sentinel. Both are rare and powerful adversaries. Should they come out of hiding, you will have a tough battle on your hands. However, some would say the riches are well worth it.");
			inst_name='draniksewersc';
		end
																			
		--verify not in any sewers or cata instance
		for k,v in pairs(instance_id_list) do
			instance_id_list[k] = eq.get_instance_id(k,v);
		end
		local in_an_instance = false;
		for k,v in pairs(instance_id_list) do
			if (v > 0) then
				if (in_an_instance == false) then
					in_an_instance = true;
				end
			end
		end
		if (in_an_instance == true) then
			e.other:Message(13, "You are already in an instance.");
		else
			local instance_requests = require("instance_requests");
			local lockouts = { { 'draniksewersc','draniksewersc'} } 																	--change to minplayer 3
			local requests = instance_requests.ValidateRequest('group',inst_name, 0, 3, 6, 65, nil, e.other, lockouts);
			if (requests.valid and requests.flags == 1) then
			  instance_requests.DisplayLockouts(e.other, e.other, lockouts);
			elseif (requests.valid and requests.flags == 0) then		 
			  local instance_id = eq.create_instance(inst_name,0, 21600);
			  eq.assign_group_to_instance(instance_id);
			  local group = e.other:GetGroup();
			  set_compass_sewer(group);
			  e.other:Message(15,"Sewers of Dranik is now available to you.");
			  inst_sewer=math.mod(inst_sewer,3)+1;
			end				
		end	

	-- this is a hack/work around until the expedition system is implemented.
	-- reused from apprentice in barindu
	elseif(e.message:findi("expedition")) then
		for k,v in pairs(instance_id_list) do
			instance_id_list[k] = eq.get_instance_id(k,v);
		end
		local in_an_instance = false;
		for k,v in pairs(instance_id_list) do
			if (v > 0) then
				if (in_an_instance == false) then
					in_an_instance = true;
				end
				e.other:Message(0,"Click the link if you wish to leave: " .. eq.say_link("leave " .. v,false,k));
			end
		end
		if (in_an_instance == false) then
			e.self:Say("You are not a member of an expedition!");
		end
	elseif(e.message:findi("leave")) then
		local instance_id;
 		for i in string.gmatch(e.message, "%S+") do
 			if (tonumber(i)) then
 				instance_id = tonumber(i);
 			end
 		end
		for k,v in pairs(instance_id_list) do
			instance_id_list[k] = eq.get_instance_id(k,v);
		end
		for k,v in pairs(instance_id_list) do
			if (v == instance_id) then
					eq.remove_all_from_instance(tonumber(v));
			end
		end
	end
end

function set_compass_cata(group)
	for i = 0, group:GroupCount() - 1, 1 do
		local client_v = group:GetMember(i):CastToClient();
		if (client_v.valid) then
			client_v:MarkSingleCompassLoc(-292.52,1031.42,-75.75);
		end
	end
end

function set_compass_sewer(group)
	for i = 0, group:GroupCount() - 1, 1 do
		local client_v = group:GetMember(i):CastToClient();
		if (client_v.valid) then
			client_v:MarkSingleCompassLoc(-140.37,-1243.2,-236.43);
		end
	end
end