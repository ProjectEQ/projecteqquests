-- Help Kayin Escape
-- zam comments "He's actually on Yunjo Slave Resistance faction. (am max Ally with Nihil and he cons kindly)The minimum warmly statement seems to be correct, as he didn't take the Head at kindly."

function event_trade(e)
	local item_lib = require("items");
	if (e.other:GetFaction(e.self) <= 3) then --only turn in if warmly or higher
		if (item_lib.check_turn_in(e.trade, {item1 = 64014})) then --Head of Ra'Tuk Hrux Vexkit V1
			e.self:Say("Hah! What an ugly mug on this one! Thank you, friend. I can slip out of here now and know that my friend is still relatively safe. Here, you keep the head. Maybe you can show it to my friend Njanu Dinari back in Barindu and tell him the story. I'm sure he's worried about me and it might ease his mind a bit.");
			e.other:QuestReward(e.self,0,0,0,0,64015,300000); --Item: Head of Ra'Tuk Hrux Vexkit V2
			e.other:Faction(1770, 10); -- Faction: Yunjo Slave Resistance
			e.other:Faction(1771, -5); -- Gladiators of Mata Muram
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_say(e)
	if (e.other:GetFaction(e.self) <= 3) then --only talk to him if warmly or higher
		if(e.message:findi("hail")) then
			e.self:Say("Why can't I keep a lid on this temper of mine? It's always getting me into [trouble]!");
		elseif(e.message:findi("trouble")) then
			e.self:Say("Yeah, big trouble. There I was, minding my own business, working on my section of the Hanging Gardens when this big lug comes over and tells me to work faster. I was already working my hands raw, so I ignored him. Next thing I know, he's whipping me! I'd had enough. I turned around and let him have it with a big [punch] right in the face.");
		elseif(e.message:findi("punch")) then
			e.self:Say("By all rights, that punch should have knocked him flat and I should have been sprinting for freedom.' Kayin sighs. 'Unfortunately, my best effort was met with derisive laughter and I was thrown over the beast's shoulder. Not the most comfortable of [situations], let me tell you.");
		elseif(e.message:findi("situation")) then
			e.self:Say("I was passed from guard to guard for a while before being dumped into this cage that I've been standing in ever since. I know I'm destined to be fed to some ravenous beast for their entertainment. When the time comes, I'll fight as best I can, but I haven't seen any slaves come back from the games alive so I don't think my chances are very good. I'd [escape] from here if I could.");
		elseif(e.message:findi("escape")) then
			e.self:Say("I don't really want to be eaten by animals, but the guard who put me here, Ra`Tuk Hrux Vekxit, has threatened to kill a good friend of mine if I try to escape. I'd rather die than have my friend be killed because of me. Hrm, maybe you can [help me].");
		elseif(e.message:findi("help")) then
			e.self:Say("You look like you've got some strength in you. If you can kill Ra`Tuk Hrux Vexkit and bring me proof of his death, it will be safe for me to escape. I hear he can be found in the yards outside the coliseum most of the time. You'll have to hurry, though. I think they're running low on slaves for the games.");
		end
	end
end
