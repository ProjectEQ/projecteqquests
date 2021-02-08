-- items: 1761, 3120, 3123, 3115, 3117, 3122, 3113, 3116, 3118, 3121, 3124, 3119, 3108, 3107, 3111, 3103, 3105, 3110, 3101, 3104, 3106, 3109, 3112, 3132, 3135, 3127, 3129, 3134, 3125, 3128, 3130, 3133, 3136, 3131
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". Are you a follower of our order, the Deepwater Knights, servants of the Ocean Lord, Prexus?");
	elseif(e.message:findi("yes")) then
		e.self:Say("That is good, " .. e.other:GetName() .. ". Our followers are few but our faith is strong. With the efforts of those few, our destiny may be reached in time. We must walk with perseverence and devotion, much like the tides that, over time, can destroy a mighty stone cliff. Have you [come to serve our Lord], " .. e.other:GetName() .. "?");
	elseif(e.message:findi("come to serve our lord")) then
		e.self:Say("Then I shall send you on a quest to prove your devotion. No doubt you have seen the vermin kobolds scuttling about the land as fleas upon a mangy dog. The kobolds have a lair on our continent from which they launch their wantonly destructive raids. You are to enter that lair and destroy as many of these dogs as you can. For each molar you bring me, you will receive praise, admiration, and perhaps some coin.");
	elseif(e.message:findi("quest of greater importance")) then
		e.self:Say("Very well then, " .. e.other:GetName() .. ", you may be able to help us. Go to Breya and tell her I sent you. She will brief you.")
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 1761})) then
		e.self:Say("Wonderful work, friend " .. e.other:GetName() .. ". One less land dwelling, flea ridden, primitive for our wondrous lord to sweep aside when the apocalypse is upon us. Here is your reward. Perhaps if you gather enough molars, we can offer you a [quest of greater importance].");
		if(math.random(4) == 1) then
			e.other:SummonItem(eq.ChooseRandom(3120,3123,3115,3117,3122,3113,3116,3118,3121,3124,3119,3108,3107,3111,3103,3105,3110,3101,3104,3106,3109,3112,3132,3135,3127,3129,3134,3125,3128,3130,3133,3136,3131)); -- Item(s): Small Ringmail Sleeves (3120), Small Ringmail Pants (3123), Small Ringmail Neckguard (3115), Small Ringmail Mantle (3117), Small Ringmail Gloves (3122), Small Ringmail Coif (3113), Small Ringmail Coat (3116), Small Ringmail Cape (3118), Small Ringmail Bracelet (3121), Small Ringmail Boots (3124), Small Ringmail Belt (3119), Ringmail Sleeves (3108), Ringmail Skirt (3107), Ringmail Pants (3111), Ringmail Neckguard (3103), Ringmail Mantle (3105), Ringmail Gloves (3110), Ringmail Coif (3101), Ringmail Coat (3104), Ringmail Cape (3106), Ringmail Bracelet (3109), Ringmail Boots (3112), Large Ringmail Sleeves (3132), Large Ringmail Pants (3135), Large Ringmail Neckguard (3127), Large Ringmail Mantle (3129), Large Ringmail Gloves (3134), Large Ringmail Coif (3125), Large Ringmail Coat (3128), Large Ringmail Cape (3130), Large Ringmail Bracelet (3133), Large Ringmail Boots (3136), Large Ringmail Belt (3131)
		end
		e.other:Faction(266,5,0); -- High Council of Erudin
		e.other:Faction(265,-5,0);-- Heretics
		e.other:Faction(242,5,0);  -- Deepwater Knights
		e.other:AddEXP(2000);
		e.other:GiveCash(12,14,5,0); -- Copper x 12, Silver x 14, Gold x 5
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98051 -- Tiam_Khonsir
