function event_say(e)
	-- this is a hack/work around until the expedition system is implemented.
	-- reused from apprentice in barindu
	if (e.message:findi("hail")) then
		e.self:Say("[" .. eq.say_link("expedition",false,"expedition") .. "]");			
	elseif(e.message:findi("expedition")) then
		local inst_id =  eq.get_instance_id('anguish', 0);
		local in_an_instance = false;
		if inst_id > 0 then 
			in_an_instance = true 
			e.other:Message(0,"Click the link if you wish to leave: " .. eq.say_link("leave " .. inst_id,false,"Anguish"));
		else
			e.other:Message(1,"You are not a member of an expedition!");
		end
	elseif(e.message:findi("leave")) then
		local inst_id =  eq.get_instance_id('anguish', 0);
		local instance_id;		
 		for i in string.gmatch(e.message, "%S+") do
 			if (tonumber(i)) then
 				instance_id = tonumber(i);
 			end
 		end
			  
		if(inst_id == instance_id) then
			local charid_list=eq.get_characters_in_instance(instance_id);
			for k,v in pairs(charid_list) do
				eq.target_global(inst_id.."_anguish_bit", "0", "1", 0,v, 0);
			end	
			
			eq.remove_all_from_instance(inst_id);
			--e.other:Message(1,"All players removed from your Anguish expedition");
		end
	end
end