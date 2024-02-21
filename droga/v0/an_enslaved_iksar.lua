--The enslaved iksar is part of the Greenmist quest line, and is for the seventh quest in the series.
--He gives a bit of flavor through most of his speech, but is also used to turn in items for a part of the Stupendous Tome.
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks up at you. You can tell his spirit is broken. His scars speak of a severe beating.");
	elseif(e.message:findi("Vok Na Zov")) then --Test of the Lord (Greenmist Quest 7/8)
		e.self:Say("Forget them. I believe all six scrolls lie in the [Kaesora Library] and that is no safe place for any explorer. The scrolls are not readable by any livng person, but I came here in search of a machine which may be able to decipher them, the [Stupendous Contraption]. Should you return to Cabilis, see that the Arch Duke hears of the scrolls.");
	elseif(e.message:findi("kaesora library")) then --Test of the Lord (Greenmist Quest 7/8)
		e.self:Say("Oh!! You heard of the ancient library I discovered in Kaesora? I think the six scrolls of [Vok Na Zov] may lie there. I have not yet actually found the location of the library and it's very dangerous to lurk within the ruins of Kaesora. I would not venture there if I were you.");
	elseif(e.message:findi("stupendous contraption")) then --Test of the Lord (Greenmist Quest 7/8)
		e.self:Say("I have learned it was a machine tinkered by a legendary gnome. It has many uses. It lies in the slave pens of Droga. Perhaps it may be used to decipher the [Scrolls of Vok Na Zov]. I have leearned that it will not work without a [contraption needle]. Luckily I have found one in my journies.");
	elseif(e.message:findi("contraption needle")) then --Test of the Lord (Greenmist Quest 7/8)
		e.self:Say("The contraption needle is a piece of the machine, the [Stupendous Contraption]. It won't operate without it and if you want it, you're going to have to bring me the [pen keys].");
	elseif(e.message:findi("pen keys")) then --Test of the Lord (Greenmist Quest 7/8)
		e.self:Say("Pen keys!! I need the pen keys to get out of here! Find the ones who hold these keys. Bring me the key to pen number 1 and both keys to the pen gates. Do so and I shall give you the [contraption needle].");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- need MultiQuest implementation.
	-- local text1 = "Oh no!! The bargain was, you bring me the keys to the main gates and the pen key to cell one.";		
	
	if(item_lib.check_turn_in(e.trade, {item1 = 12708, item2 = 12712, item3 = 12713})) then  --,1,text1)) then --Test of the Lord (Greenmist Quest 7/8)
		e.self:Emote("escapes with a flash, but before he goes, he speaks, 'At last!! The keys which shall bring me freedom! I thank you and here is the contraption needle. Good luck.'");
		e.other:QuestReward(e.self,{itemid = 12714, exp = 2000})
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by: Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
