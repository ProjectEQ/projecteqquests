-- items: 52524
function event_say(e)
	if(e.message:findi("hail") and e.other:HasItem(52524) == true) then
		e.self:Say("You have trophy, Shrunken Head.  That from Hatchet I see.  Means you have Ur-Koraag respect.  Strong are " .. e.other:GetName() .. ".  If share with me the trophy, Ur-Koraag share with you tale.");
	elseif(e.message:findi("hail")) then
		e.self:Say("Me no want to hurt strangers.  Go away, else you end up like Hatchet's other playthings.");
	elseif(e.message:findi("forget")) then
		e.other:Message(0,"You feel as though you have been judged, and that this decision may affect you sometime in the future.");
		e.self:Emote("squinches his face tightly, lost in thought, 'Maybe that be true.  After dozens, hundreds, thousands years, maybe the life of a mortal some distant and forgot memory.");
	elseif(e.message:findi("superiority")) then
		e.other:Message(0,"You feel as though you have been judged, and that this decision may affect you sometime in the future.");
		e.self:Emote("squinches his face tightly, lost in thought, 'Life for them is more complex than me can understand.  They struggle always, against each other.  Fighting for control and better standing in the Keep.  Blood drinkers treat those above them with charm and those below get contempt.  Underlings like me treated worst of all.  Mortals is spit on to show how they better.");
	elseif(e.message:findi("mortals is food")) then
		e.other:Message(0,"You feel as though you have been judged, and that this decision may affect you sometime in the future.");
		e.self:Emote("squinches his face tightly, lost in thought, 'Maybe that be true.  You no treat your food with respect and care.  So it be that blood drinkers treat their meals with indifference.");
	elseif(e.message:findi("angry")) then
		e.other:Message(0,"You feel as though you have been judged, and that this decision may affect you sometime in the future.");
		e.self:Emote("squinches his face tightly, lost in thought, 'That make no sense, " .. e.other:GetName() .. ".  Me know angry and blood drinkers no mad.  They malicious.  They selfish.  But they no angry.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 52524})) then	-- Shrunken Head
		e.self:Emote("traces a clawed finger along the curves of the Shrunken Head. 'This no longer remnant of a being.  To those living here, this badge.  Trophy.  Mortal life mean nothing to those who make Dreadspire their home.  Lives are used, like tools.  Thrown away when no further needed.  Why that so?  Could be blood drinkers [forget] what it like to be mortal.  Or maybe they hold no care toward life to shows [superiority] to others.  Or now that [mortals is food], it follows that they is also tools.  Maybe they just [angry].");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- need to add AE blocker AA when turning in Shrunken Head
