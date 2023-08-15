-- items: 20072, 47100
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["berserk_epic"] == "9") then
		if (e.message:findi("hail")) then
			if (e.other:HasItem(20072)) then
				e.self:Say("Yes outlander? What would you have of me now?' You notice his eyes widen further upon glancing over your improved axe. 'So you managed to successfully lace the Shadowed Bronze into the haft as I spoke of. Very good. I also notice this extra moonstone that wasn't here before. As to its purpose I can not speak of.' Running his sinewy finger carefully across the edge he says, 'But the edge here could still use some sharpening. Blades such as this though can not be sharpened by a normal means. No, a blade this strong will require naught but a portion of Discordant matter itself. It has been said that this matter can sometimes be found captured within the tears of those that have been tortured. Return to me only when you have succeeded in finding one. Then we will see how else I can aid thee.");
			else
				e.other:Emote("pretends not to notice you. Just as you are opening your mouth to call out to him again he slowly and methodically lets the words drip out of his mouth as if to make sure you understand him. 'Yes outlander? What can Grithyank do for you? What is it you seek from him?");
			end
		elseif(e.message:findi("enhance my axe")) then
			e.self:Emote("turns fully towards you as if now willing to pay more attention to you. 'An interesting specimen of a weapon. It blends craftsmanship from your world, components from mine, and magic from both. I would love the opportunity to study it further but I know you did not bring it to me to study. I gather you wish to learn more about it though?");
		elseif(e.message:findi("learn")) then
			e.self:Say("The ore chosen for the head of the axe your people would call Chaotic Steel. It is an extremely durable base to form a weapon from so likely there is little I can do for this piece. I notice the handle, however, appears to be made of a fairly strong yet flexible wood. Yet I believe the smith did not know that this metal can cause undue stress upon the handle eventually shattering it at the least convenient time, in the heat of battle. From my studies of your world I suggest lacing it with a small portion of what our people call Shadowed Bronze. I believe you can find the proper Shadowed Bronze on an ancient shade in Grieg's End. This should help to absorb much of the stress passed along from the axe head.");
		end
	end	
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	if(qglobals["berserk_epic"] == "9" and item_lib.check_turn_in(e.trade, {item1 = 20072, item2 = 47100})) then
		e.self:Say("Ah, very good outlander, you managed to find some Discordant Matter. Very well, I will see what I can accomplish. Though the ore in this axe is originally from my world, the smithing technique and some of the magic are from yours. Therefore I can make no promises.' After some time and much effort the Dragorn hands the axe back. You immediately notice that edge has a brilliance to it that is nearly blinding. There outlander. I think you will be pleased with the results. The smithing technique used to forge that axe is quite unique. . .I doubt another of its kind exists. Be wary though for as I was applying the Discordant matter to the edge, I felt a disturbing presence emanating from the axe. There is someone or something that endures within it. . .something that seeks to control those who wield it. You must be ever cautious lest the axe is able to compel its influence onto you. I fear that though the axe will bring you many victories, those victories may come at a cost. Travel safe and fair, my friend!");
		e.other:QuestReward(e.self,{itemid=18609, exp=50000}); --(Epic 2.0)
		e.other:AddAAPoints(10);
		e.other:Message(MT.Yellow,'You have gained 10 ability points!');
		eq.set_global("berserk_epic","10",5,"F");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end