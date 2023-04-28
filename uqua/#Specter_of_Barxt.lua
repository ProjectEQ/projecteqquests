function event_say(e)
	local qglobals = eq.get_qglobals(e.self); 
	local instance_id = eq.get_zone_instance_id();
	local has_failed = qglobals[instance_id.. '_vrexguardianfail'] ~= nil

	if e.message:findi("hail") then
		if has_failed then
			e.self:Say("Oh no. What have you done? When you slew me, my existence was tied closely to the Guardian of Destruction. With my death I have lost a part of myself. I will be trapped here - bound to this hellish temple and surrounded by the evidence of my failure for all eternity. Why did you interfere with the ritual? If only you had destroyed the Guardian first...'");
		else
			if not e.other:HasItem(60252) then
				e.self:Say("Thank you for helping me see the truth. When you slew the construct, I was driven to the brink of insanity. By destroying my mortal self, you freed my tortured spirit. Please accept this offering. It is a fragment of a master key. Once you have the first two pieces of the High Temple key, you will be able to bypass the wards that protect Qvic. When you have located all three fragments you may find a way to gain entrance into the lair of Txevu. The Muramites have taken control of it and I fear that even now they may be defacing our most sacred temple. Please remember that while you have come far, this is but one small step in your quest to free Taelosia. There are many challenges that yet await you.");
				e.other:SummonItem(60252); -- Item: Fragment of the High Temple
			end
		end
	end
end
