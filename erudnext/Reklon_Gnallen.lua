-- Paladin Epic 1.0
-- items: 13005, 13008, 69965, 29001, 29006, 29004, 29000, 29009, 29003, 29005, 29010

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.other:HasItem(69960)) then
		if(e.message:findi("hail")) then
			e.self:Say("Good to see you friend. You appear to have had a long journey so far. We have been expecting you after Camlend sent word that you might be headed this way. Do you still [" .. eq.say_link("seek a rare gem") .. "] to help cure your friend Kemik?");
		elseif(e.message:findi("rare gem")) then
			e.self:Say("n preparation for your arrival we discussed such a rare gem that we might have for you. After the long discussion we decided it was for a good cause and we would be glad to help you. But first we must have a peaceful meal together. Go over to the Erudin Surplus store and buy us both an iron ration and a bottle of mead.");
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Hail to you, friend.  Seek you knowledge or atonement in this temple of peace?");
		elseif(e.message:findi("seek knowledge")) then
			e.self:Say("Many are the things I could speak to you of.  Have you any specific interest?");
		elseif(e.message:findi("seek atonement")) then
			e.self:Say("Yes.  Many are those who enter these halls seeking the forgiveness, the atonement of a god.  By turning their spirit against whatever wrong they have committed they may be able to receive redemption in the eyes of their diety.  Many seek such a thing, but few truly have the strength of spirit to attain it.");
		elseif(e.message:findi("temple of peace")) then
			e.self:Say("Dedicated to the god of peace, Quellious, is this temple. It is here that her clerics and paladins pray and receive inspiration.");
		elseif(e.message:findi("paladins")) then
			e.self:Say("As the clerics are the warm hand of healing, the paladins are the stalwart shield of protection, and in times of grave need the sharp sword of justice. To our post must we always remain vigilant, else dishonor might befall us.");
		elseif(e.message:findi("remain vigilant")) then
			e.self:Say("To a paladin the upholding of his duty, or honor to his temple is foremost. To fail in his duty to stand at his assigned post in time of need is a great disgrace. Few are the paladins who have done so, and their spirits have been outcast from the god of peace.");
		elseif(e.message:findi("outcast")) then
			e.self:Say("Harsh though it seems, a true paladin must always remain vigilant and dedicated to his cause. If he does not then he might find himself fallen from grace.");
		elseif(e.message:findi("fallen from grace")) then
			e.self:Say("here are a few who have done so. Only a few that come to mind. Such stories are useful to remember as reminders of our beliefs.");
		elseif(e.message:findi("stories")) then
			e.self:Say("One is the story of the paladin who fell due to his weakness in the duty of his guard post. He let himself be seduced by a peasant woman");
		elseif(e.message:findi("peasant woman")) then
			e.self:Say("Many hundreds of years ago did this story begin. There was a paladin, whose name is lost to all but our oldest leaders, who was among the greatest examples of honor. It was his post to guard the chambers to our most important halls. His fall was a creature in the guise of a poor peasant woman.");
		 -- I couldn't find any further text here
		elseif(e.message:findi("sacrifice")) then
			e.self:Say("Only this crest and the sacrifice of something that symbolizes your strength and purity will release his spirit into the cleansing flames of our lady Quellious. Go now.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["paladin_epic"] == "9" and item_lib.check_turn_in(e.trade, {item1 = 13005,item2 = 13008})) then
		e.self:Say("That was excellent " .. e.other:GetName() .. ". Take this gem and bring peace to Kemik. I don't want to hold you up any longer as you have further to travel on your journey. You should head to the city that sits before giant windmills.");
		e.other:SummonItem(69965); --erudin prayer bead
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 29001,item2 = 29006})) then
		e.self:Emote("presses the gem of purity against the breastplate. Its dark gleam softens and then glows bright once again. 'Compassion is strong in you. Few so called heroes would sacrifice their time for such a menial task as you performed. Continue your work. Hold this ancient breastplate until you have completed your task.");
		e.other:Ding();
		e.other:SummonItem(29004); -- Item: Gleaming Crested Breastplate
	elseif(item_lib.check_turn_in(e.trade, {item1 = 29000,item2 = 29009})) then
		e.self:Emote("washes the sword's blade in the water of purity. Its dark surface begins to shine, as true as the day it was forged. 'Such a sacrifice is rare among the poor. Truly, the woman must have loved her brother. Remember the lesson you have learned from her. Keep the sword until your work is done.'");
		e.other:Ding();
		e.other:SummonItem(29003); -- Item: Gleaming Crested Sword
	elseif(item_lib.check_turn_in(e.trade, {item1 = 29003,item2 = 29004,item3 = 29005})) then
		e.self:Say("I never thought our order would see these artifacts again. With the return of these relics we can now put at ease a scar upon the history of our order. This cleansing will atone for his failure. Your soul must be pure to have given so freely of yourself. Go now, take this crested token of our order. If you wish to free his soul you must undertake another sacrifice.");
		e.other:Ding();
		e.other:SummonItem(29010); -- Item: Mark of Atonement
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:24044 -- Reklon_Gnallen