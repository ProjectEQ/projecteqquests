function event_say(e)

	local tax = eq.get_qglobals(e.other);
	
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Welcome %s. What brings you out this way? Be careful, we have had problems with bandits of late. As if the gnolls were not enough.",e.other:GetName()));
	elseif(e.message:findi("tax collection") and tax.tax_collection ~= nil) then
		e.self:Emote("looks up with tear-filled eyes and sobs uncontrollably.");
	elseif(e.message:findi("crying")and tax.tax_collection ~= nil) then
		e.self:Emote(".sniff.. Oh, dear. We do not have the money. We were just robbed by a dreadful halfling bandit named Flynn something-or-other. He took the money we had set asisde for Antonius. Please. Find this highwayman and retrieve our tax payment. ..sob..");
	end
	
end