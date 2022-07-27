-- Annaelia Wylassi is a gnome necromancer for the Whistling Fists quest line. By interacting with her, we can get one of the sets of bones that we need to combine in Cazic Thule's pack.
-- items: 22514, 17355, 10252, 9963, 7984

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("If you have nothing other than a hail to offer me you best move along, I need concentration to study these odd bones that I unearthed. Funny thing about them though, they seem to resonate a hum. Quite unusual, you probably aren't [interested] in that though.");
	elseif(e.message:findi("interested")) then
		e.self:Say("Are you? I didn't take you for a necromancer. I tried to reanimate these remains but due to the vibration it was too unstable and collapsed. I have given up trying to animate them. I would need more supplies if I were to try again. I am too busy with other research to care though. If you are so interested you could go fetch the supplies for me. I suspect the bone structure is of a human, so I would need a vial of human blood. A jade inlaid coffin would be needed to perform the ritual in. Also a vial of clear mana to bind the bones with strong magic, and an essence emerald to complete the ritual.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 22514,item2 = 17355,item3 = 10252,item4 = 9963})) then
		e.self:Say("I will now try the reanimation.' Streams of mana surround the bones but nothing happens. Annaelia looks annoyed. 'Worthless bones! Why do they hum like this? Grah, I don't care I have too much to study. You want them? Take them!");
		e.other:SummonItem(7984); -- Item: Resonant Bone Chips
		e.other:Ding();
		e.other:AddEXP(60000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF Annaelia_Wylassi