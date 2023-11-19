-- Pepe's Got a Brand New Bag

function event_say(e)
	local pepe_dialog = e.other:GetBucket("pepe_dialog");

	if pepe_dialog == "1" and e.message:findi("pepe") then
		e.self:Say("I fear I do not know where Pepe is at the moment. He tends to get lost quite a bit. Poor lad is a bit addled. When his mother was on her death bed, I promised her I would look after him though. I don't think he would wander away from the city. At least I hope not. If you find him, ask him to give you my scraping tool. Take this doll too. It is his most prized possession. I am surprised he left it behind.");
		e.other:SummonItem(55571); -- Item: Lamontt
		e.other:SummonItem(55570); -- Item: Venomous Stonemite Poison Sac
	end
end

function event_trade(e)
	local item_lib = require("items");

	if item_lib.check_turn_in(e.trade, {item1 = 55570, item2 = 55576}) then -- Items: Venomous Stonemite Poison Sac, Note to Rion
		e.self:Say("Yes, yes. Hmm, a note from Simmons. Hmm, yes. I do believe I can do it, but my assistant Pepe has wandered off somewhere with all my tools. If you can track [Pepe] down and get my tools back, I think I can help you. Oh and here is your venom sac. Hold on to it for now and if you find my tools, hand them to me along with the venom sac.");
		e.other:SummonItem(55570); -- Item: Venomous Stonemite Poison Sac
		e.other:QuestReward(e.self,3,0,0,3,0,eq.ExpHelper(51));
		e.other:SetBucket("pepe_dialog", "1")
	elseif item_lib.check_turn_in(e.trade, {item1 = 55570, item2 = 55573}) then -- Items: Venomous Stonemite Poison Sac, Scraping Tool
		e.self:Say("Very good. I will do my best. Rion begins to carefully remove the poison from the venom sac. 'Here you go. This should do.");
		e.other:SummonItem(55573); -- Item: Scraping Tool
		e.other:QuestReward(e.self,0,0,0,0,55574,eq.ExpHelper(51)); -- Item: Prepared Stonemite Sac
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
