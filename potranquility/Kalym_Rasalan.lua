-- Wizard Epic 1.5 NPC, Step 4
-- items: 12593

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and (qglobals.wiz_epic_wisp == "1") and (qglobals.wiz_epic_shard == "1")) then
		e.self:Say("Hello " .. e.other:GetName() .. ", Talwyn told me of the coming of new recruits. I suppose he told you that you would need to use the magic in our woven tapestries to create a satchel to hold something very delicate? Well, you are lucky enough that I have this finished swatch of tapestry here that you can use. I am busy and can't tailor it for you though. You will need to tailor it yourself. If you take the tapestry, a backpack pattern, and a silk cord you should be able to tailor it with moderate effort.");
		e.other:SummonItem(12593); -- Summon Silken Tapestry
		eq.set_global("wiz_epic","3",5,"F");
	end
end