function event_say(e)
local qglobals = eq.get_qglobals(e.self,e.other);

	if(e.message:findi("hail")) then
		e.self:Say("Ho there, look who stopped by. What can I help you with, ".. e.other:GetName() .."? He smiles, Don't worry. You needn't tell me, friend, as I already know. Seems you've made quite a name for yourself. Stanos has spread the word that you helped him out with his little dilemma. I'll tell you what. In return for what you want, you can help me with my pressing issues. First and foremost, I could use a bit of cash to help run things around here. It's been hard times for me and the boys, and the money from a pouch of gems would keep us well fed, well armed, and our enemies well bribed for quite awhile. That, or I have a [" .. eq.say_link("small job") .. "] you can take care of. Whichever you'd prefer.");
	elseif(e.message:findi("small job")) then
		e.self:Say("Right. I've had my eye on a handful of poisons that are difficult to obtain from this dank hole on this secluded rock. Normally I'd ask my assistant to take care of that for me, but he's indisposed at the moment. If you could collect each item from this list, place it in the satchel and bring it back to me, that'd do the trick. When that's all taken care of, I'll explain how to properly poison a blade.");
		e.other:SummonItem(8775);
		e.other:SummonItem(52332);
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.self,e.other);
	
	if(qglobals["Fatestealer"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 9810 })) then
		e.self:Emote("accepts the satchel of poisons and cradles it as he gently sets the bag aside.");
		e.self:Say("I don't know how carefully you packaged these, ".. e.other:GetName() .. ", but the last thing I want is to reach into the bag and brush my skin against a spilled contact poison. Which reminds me, you should always wear gloves when handling toxins. You could ask my previous assistant about that, except that he's dead for that self-same reason. Now, about your reward . . . cop a squat and listen up for a moment. This is a secret that I'm entrusting to you. There's a way to paint poison onto the edge of a blade in such a manner that the toxin never needs to be reapplied. It involves using an extremely potent poison agent, mixing it with a thin lacquer, and making sure the combined solution seeps into each tiny groove of the metal. It's easier to understand if you see it written down on paper. Here, I've jotted down some notes in your journal covering the topic.");
		e.other:Message(15,"You have coerced Arly into revealing his secret");
		eq.set_global("Fatestealer_pl","1",5,"F");
	elseif(qglobals["Fatestealer"] == "1" and qglobals["Fatestealer_gem"] == nil and item_lib.check_turn_in(e.trade, {item1 = 52353})) then 
		e.self:Say("Now, about your reward . . . cop a squat and listen up for a moment. This is a secret that I'm entrusting to you. There's a way to paint poison onto the edge of a blade in such a manner that the toxin never needs to be reapplied. It involves using an extremely potent poison agent, mixing it with a thin lacquer, and making sure the combined solution seeps into each tiny groove of the metal. It's easier to understand if you see it written down on paper. Here, I've jotted down some notes in your journal covering the topic.");
		e.other:Message(15,"You have coerced Arly into revealing his secret");
		eq.set_global("Fatestealer_pl","1",5,"F");
		eq.set_global("Fatestealer_gem","1",5,"F");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
