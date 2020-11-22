function event_say(e)
	local vahn = eq.get_entity_list():GetMobByNpcTypeID(160469);
	if(e.message:findi("traitor to the Validus Custodus")) then
		if(vahn.valid) then
			eq.unique_spawn(160468,0,0,-1088,42,-266,377); --#Condor (160468)
			--eq.depop(160469);
			eq.unique_spawn(160448,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --#Legionnaire_Claudius_ (160448)
			eq.depop();
		end
	end
end

function event_waypoint_arrive(e)
	local vahn = eq.get_entity_list():GetMobByNpcTypeID(160469);
	if(e.wp == 46) then
		eq.unique_spawn(160469,0,0,-1149,67,-265,100); --#Vahn (160469)
	elseif(e.wp == 47) then
		if(vahn.valid) then
			vahn:Emote("speaks with Legionnaire Claudius in hushed tones. Their whispers cannot be heard, but there is certainly something suspicious in their demeanor.");
		end
	elseif(e.wp == 48) then
		if(vahn.valid) then
			vahn:Emote("passes something to Claudius and gets a rolled up parchment in return. Their business appears to be completed and both parties prepare to go about their business.");
		end
	elseif(e.wp == 49) then
		if(vahn.valid) then
			vahn:Emote("glances in either direction and nods at Claudius before disappearing back into the shadows.");
			e.self:Emote("looks to Vahn tentatively, 'We shall meet again soon.'");
			vahn:Say("Perhaps");
			vahn:Emote("steps out of the shadows as though appearing out of thin air.");
		end
		eq.depop(160469);
		eq.depop();
	end
end
