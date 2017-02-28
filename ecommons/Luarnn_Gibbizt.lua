function event_say(e)
	local instance_id_list = {["rujg"] = 50, ["rujd"] = 50};
	local inst_name;
	
  if (e.other:HasItem(41000) or e.other:HasItem(40999)) then 
    if (e.message:findi('hail')) then
      e.self:Say("Thinking of venturing into the Rujarkian Hills? I admire that kind of spirit. Coincidentally, we're looking for a few brave souls to help us with an interesting task -- if you don't mind danger.  If you can rally the call of your friends perhaps you can help us with a serious [" .. eq.say_link('problem', false, 'problem') .. "].  I can also show you how to abandon your [" .. eq.say_link("expedition",false,"expedition") .. "]");

    elseif (e.message:findi('problem')) then
      e.self:Say("'A party of our most experienced adventurers recently went to the Rujarkian Hills as scouts.  We have not heard from them for several days and suspect that they've been captured. We need you to gather a force and make an assault on the Rujarkian jails. Find the eight members of the missing party and free them. Be warned, the Rujarkian Warden is a brute even by orcish standards. He will not allow his prisoners to escape while he still draws breath.  Are you [" .. eq.say_link('interested', false, 'interested') .. "]?");
      
    elseif (e.message:findi('interested') ) then
		--verify not in any related instance
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
		  local lockout_globals = {{ "LDON_rujd", "LDoN Raid: Rujarkian Hills: Prison Break"}}

		  local request = instance_requests.ValidateRequest('raid', "rujd", 50, 6, 54, 61, {any = {41000, 40999}}, e.other, lockout_globals);
		  if (request.valid and request.flags == 1) then
			instance_requests.DisplayLockouts(e.other, e.other, lockout_globals)
		  elseif (request.valid and request.flags == 0) then
			local raid = e.other:GetRaid();
			local instance_id = eq.create_instance("rujd", 50, 21600);
			eq.set_global(instance_id.."_rujd_bit",tostring(request.flags),7,"H6");
			if (raid.valid) then
			  eq.assign_raid_to_instance(instance_id);
			  e.other:Message(15,"The Rujarkian Hills: Prison Break is now available to you.");
			end
			e.self:Say("Bring our people back alive, " .. e.other:GetName() .. ". Please.");     
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
end