-- items: 69909, 69908, 69907, 69910, 69906

-- pal prequest #Drogerin


function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	
	if qglobals["pre_pal"] == "2" then
		if (e.message:findi("hail")) and e.other:HasItem(69903) and e.other:HasItem(69904) and e.other:HasItem(69905) then
			e.self:QuestSay(e.other, "Hail to you," .. e.other:GetName() .. ". Odd, this sword piece of mine is humming and I feel it tugging towards you. Do you happen to know why? Maybe you have [" .. eq.say_link("other pieces of this broken sword") .. "] ?");
		elseif (e.message:findi("other pieces of this broken sword")) then
			e.self:QuestSay(e.other, "Aha! That must explain it. I knew this sword must have magical powers. . .I have felt its strength. You being here proved me that. [" .. eq.say_link("Would you like the piece") .. "] of the sword that I own?");
		elseif (e.message:findi("Would you like the piece")) then
			e.self:QuestSay(e.other, "Well, I won't be giving this to you for free. This surely must be a valuable sword. It is no doubt an extraordinary blade. I'll tell you what, I've been trying to create this new teleportation spell for a while now. Unfortunately, I have tried to create the spell multiple times but I keep failing it. I think I have very bad luck. Go acquire the [" .. eq.say_link("four runes") .. "] for me and return to me with them. Hopefully I can borrow some of your luck to create this spell.");
		elseif (e.message:findi("four runes")) then
			e.self:QuestSay(e.other, "Yes, the four runes were scattered by the winds to four different areas: Plane of Tranquility, Mistmoore Castle, Scarlet Desert, and the Gulf of Gunthak. Please find all four of them and bring them to me.");
		else
			e.self:Say("How to get this spell to work!");
	end
end

function event_timer(e)
	if e.timer == "spell" then
		eq.stop_timer("spell");
		e.self:Emote(" begins to cast a spell");
		e.self:Emote("'s gate collapses");
		eq.set_timer("spell2",1000);
	elseif e.timer == "spell2" then
		eq.stop_timer("spell2");
		e.self:Say("Argh! Stupid Spell!!!");
		e.self:Emote(" begins to cast the gate spell");
		e.self:Emote(" begins to cast a spell");
		e.self:Emote(" Gates");
		eq.depop_with_timer();
	end
end

		
		
	

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");

	if qglobals["pre_pal"] == "2" and item_lib.check_turn_in(e.trade, {item1 = 69909, item2 = 69908, item3 =69907, item4 =69910}) then --Xor,Zota,Wilun,Yirno
		e.self:QuestSay(e.other, "Okay, let's give this one more try. Hopefully your luck will rub off on me and I'll be able to successfully create this spell. Well here goes...");
		e.self:QuestSay(e.other, "eyes glow with a bright yellow color. He looks at you for a second, searching for something. He then looks down his lexicon and whispers a chant.",{speak_mode = SpeakMode.Emote});
		e.self:QuestSay(e.other, "'Excellent! I knew with your help I could create this spell. Thank you " .. e.other:GetName() .. ", here is your reward. Now, to try out this new teleport.");
		e.other:SummonItem(69906); -- Right side of blade
		eq.set_global("pre_pal","3",5,"F");
		eq.set_timer("spell",5000);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
