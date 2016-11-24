function event_say(e)
	-- load the current qglobals
	local qglobals = eq.get_qglobals(e.self,e.other);
	
	if (qglobals["paladin_epic"] >= "6") then		
		local instance_requests = require("instance_requests");
		local lockouts = { { 'paladinEpicDranikCata','Dranik Catacombs A' } } 
		local requests = instance_requests.ValidateRequest('group','dranikcatacombsa', 1, 2, 6, 65, nil, e.other, lockouts);
		if (requests.valid and requests.flags == 1) then
		  instance_requests.DisplayLockouts(e.other, e.other, lockouts);
		elseif (requests.valid and requests.flags == 0) then
		  e.self:Say("Auuugh. . .Tantelus. . .the. . .catacombs. . .is where. . .my essence. . .is. . .");
		  local instance_id = eq.create_instance('dranikcatacombsa',1, 7200);
		  eq.assign_group_to_instance(instance_id);
		  e.other:Message(15,"A flash of light occurs as Redis disappears. An entrance to an unfamiliar place has been opened for you. Perhaps you should investigate there.");
		  eq.depop_with_timer();
		end		
	end
end