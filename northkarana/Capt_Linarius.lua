function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, traveler! You are free to rest within this keep or within any of my towers along the roads to Qeynos. My guards shall keep watch over you. While you tread upon the roads, be warned that there are [local dangers] as well as rumors of [corrupt guards].");
	elseif(e.message:findi("corrupt guards")) then
		e.self:Say("I have heard rumors of dissension among my guards. I will reward any fine resident for the death of these traitorous guards. If you find you must kill one, bring his guard bracelet back to me. I cannot allow such men among my guards. Be sure they are corrupt, or I shall have your head as well.");
	elseif(e.message:findi("local dangers")) then
		e.self:Say("My guards report daily to me of dangers in the plains. Lately, they've been telling me of rumors of [Lord Grimrot].");
	elseif(e.message:findi("lord grimrot")) then
		e.self:Say("My guards have heard rumors of this Lord Grimrot. It is said that he is a powerful shadowknight who is raising an army of undead. Such things should be reported to the Temle of Life. Journey to Qeynos and speak with Camlend Serbold. Tell him of Lord Grimrot.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13303})) then -- Corrupt Guards Bracelet (Guard Bracelet - 13303)
		e.self:Say("What a pity. Such a promising soldier. I thank you for ridding us of this corruption and offer you this as a reward. It is nothing more than junk which littered the roadways of the Plains of Karana. I hope you can find a use for it.");
		e.other:SummonItem(eq.ChooseRandom(5369,9002)); -- Bunker Battle Blade , Round Shield
		e.other:Ding();
		e.other:Faction(135,10,0); -- Guards of Qeynos
		e.other:Faction(9,10,0); -- Antonius Bayle
		e.other:Faction(53,-10,0); -- Corrupt Qeynos Guards
		e.other:Faction(33,-10,0); -- Circle Of Unseen Hands
		e.other:Faction(217,10,0); -- Merchants of Qeynos 
		e.other:AddEXP(2000);
		e.other:GiveCash(19,0,8,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13304})) then -- Loyal Guards Bracelet (Guard Bracelet - 13304)
		e.self:Say("You fool!!! You have slain a loyal defender of the guard!  Prepare to DIE!!!"); -- text made up
		eq.attack(e.other:GetName());
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
