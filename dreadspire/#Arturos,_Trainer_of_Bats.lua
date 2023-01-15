-- items: 52522
function event_say(e)
	if(e.message:findi("hail") and e.other:HasItem(52522) == true) then
		e.self:Emote("sniffs the air as you approach.  His eyes go wide. 'You bring news of my favorite.  What has happened to Redfang?  Please, let me see!");
	elseif(e.message:findi("hail")) then
		e.self:Emote("extends his palm, holding a piece of red meat.  A nearby bat alights on his arm.  It quickly swallows the chunk of food, and flaps away.  'Do not worry, Probard.  The bats are quite tame when they grow to trust you.  I know them all by name:  Cedric, Hanna, Ellis, Maximillion, Etrias and... Oh, pardon me.  One of my [children] has gone missing as of late and his disappearance has caused me quite a bit of grief.");
	elseif(e.message:findi("children")) then
		e.self:Say("Yes, one of my prized pets has flown the coop, or so to speak.  It's not unusual for him to leave for extended periods of time, but he has been gone longer than usual.  He was the largest of his kind: a thing of beauty covered in vermilion-hued fur.  I fed him by hand, you see.  If you uncover his whereabouts, please let me know.  His name is [Redfang].");
	elseif(e.message:findi("Redfang")) then
		e.self:Emote("sighs, 'Such a beautiful creature.  When will Redfang return, I wonder?");
	elseif(e.message:findi("mere accident")) then
		e.other:Message(0,"You feel as though you have been judged, and that this decision may affect you sometime in the future.");
		e.self:Emote("pauses to consider your words and shakes his head. 'No, " .. e.other:GetName() .. ".  One does not find their way into the Demi-Plane of Blood by accident.  If you end up in that place, it's for a reason.  I respect your right to your own beliefs, but that's a fallacy, pure and simple.");
	elseif(e.message:findi("beauty")) then
		e.other:Message(0,"You feel as though you have been judged, and that this decision may affect you sometime in the future.");
		e.self:Emote("pauses to consider your words and nods, thoughtfully. 'Yes, " .. e.other:GetName() .. ".  That is possible.  The Master takes pleasure in beauty.  This is evident in his choice of decor and the guests that he invites to spend time in his house.  The Keep is gaudy and meticulously cared for by the servants.  And while certain guests were obviously welcomed in large part due to their dashing looks, I suspect that the beauty the Master is most attracted to is his own.  This is tragically ironic since he cannot see his own reflection.");
	elseif(e.message:findi("strength")) then
		e.other:Message(0,"You feel as though you have been judged, and that this decision may affect you sometime in the future.");
		e.self:Emote("pauses to consider your words and nods, thoughtfully. 'Yes, " .. e.other:GetName() .. ".  That is possible.  I'm certain the Master enjoys the company of uniquely powerful beings.  Their presence could serve as a comparison and reminder of his own omnipotence.");
	elseif(e.message:findi("control or destroy")) then
		e.other:Message(0,"You feel as though you have been judged, and that this decision may affect you sometime in the future.");
		e.self:Emote("pauses to consider your words and nods, thoughtfully. 'Yes, " .. e.other:GetName() .. ".  That is possible.  Rumor has it that his most cherished guests are those that would attempt to slay him.  He relishes this attention.  It feeds his ego.  Hah, perhaps the reason they even located his home is because he wanted that attention.  It is, depending on your point of view, a sort of homage.  As far as the ruler of the Demi-Plane is concerned, intruders are delightfully amusing.   None of those that dared cross the threshold of his hidden Keep have even a remote chance of harming him.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 52522})) then	-- Congealed Blood of Redfang
		e.self:Emote("uncorks the vial of Redfang's blood, inhales deeply, and winces.  'This is hardly the animal I once knew.  He had crossed over; ascended.  Redfang became something greater, yet more feral and dangerous.  I wonder if he would have recognized his trainer.  Ah, yet another casualty of the Demi-Plane of Blood.  The most well-bred individuals find their way there and are twisted by that place.  Is it a [mere accident] that they stumble into the Demi-Plane?  Do you think the Master is obsessed with their [beauty]?  Perhaps he simply wishes to compare their [strength] to his own.  It is also possible that he wishes to [control or destroy] anything that could present a potential threat to him.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- need to add AE blocker aa when Congealed Blood of Redfang turned in
