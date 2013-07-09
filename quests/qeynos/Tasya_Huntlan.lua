function event_say(e)

	local tax = eq.get_qglobals(e.other);
	
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s!  Are you just visiting Qeynos?  We have plenty of rooms available or, if your throat is parched, you can always visit Earron in our pub.",e.other:GetName()));
	elseif(e.message:findi("tax collection") and tax.tax_collection ~= nil) then
		e.self:Say("Taxes? Oh, that time again huh? Here you are. Give Vicus our best. I hear he is under the weather.");
		e.other:SummonItem(13176);
		e.other:Faction(217,-10,0);
	end
	
end

function event_signal(e)

	if(e.signal == 2) then
		e.self:Say("Yes.  He is staying here at the Lion's Mane Inn, but it is against regulations to give out room numbers.  I can tell you that he loves to see the sun rise over the ocean.");
	end
	
end
