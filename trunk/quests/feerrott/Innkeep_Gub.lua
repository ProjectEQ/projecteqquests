function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Huh? Oh hi " .. e.other:GetName() .. ". Youse want to buy sumthin?");
	end
end

-- END of FILE Zone:feerrott  ID:47144 -- Innkeep_Gub