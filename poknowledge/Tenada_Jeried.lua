--Three Manuals/Sage's Box of Research
--Giren found text for the Three Manuals quest
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("I am afraid I have little that I can talk about right now.  If you like you may speak to my [instructor] he can probably tell you about our work.");
	elseif(e.message:findi("who is your instructor")) then
		e.self:Say("My instructor is Sage Balic; you will be able to find him upstairs.  Ask him about his research. I'm sure he would love to tell you about his work.");
	elseif(e.message:findi("interested in learning")) then
		e.self:Emote("considers for a moment and continues, 'Very well, but first you must prove that you are a student of the advanced arts. In order to do this, you will need to collect each of the advanced manuals in combat, stealth, and magic. You will also need to seek out a prized possession known as a Hope Stone. I believe it currently lies somewhere in the elemental planes. Return to me with these four tools of learning, and only then will you be truly worthy of what secrets the planes have to offer.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 16258, item2 = 28791, item3 = 28797, item4 = 28794})) then--Hope Stone, Advanced Combat Manual, Advanced Magic Manual, Advanced Stealth Manual
		e.self:Emote("'s eyes go wide. 'This is incredible! You have proven yourself to be truly worthy of these planar secrets, " .. e.other:GetCleanName() .. ". May its knowledge contained within guide you safely wherever you travel.'");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,{itemid = 28798, exp = 1000000});--Secrets of the Planes
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
