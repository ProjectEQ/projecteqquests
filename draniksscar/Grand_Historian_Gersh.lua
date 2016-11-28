local inst_cave=1

function event_say(e)
local instance_id_list = {["dranikhollowsa"] = 0, ["dranikhollowsb"] = 0, ["dranikhollowsc"] = 0};
local inst_name;

	if (e.message:findi("hail")) then
		--expedition sentence is a hack until they are implemented
		e.self:Say("Greetings, traveler. I am Grand Historian Gersh and I can open your mind to the history of our people if you wish.  I can show you the remnants of our [" .. eq.say_link("caves",false,"caves") .. "] where we hid from the raiding Muramite Army.  I can also show you how to abandon your [" .. eq.say_link("expedition",false,"expedition") .. "]");	
	elseif (e.message:findi("caves")) then
		--instance A
		if (inst_cave==1) then
			e.self:Say("You have chosen to explore the Caves of Dranik.  The caves are home to some frightening creatures.  The caves you will be exploring arehome to a vicious pair of creatures known for their strength and cunning.  Should you come across a girplan known as the Girplan Pathmaker, or a discordling known as the Discordling Hollower, prepare yourself for a tough battle.  The battle might be hard fought, but some would say the riches are well worth it.");
			e.self:Say("Be safe in your travels through the caves, " .. e.other:GetName());
			inst_name='dranikhollowsa';
		--instance B
		elseif (inst_cave==2) then
			e.self:Say("You have chosen to explore the Caves of Dranik.  The caves are home to some frightening creatures.  The caves you will be exploring arehome to a vicious pair of creatures known for their strength and cunning.  Should you come across a kyv known as the Kyv Bowkeeper, or an Ukun known as the Ukun Fleshrender, prepare yourself for a tough battle.  The battle might be hard fought, but some would say the riches are well worth it.");
			e.self:Say("Be safe in your travels through the caves, " .. e.other:GetName());
			inst_name='dranikhollowsb';
		elseif (inst_cave==3) then
		--instance C
			e.self:Say("You have chosen to explore the Caves of Dranik.  The caves are home to some frightening creatures.  The caves you will be exploring arehome to a vicious pair of creatures known for their strength and cunning.  Should you come across a murkglider known as the Inky Murkglider, or a rat known as Silentpaw, prepare yourself for a tough battle.  The battle might be hard fought, but some would say the riches are well worth it.");
			e.self:Say("Be safe in your travels through the caves, " .. e.other:GetName());
			inst_name='dranikhollowsc';
		end
																				
		--verify not in any hollows instance
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
			local lockouts = { { 'dranikhollowsc','dranikhollowsc'} } 																			
			local requests = instance_requests.ValidateRequest('group',inst_name, 0, 3, 6, 65, nil, e.other, lockouts);
			if (requests.valid and requests.flags == 1) then
			  instance_requests.DisplayLockouts(e.other, e.other, lockouts);
			elseif (requests.valid and requests.flags == 0) then		 
			  local instance_id = eq.create_instance(inst_name,0, 21600);
			  eq.assign_group_to_instance(instance_id);
			  local group = e.other:GetGroup();
			  set_compass_cave(group);		  			  
			  inst_cave=math.mod(inst_cave,3)+1;
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

function set_compass_cave(group)
	for i = 0, group:GroupCount() - 1, 1 do
		local client_v = group:GetMember(i):CastToClient();
		if (client_v.valid) then
			if (inst_cave==1) then
				client_v:MarkSingleCompassLoc(-2027,17.6,207);
				client_v:Message(15,"Dranik's Hollows: Watering Hole is now available to you.");
			elseif (inst_cave==2) then
				client_v:MarkSingleCompassLoc(-2066.6,395,147);
				client_v:Message(15,"Dranik's Hollows: Fire Pit is now available to you");
			elseif (inst_cave==3) then
				client_v:MarkSingleCompassLoc(-2050, 581, 211);
				client_v:Message(15,"Dranik's Hollows: Murkglider Hive is now available to you.");
			end
		end
	end
end
