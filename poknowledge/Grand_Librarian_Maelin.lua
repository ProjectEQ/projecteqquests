--poknowledge/Grand_Librarian_Maelin.lua NPCID 202125
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(eq.is_task_active(220)) then
		if(e.message.findi("trick of treat")) then
			e.self:Say("Ah, here you go. Fresh from the Sugar Assembalage 2000.");
			e.other:SummonItem(eq.ChooseRandom(84091,84092,84093,84087,84087,84087,84087,84087,84087));
			eq.update_task_activity(220,1,1);
		end
	end
	if(e.other:HasItem(29165)) then --Quintessence of Elements
		if(e.message:findi("hail")) then
			e.self:Say("The Quintessence! Oh my this is amazing! I have come into contact with Chronographer Muon in the realm of innovation. Go to him, show him you have the power to activate machine. I shall meet you there, this I must see!");
		end
	elseif(qglobals["pop_hohb_marr"] == "1" and qglobals["pop_bot_agnarr"] == "1" and qglobals["pop_pon_hedge_jezith"] == "1" and qglobals["pop_pon_construct"] == "1" and qglobals["pop_ponb_terris"] == "1"	and qglobals["pop_ponb_poxbourne"] == "1" and qglobals["pop_pod_alder_fuirstel"] == "1" and qglobals["pop_pod_grimmus_planar_projection"] == "1" and qglobals["pop_pod_elder_fuirstel"] == "1" and qglobals["pop_poj_mavuin"] == "1" and qglobals["pop_poj_tribunal"] == "1" and qglobals["pop_poj_valor_storms"] == "1" and qglobals["pop_pov_aerin_dar"] == "1" and qglobals["pop_pos_askr_the_lost"] == "1" and qglobals["pop_pos_askr_the_lost_final"] == "1" and qglobals["pop_cod_preflag"] == "1" and qglobals["pop_cod_bertox"] == "1" and qglobals["pop_cod_final"] == "1" and qglobals["pop_pot_shadyglade"] == "1" and qglobals["pop_pot_saryrn"] == "1" and qglobals["pop_pot_saryrn_final"] == "1" and qglobals["pop_hoh_faye"] == "1" and qglobals["pop_hoh_trell"] == "1" and qglobals["pop_hoh_garn"] == "1" and qglobals["pop_tactics_ralloz"] == "1") then --Elemental Pre-Flagging
		if(e.message:findi("hail")) then
			e.self:Say("'Welcome back my friends. I assure you that I have been studying the Cipher of Druzzil very diligently. Did you happen to find any [" .. eq.say_link("lore",false,"lore") .. "] or [" .. eq.say_link("information",false,"information") .. "] that I could look at?'");
		elseif(e.message:findi("lore")) then
			e.self:Say("'A parchment of Rallos'? Let me read it, it says that Rallos was not alone in his feelings about mortals. Solusek Ro also holds stake in the war to be led on Norrath. Not only this but he is channeling power from his father's plane into his own. He is taking that power and intensifying it through an artifact of great power, and then focusing it onto one point. It is a detailed as a crystal that burns with all the powers of the plane of fire. It is said to have the ability to turn the face of Norrath into a charred wasteland. They plan for a manaetic behemoth to carry and deposit it upon Norrath. You must stop these plans, you must stop Solusek!'");
		elseif(e.message:findi("information")) then
			e.self.Say("'There is no way to escape from the prison that is The Plane of Time. I am sorry but your quest for information ends here. Time is something that none of us can escape. That is however.. back when my explorations of the Planes were more common, I would travel searching for knowledge and lore to bring back to Tanaan. I stumbled into the Plane of Innovation. It was a great marvel to see indeed. I found the creator of all things mechanical. Meldrath the Marvelous was a kind and just gnome. We spent many weeks together discussing all of his devices. This included a machine that would allow you to open a tear into a period of time and enter into that time. The machine was more of a flight of whimsy though as the power necessary to power such a machine was enormous. He jokingly equated needing the very essence of the elements to power it.'");
			e.self:Emote("Maelin takes a deep breath and continues");
			e.self:Say("I can see now that he was not joking at all. Let us suppose that you travelers could venture into the Elemental Planes and retrieve this essence; and form it into one powerful conglomeration. You could open a tear into the period of time before Zebuxoruk was imprisoned. There is no way you can free him from his stasis now, but if you were to halt the Pantheon at the time of imprisonment. Hah! It could work I do believe. Forgive me, but my old gnomish heart is alive with the excitement of possibilities. Gather up your strength friends, travel into the deep elements. You will need all of your wits about you. Find the very essence of the elementals, and fuse them into one. How to combine them I do not know, and can only wish you luck on finding that information. If you can accomplish this please come get me. I would like to record the events as they take place!'");
			eq.set_global("pop_elemental_grand_librarian","1",5,"F");
			e.message:Other(4,"You receive a character flag!");
		end
	end
	if(e.other:Class() == "Shadowknight" and qglobals["shadowknight_epic"] == "1") then
		if(e.message:findi("tome")) then
			e.self:Say("Yes, I seem to recall having such a tome. But evil it is. I don't hand out such dangerous knowledge to just anyone. However. . . I am curious about something and perhaps you can help me. A prominent professor of biology and I have a bet as to how a certain creature from the Realm of Discord, known as a murkglider breeds. He believes they give live birth, and I believe they are egg layers. Unfortunately, I have been so busy here, that I have not been able to make arrangements to travel there and observe the creatures more. If you could travel to the Realm of Discord and [find an egg] for me, I will give you the book you seek.");
		elseif(e.message:findi("find an egg")) then
			e.self:Say("I appreciate your help with this! The creature I was supposed to study are most commonly known as murkgliders. The easiest way to describe them is that they look like large, floating octopuses. See if you can hunt down any breeding murkgliders and return an egg to me that I can study. You might want to bring some companions along, as this might be a dangerous task.");
		end
	end	
	if(qglobals["ench_epic"] >= "2" and e.message:findi("Jeb Lumsed sent me")) then
		e.self:Say("This is from Jeb, you say? I will set my best researchers on it at once. We have recently made some discoveries that he should be aware of. Here, take this note down to Lobaen, she will retrieve them for you.");
		e.other:SummonItem(52950); --Note to Lobaen
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 55900}) and qglobals["shadowknight_epic"] == "1") then --hand in Gelatinous Murkglider Egg (Drops from Murkglider Breeder in Ruined City of Dranik)
		e.self:Say("I knew they were egg-layers! Ha, this is one gnome who hates losing a bet and thanks to you I wont! This is the tome you seek. Please bring it back to me when you are done.");
		e.other:SummonItem(20520); --The Silent Gods
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
	