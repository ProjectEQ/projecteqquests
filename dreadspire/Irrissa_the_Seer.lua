-- items: 52523
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah, " .. e.other:GetName() .. ". You have returned.  I have watched as you walked your path.  The reflecting pool has shown me of your feats.  You were introduced to the cruel and unpredictable malice of Graniteclaw and lived to tell about it.  Now I sense that you wish to understand more.  Allow me to hold the Rune-Etched Stone and I will grant you the understanding you seek.");
	elseif(e.message:findi("Disgusted")) then
		e.other:Message(0,"You feel as though you have been judged, and that this decision may affect you sometime in the future.");
		e.self:Emote("nods. 'An understandable response.  The Master places no value on life.  Even his closest servants and guardians are nothing more than disposable tools, and this must appear disgusting and deplorable to an outsider.");
	elseif(e.message:findi("sorrowful")) then
		e.other:Message(0,"You feel as though you have been judged, and that this decision may affect you sometime in the future.");
		e.self:Emote("nods. 'An understandable response.  When you can see how pitiful it is to be forced to shatter another's existence in order to see your own, it's hard not to feel sorry for the Master's predicament.  To have no concept of self is a horrible curse.");
	elseif(e.message:findi("furious")) then
		e.other:Message(0,"You feel as though you have been judged, and that this decision may affect you sometime in the future.");
		e.self:Emote("nods. 'An understandable response.  There are many that look upon the Master as an aberration.  There are many that have attempted to destroy him for his crimes.  There are none that have succeeded.");
	elseif(e.message:findi("apathetic")) then
		e.other:Message(0,"You feel as though you have been judged, and that this decision may affect you sometime in the future.");
		e.self:Emote("nods.  'I must warn you of the perils of apathy, " .. e.other:GetName() .. ".  A lack of convictions is the worst of all evils.  You would be far better served by taking a stand, and making a real decision.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 52523})) then	-- Rune-Etched Stone
		e.self:Emote("directs your attention to the seeing pool once again.  As the ripples clear you can make out a shadowy individual gazing into a full-length mirror.  He casts no reflection.  The figure sees nothing, but continues to gaze intently as if trying to recall what it was once like to see himself.  Irrissa speaks softly, 'This man has riches, ancient artifacts, immortality, and slaves tending to his every need, and yet he would exchange that for the opportunity to gaze upon his own reflection again.  Without the aid of a reflection, this figure seeks to understand himself through the reactions of others.  The fate of these others is of no consequence to him.  They are used, coerced, and destroyed for the sake of shaping and redefining his ego.  Tell me, how does this realization make you feel about the figure?  [Disgusted], [sorrowful], [furious], or [apathetic]?");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- need to add AA blocker upon Rune-Etched Stone turn in
