-- items: 9822
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if ((qglobals["Fatestealer_shak"] ~= nil and qglobals["Fatestealer_shak"] == "1") or e.other:HasItem(52355) or e.other:HasItem(52356)) and e.message:findi("blue orb") then
		e.other:SummonItem(9822); -- Item: Shard of Blue Metal
	end
	
	if e.message:findi("hail") then
		e.self:Say("What does one have to do to win at this game? Each move I make they counter a better move. I sure could use some help.");
	elseif e.message:findi("help") then
		e.self:Say("Oh you are willing to help me? Very well I really need to end this game and put my opponent in check mate. You can either gather up four white pawns to bring me closer to what I need. Or if your willing to risk it all and go for check mate bring me one each of a white bishop, white knight, white castle, and a white queen. If you do so I'll have checkmate for sure. However the pieces can get a little lively in the defense of their king so be warned if you do so.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if item_lib.check_turn_in(e.trade, {item1 = 62331, item2 = 62333, item3 = 62332, item4 = 62334}) then -- Item: A White Bishop, Knight, Castle, Queen
		e.other:QuestReward(e.self,{exp = 1000}); -- Exp Only
		e.self:Say("Oh wow you have done better than I ever expected. I almost have her in checkmate if you could take care of these pieces I'll have him for sure!");
		-- Start Event - WIP
	elseif item_lib.check_turn_in(e.trade, {item1 = 62330, item2 = 62330, item3 = 62330, item4 = 62330}) then -- Item: A White Pawn x4
		e.other:QuestReward(e.self,{exp = 1000}); -- Exp Only
		e.self:Say("Excellent with these four gone I can make my move now! Here take this as your reward.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
