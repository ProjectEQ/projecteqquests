function event_say(e)
	if(e.message:findi("killusall")) then
		e.self:CastSpell(17155,e.other:GetID(),0,1);
	end
end