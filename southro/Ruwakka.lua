function event_say(e)
  local instance_id_list = {["guke"] = 50, ["gukg"] = 50};
  
  if (e.other:HasItem(41000) or e.other:HasItem(40999)) then 
    if (e.message:findi("hail")) then
      e.self:Say("Me helping de adventurers of de Wayfarers Brotherhood. Me in charge of recruiting brave fighters for de strange stuff going on in de land of de froggies. If you rally de call of your friends we needs help wit dis serious [" .. eq.say_link('problem', false, 'problem') .. "].  Me can also show you how to abandon your [" .. eq.say_link("expedition",false,"expedition") .. "]");
    elseif (e.message:findi("problem")) then
      e.self:Say("We learned from de scouts that de First Witness of de Cauldron of Hate found a way to harness de foul curse in Deepest Guk. De First Witness is de strongest of them all. He amassing a group of followers large enough to make him deity! We needs you to stop de First Witness 'fore he unleash fury on us all. Are you [" .. eq.say_link('interested', false, 'interested') .. "]?");
    elseif (e.message:findi("interested")) then
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
      local lockout_globals = {{'LDON_guke', 'LDoN Raid: Deepest Guk: Ritualist of Hate'}}

      local request = instance_requests.ValidateRequest('raid', "guke", 50, 6, 54, 61, {any = {41000, 40999}}, nil, e.other, lockout_globals);
      if (request.valid and request.flags == 1) then
        instance_requests.DisplayLockouts(e.other, e.other, lockout_globals)
      elseif (request.valid and request.flags == 0) then
        local raid = e.other:GetRaid();
        local instance_id = eq.create_instance("guke", 50, 21600);
        eq.set_global(instance_id.."_guke_bit",tostring(request.flags),7,"H6");
        if (raid.valid) then
          eq.assign_raid_to_instance(instance_id);
		  e.other:Message(15,"Deepest Guk: The Curse Reborn is now available to you.");
        end
        e.self:Emote("smashes his left fist into his right palm, for effect. 'Crush de First Witness and all of dem followers!'");
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
