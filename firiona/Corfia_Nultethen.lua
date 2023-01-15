--firiona/Corfia_Nultethen.lua NPCID 84318
--Warrior Epic 1.5
-- items: 16503, 60309, 60307, 60310, 60311
function event_say(e)
	if(e.language == 12) then
		local qglobals = eq.get_qglobals(e.other);
		if(e.message:findi("hail") and e.other:GetLanguageSkill(12) >= 100) then	
			e.self:Say("Yes, what can I do for you?");
		elseif(e.message:findi("Korbuk sent me") and qglobals["warrior_epic"] >= "6") then
			e.self:Say("That's really quite fascinating, but doesn't mean a whole lot to me. I really don't care who sent you. You don't have any [items of value] to me, so be gone.");
		elseif(e.message:findi("items of value") and qglobals["warrior_epic"] >= "6") then
			e.self:Say("Well... if you must know, I'm in need of a platinum bar so I can continue my work.");
		elseif(e.message:findi("Nocturnal Mask of Acuity") and qglobals["warrior_epic"] >= "7") then	
			e.self:Say("The mask is an interesting blend that will allow me to see much better in the darkness, where we elves can sometimes have trouble. To make it, you'll need an enchanted electrum bar and two darkened star rose quartz. Show it to me when you've made it.");
		elseif(e.message:findi("favor") and qglobals["warrior_epic"] >= "9") then
			e.self:Say("Yes indeed. I've been spending such a long time in the city lately that I just haven't had time to go on the expeditions I used to. Such a strong and capable person as you would be able to fill in nicely. You see, I've always wanted to explore the depths of [Veksar] to find out what treasures are hidden down there.");
		elseif(e.message:findi("veksar") and qglobals["warrior_epic"] >= "9") then	
			e.self:Say("I've heard plenty of stories and read a number of tales about artifacts of great wealth down there. In fact, I was able to get a sneak peek into the ruins some time ago, but not enough to find what I needed. One of the most interesting things I've read about is a tome of bones made for a necromancer named [Galuk Drek].");
		elseif(e.message:findi("Galuk Drek") and qglobals["warrior_epic"] >= "9") then	
			e.self:Say("Oh, he was a beast, to be sure. One of the nastier creatures down there, but also one of the most brilliant, from what I've read. Drek kept the tome full of information on various crafts, and one of them just happens to be jewelcraft. I'd love to set my hands on that tome, and if you can find it, I'd be more than willing to finish up this hilt for you in no time!");
			eq.set_global("warrior_epic_veksar","1",5,"F"); --flagged to spawn Galuk Drek in Veksar
		end	
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["warrior_epic"] ~= nil and qglobals["warrior_epic"] >= "6" and item_lib.check_turn_in(e.trade, {item1 = 16503})) then --Platinum Bar (vendor sold)
		e.self:Say("Aha, something worth my time. But I've changed my mind. I'd prefer if you made me something that really showed me how interested you are in my craft. We jewelers are hard to please, but if you can present me with a [Nocturnal Mask of Acuity], I'd be more than willing to at least speak with you.");
		if(qglobals["warrior_epic"] < "7") then
			eq.set_global("warrior_epic","7",5,"F");
		end
	end
	if(qglobals["warrior_epic"] ~= nil and qglobals["warrior_epic"] >= "7" and item_lib.check_turn_in(e.trade, {item1 = 60309})) then --Nocturnal Mask of Acuity (crafted)
		e.self:Say("Well done, but not great. It doesn't have the sight properties I'd hoped for, but it looks nice nonetheless. I half thought you'd shy away from creating such a lustrous piece of jeweled metal. You didn't though, so now you have my attention. What is it that you have for me to look at?");
		if(qglobals["warrior_epic"] < "8") then
			eq.set_global("warrior_epic","8",5,"F");
		end
	end
	if(qglobals["warrior_epic"] ~= nil and qglobals["warrior_epic"] >= "8" and item_lib.check_turn_in(e.trade, {item1 = 60307})) then --Decrepit Hilt
		e.self:Say("What a filthy piece of rubbish! This will need a good deal of work, I can guarantee you that. I have a small repository of supplies that I only rarely use, and one of the things I have is a cleaning solution. I don't often use it for most mundane things, but I'd be willing to part with some if you're willing to do me a [favor].");
		if(qglobals["warrior_epic"] < "9") then
			eq.set_global("warrior_epic","9",5,"F");
		end
	end
	if(qglobals["warrior_epic"] ~= nil and qglobals["warrior_epic"] == "9" and item_lib.check_turn_in(e.trade, {item1 = 60310})) then --Skeletal Tome of Galuk Drek (drops from Decaying Lord Galuk Drek in veksar)
		e.self:Say("Wow... I hadn't expected you'd be so quick about things. This is the most amazing find ever, you've helped me more then you could ever know! Thanks so much! I made sure to polish that hilt up for you as best as I could, and even added a few touches to it that'll make even stronger that it was before.");
		e.other:SummonItem(60311); --Glistening Hilt
		eq.delete_global("warrior_epic_veksar");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
	
	
