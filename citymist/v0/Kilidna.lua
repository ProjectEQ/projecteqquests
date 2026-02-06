function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["shadowknight_epic"] == "9" and e.message:findi("hail")) then
		e.self:Emote("screams out in pain as his body becomes wracked with spasms. Slowly his body seems to deteriorate into something not quite so human. 'Lhranc the all powerful cannot be defeated. You are doomed!");
		e.self:SetSpecialAbility(19, 0);
		e.self:SetSpecialAbility(20, 0);
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(25, 0);
		e.self:SetSpecialAbility(35, 0);
		e.self:AddToHateList(e.other,1);
	end
end