function event_say(e)
	local rogue_epic = eq.get_qglobals(e.other);
	
	if(e.message:findi("hail")) then
		if(e.other:HasItem(11057) == true and rogue_epic.Fatestealer == nil) then
			e.self:Say(string.format("Ha, the prodigy returns. So good to see you, %s. I always consider it an honor to have your company, and we have much to talk about!",e.other:GetName()));
			eq.set_global("Fatestealer","0",5,"F");
		elseif(rogue_epic.Fatestealer ~= nil) then
			e.self:Say(string.format("But not here and not now. We are in grave danger, you and I, and should not be seen speaking to one another. Seek out my associates. They will apprise you of what needs to be done. When you have found them... Tell them that the sun is setting on the horizon.' He clasps your palm and gives you a strange handshake, 'Before you go, know that you have proved yourself as one of us, %s. You are a member of this circle and nothing will ever break that.",e.other:GetName()));
		else
			e.self:Say("Ah, the pouch. This is the first step. The Circle has to be upset having this taken right out from under them. That speaks well of the person who did the taking. Hanns must be even more furious now. I think I might be able to trust you. We could make a deal. I have a blade I won't use anymore, and you have those fine looking daggers Vilnius gave you. Of course, you would have to do something for me first. Let me tell you my story, then you decide.");
		end
	elseif(e.message:findi("story")) then
		e.self:Say("Johann Krieghor was the leader of the Circle and I was his second-in-command. He made a dark bargain with a Teir'Dal General. The Circle was to assassinate Joren, the high elf ambassador to Qeynos. Had the plot worked, it would have weakened the alliance between high elves and humans, and possibly caused a war between the two powers. In either case, the Teir'Dal would have profited greatly by this event, and all others would have suffered. I could not stand by and let this happen, but Johann would not be deterred, for the Teir'Dal had promised him much. I had no choice but to kill Johann and the Teir'Dal agent. I made it look like they offed each other, and then I hid the tools.");
	elseif(e.message:findi("tools")) then
		e.self:Say("To allow the assassin to slay a prince, and fight his way back out, a fell blade was crafted. It was small enough to conceal under a garment and yet large enough to strike a mortal blow through armor. Aided by vile Teir'Dal enchantments, it is much more fearsome than it appears. I would gladly rid myself of it, but I fear I can not until I clear my name with Hanns.");
	elseif(e.message:findi("clear your name")) then
		e.self:Say("I need proof that what I say about Johann is truth, so that Hanns may forgive me. YOU can gather that proof for me. First, travel to Kaladim and Neriak, and there, upon the persons of the rogue guildmasters, you should find that which I seek, two parts of a document I recovered from the dead agent. I entrusted one to Founy, but that trust is gone, and Founy would betray me to Hanns were I to attempt to reclaim it. Tani N'mar has the other, which he should not possess, and keeps it only to spite me, not knowing its real importance. Steal them both, and bring them back to me. And don't let anyone follow you! If I am not around, tell Anson you want to see me.");
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 28010,item2 = 28011})) then
		e.self:Say("Excellent! With this document I can. Damnation! Curse my tired old mind, I forgot that I could not read the document. It is written in some obscure code or language. I can't decipher it, but I know someone who can. Seek out one called Eldreth, an Erudite who used to do work for me. I know not where he may be found these days, only that he will not be found in Erudin, as they want his head for some misdeed in the past. Give him the complete parchment, and tell him I sent you. He owes me.");
		e.other:SummonItem(28012);
		e.other:Ding();
		e.other:Faction(149,5,0);
		e.other:Faction(31,10,0);
		e.other:Faction(214,5,0);
		e.other:Faction(53,5,0);
		e.other:Faction(105,5,0);
		e.other:AddEXP(500);
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 28013,item2 = 7506,item3 = 7505})) then
		e.self:Say(string.format("Very well done. I leave now to confront Hanns with this evidence. Even so, it will not be easy to regain his trust. That is why I need those daggers, in case all else fails. Bristlebane grant me luck - I can no longer live like a hunted dog. In any case, I am grateful for your aid. Take this wretched blade, I can bear it no longer. I must warn you, I feel it carries Innoruuk's curse; all who are near it learn the meaning of hate. Ironic, isn't it? You went to all that work to redeem yourself for a rapier, yet the true reward came when you redeemed another..Good luck, %s, for much as I, you will need it.",e.other:GetName()));
		e.other:SummonItem(11057);
		e.other:Ding();
		e.other:Faction(149,5,0);
		e.other:Faction(31,10,0);
		e.other:Faction(214,5,0);
		e.other:Faction(53,5,0);
		e.other:Faction(105,5,0);
		e.other:AddEXP(10000);
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18961})) then
		e.self:Say("Let me see what you have here. Aha, so that's who.. yes, yes! There is one more thing I need you to do. This document tells me who the originator of the plot really was. His name is General V'ghera, which is interesting, as Anson's men have spotted him in Kithicor recently. He will not be easy to get to, but if you give this box to one of his many aides, the General will HAVE to come to investigate. You see, this box used to contain the tools crafted for the assassination. When he arrives, kill him! I need any documents you find on him - with luck it will be enough evidence to convince Hanns that what I say is true. Bring any documents or dispatch cases you find, along with those blades Vilnius made you work so hard for, and we will make a trade.");
		e.other:SummonItem(28057);
		e.other:Ding();
		e.other:Faction(149,5,0);
		e.other:Faction(31,10,0);
		e.other:Faction(214,5,0);
		e.other:Faction(53,5,0);
		e.other:Faction(105,5,0);
		e.other:AddEXP(500);
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
