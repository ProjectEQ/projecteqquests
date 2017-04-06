function event_say(e)
	if(e.message:findi("reset") and e.other:Admin() >= 80 and e.other:GetGM()) then
		local instance_id = eq.get_zone_instance_id();
		eq.delete_global("Anguish_keldovan");
		eq.delete_global("Anguish_jelvan");
		eq.delete_global("Anguish_ture");
		eq.delete_global("Anguish_hanvar");
		eq.delete_global("Anguish_amv");
		eq.delete_global("Anguish_omm");
		eq.delete_global("Anguish_lower_orb");
		eq.delete_global("Anguish_upper_orb");
		eq.delete_global("Anguish_augs");
		eq.set_global(instance_id .. "_anguish_bit","0",7,"H6");
		e.other:Message(15,"instance bits reset, globals wiped for YOU only");
	end
end