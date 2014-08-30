local instance_id;
local charid_list;

function event_spawn(e)
	instance_id = eq.get_zone_instance_id();
	charid_list = eq.get_characters_in_instance(instance_id);
	--set lockout
	for k,v in pairs(charid_list) do
		eq.target_global("uqualockout", "1", "H108", 0,v, 0);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		if (e.other:HasItem(60252) == false) then
			e.self:Say("Thank you for helping me see the truth. When you slew the construct, I was driven to the brink of insanity. By destroying my mortal self, you freed my tortured spirit. Please accept this offering. It is a fragment of a master key. Once you have the first two pieces of the High Temple key, you will be able to bypass the wards that protect Qvic. When you have located all three fragments you may find a way to gain entrance into the lair of Txevu. The Muramites have taken control of it and I fear that even now they may be defacing our most sacred temple. Please remember that while you have come far, this is but one small step in your quest to free Taelosia. There are many challenges that yet await you.");
			e.other:SummonItem(60252);
		end
	end
end
