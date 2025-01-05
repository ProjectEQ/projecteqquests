-- Deck of Spontaneous Generation

function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Ha ha! Hello to you too! I have got this crazy deck that I'm willing to give to those [looking for a deck]. Ha ha! Oo!");
	elseif e.message:findi("deck") then
		e.self:Say("You're looking for a DECK? Ha ha ha! Well, bring me a fishing grub, tee hee, and I'll give you a nifty deck");
	end
end

function event_trade(e)
    local item_lib = require("items");

    if item_lib.check_turn_in(e.trade, {item1 = 13106}) then -- Item: Fishing Grubs
		e.other:QuestReward(e.self,0,0,0,0,17054,100);  -- Item: Deck of Spontaneous Generation
		e.self:Emote("takes a bite out of the fishing grub that was handed to him. Clukker then says, 'Ha ha HA! Thanks for the tasty treat! Now here is your deck! Hee hee haw!'");
    end
	item_lib.return_items(e.self, e.other, e.trade)
end
