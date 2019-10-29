function event_say(e)
	if (e.other:GetFaction(e.self) <= 5) then
		if(e.message:findi("hail")) then
		e.self:Say("Do not tread to the halls behind me mortals.  Beyond this point is the holy shrine dedicated to Veeshan.  You have no business beyond here unless you wish to simply lose your life.");
		end
	end
end
