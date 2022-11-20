--[[


Tutorial Revamp Re-write by Drogerin

##Color Reference guide##
<c \"#83f07a\"> Light Green
<c \"#F07F00\"> Dark Orange


--]]


function event_say(e)
	if (e.message:findi("hail") and eq.is_task_active(8804)) then
		eq.popup("Hotbars & Hotkeys","<br><c \"#83f07a\"> Hotbars </c> are the primary tools for playing Everquest. You can use the <c \"#83f07a\"> Hotkeys </c> assigned to activate different types of abilities, alternate advancement abilities, and custom and pre-defined actions.<br><br><c \"#F07F00\"> Click 'OK' to learn managing your Hotbars.</c>",6,0,0);
	else
		e.self:QuestSay(e.other, "Most important part of battle is preperation! Ya gonna get killed out there if ya don't. Dat's the first thing ya need to learn. I can shows you.");
		eq.task_selector({8804});
	end
end

function event_trade(e)
	item_lib.return_items(e.self, e.other, e.trade);
end
