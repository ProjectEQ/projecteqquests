--part of alternate access quest
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Did she send you? Hmmph, you obviously don't know what I'm talking about. Get out of my face!");
		e.other:MovePC(293,-966, 153, -423, 0);
	end
end
