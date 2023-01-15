-- items: 18814, 17971, 12246, 13814, 13922, 13923
function event_say(e)
	local fac = e.other:GetFaction(e.self);

	if(e.message:findi("hail")) then
		e.self:Say("I am Toala Nehron. You must be another young warrior aspiring to join the ranks of the Steel Warriors. We welcome all who would try. When you [have time] there is a friend of mine I would like you to check on.");
	elseif(e.message:findi("opal")) then
		e.self:Say("Opal Darkbriar is a little plague rat.  She has used her knowledge of arcane arts to charm [Cain Darkmoore].  I know that is what happened.  Why else would he be in love with her?  He is a mighty warrior and she is nothing more than a sickly little librarian for the Academy of Arcane Science.  He must truly yearn for a bold hearted female warrior such as myself.  Not that I care, of course.");
	elseif(e.message:findi("cain darkmoore")) then
		e.self:Say("Cain Darkmoore is only the most handsome of warriors!  He is also the strongest and most bold.  He has slain the mightiest of fiends.  He is truly the manliest man around.  It is no wonder he is the guildmaster of the Steel Warriors.");
	elseif(fac < 5) then
		if(e.message:findi("have time")) then
			e.self:Say("I have A friend by the name of [Lenka Stoutheart]. She reported to me that her ship was broken into and someone stole a pouch of hers. Could you go look into it for me? Just tell her Toala sent you. Oh, and pay no mind to the walking mountain by her. That will only be Bronto, her navigator. Thanks friend.");
		elseif(e.message:findi("lenka stoutheart")) then
			e.self:Say("Lenka Stoutheart is an old friend of mine. I met her in my younger days when the Steel Warriors sent me to train in the ways of the Wolves of the North, the barbarian warriors of Halas. She is now an adventurer of great renown. She travels from continent to continent aboard her ship,the Blue Beast, her ship.");
		end
	elseif(fac == 5) then
		if(e.message:findi("have time") or e.message:findi("lenka stoutheart")) then
			e.self:Say("The Steel Warriors have no cause to dislike you, but you have yet to prove your worth to this guild.");
		end	
	elseif(fac > 5) then
		if(e.message:findi("have time") or e.message:findi("lenka stoutheart")) then
			e.self:Say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
		end	
	end
end

function event_trade(e)
	local item_lib = require("items");
	local fac = e.other:GetFaction(e.self);

	if(fac < 5) then
		if(item_lib.check_turn_in(e.trade, {item1 = 18814})) then -- A Sealed Letter ID-18814 filename "NERtoShintl"
			e.self:Say("Why, that little trollop! What is she up to? Cain will never believe this! She must be in league with some faction of the dark elves, but why? Neither the Academy of Arcane Science nor Cain will believe this note. I will see what I can do. As for you, I command you to kill this Shintl and her dark elf courier Hollish!! Put their heads into this box and combine them. We shall cut the link. Bring me thier heads.");
			e.other:SummonItem(17971); -- Toala's Box for heads
			e.other:Ding();
			e.other:AddEXP(500);
		elseif(item_lib.check_turn_in(e.trade, {item1 = 12246})) then -- Box with Two Heads
			e.self:Say("Good work!! We will soon catch Opal. I have started to formulate a plan to stop her. When I complete it, I shall notify you. Here. Take this small reward. I am sure killing Shintl was no trouble. She was just a halfling.");
			e.other:Ding();
			e.other:Faction(311,10,0); -- Steel Warriors
			e.other:Faction(262,2,0); -- Guards of Qeynos
			e.other:Faction(281,2,0); -- Knights of Truth
			e.other:Faction(230,-1,0); -- Corrupt Qeynos Guards
			e.other:Faction(330,-1,0); -- Freeport Militia
			e.other:AddEXP(2000);
			e.other:GiveCash(0,10,2,0);
		elseif(item_lib.check_turn_in(e.trade, {item1 = 13814})) then -- L.S. Pouch
			e.self:Say("You found my pouch! Thanks kid. Let me buy you A drink and this is for the good work. Hmmmm. It looks as though they took my voucher. Darn it! Hey... It looks like they were using my bag to hold items they were stealing. Here you go. You can have it. It looks like junk.");
			e.other:SummonItem(eq.ChooseRandom(13922, 13923)); -- Snapped Pole or Moggok's Right Eye
			e.other:Ding();
			e.other:Faction(320,2,0); -- Wolves of the North
			e.other:Faction(327,2,0); -- Shamen of Justice
			e.other:Faction(328,2,0); -- Merchants of Halas
			e.other:Faction(311,2,0); -- Steel Warriors
			e.other:Faction(305,-2,0); -- Rogues of the White Rose
			e.other:AddEXP(1000);
			e.other:GiveCash(0,2,0,0);
		end
	elseif(fac == 5) then
		if(item_lib.check_turn_in(e.trade, {item1 = 18814})) then -- Sealed Letter ID-18814 filename "NERtoShintl"  Item will be lost if not amiable or better
			e.self:Say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
		end
	elseif(fac > 5) then
		if(item_lib.check_turn_in(e.trade, {item1 = 18814})) then -- Sealed Letter ID-18814 filename "NERtoShintl"  Item will be lost if not amiable or better
			e.self:Say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportw -- Toala_Nehron
