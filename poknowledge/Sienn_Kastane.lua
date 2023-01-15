-- poknowledge\Sienn_Kastane.lua NPCID 202268 
-- SK Epic 1.5
-- items: 22944, 20520, 20426, 23492, 20497, 19025, 11407
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.other:Class() == "Shadow Knight") then
		if(e.message:findi("hail")) then
			if(e.other:HasItem(14383) or qglobals["shadowknight_pre"] == "2") then --Have Epic 1.0 Innoruuk's Curse or Pre_quest Complete
				if(qglobals["shadowknight_epic"] == nil) then
					eq.set_global("shadowknight_epic","1",5,"F"); --Flagged to start epic
				end
			end
			if(qglobals["shadowknight_epic"] == "1") then
				e.self:Say("You. You are the one I have seen in my visions.' Sienn removes a dark blade from a scabbard. I have just obtained this sword from one of my apprentices. This blade may be the key to the very existence of the shadowknight. Are you familiar with what has [" ..eq.say_link('been transpiring', false, 'been transpiring') .. "]?");
			end
		elseif(e.message:findi("transpiring") and qglobals["shadowknight_epic"] == "1") then
			e.self:Emote("places her hands upon your forehead. A gravelly voice that is clearly not Sienn's fills your mind.");
			e.other:Message(0,"Do you feel it? I am sure you do. Innoruuk's voice is so distant now. His voice is merely a whisper. This disturbs me greatly. How will the evil ones do their master's bidding without his dark guidance? I fear the end is almost near for true champions of darkness such as yourself. We cannot let that happen! I believe I know of a way to slow down the diminishing of our master's voice. There is a sword of great evil. It is however not of this world. I believe I can summon it to this plane of existence, but I will need several [" ..eq.say_link('items', false, 'items') .. "] first. . .' The voice ends. 'That was the voice of Ritald, a luggald in the service of the dark lord, Innoruuk.");
		elseif(e.message:findi("items") and qglobals["shadowknight_epic"] == "1") then
			e.self:Say("Your first task is to find me a tome. The sword has told me of a tome that details its history. I do not know where this tome might be, but I suggest you talk to Grand Librarian Maelin here in the Plane of Knowledge. He may have more information of this tome. When you find it, return it to me.");
		elseif(e.message:findi("mask the sword\'s presence") and qglobals["shadowknight_epic"] == "4") then
			e.self:Say("In the Plane of Nightmare, there dwells a banshee known as the Wailing Sister. In her possession is a rune of great power. The sword's hatred has awoken from a deep slumber. The rune however is only part of what will be needed to help mask the sword's hatred. The rune is inactive until combined with the Wailing Sister's blood. Recover the rune and a sample of her blood and return them to me.");
		end
	end	
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 22944})) then --hand in statless Innoruuk's Voice from prequest
		if(qglobals["shadowknight_epic"] == nil) then
			eq.set_global("shadowknight_epic","1",5,"F"); --Flagged to start epic
		end
	end
	if(qglobals["shadowknight_epic"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 20520})) then --hand in The Silent Gods (received from Grand Librarian Maelin)
		e.self:Say("You have done well in acquiring this tome.' Sienn opens the tome and begins to read. 'It says that a sheath must be created to protect the sword. Unfortunately the instructions for making this sheath are a bit unclear. The only clues given to the items needed are, to gather a dark hide of a creature unmatched in its bleakness, a holy lock of hair from a fair creature unmatched in happiness, and a gem possessing the very essence of fear itself, held by a creature more fearsome. If you find these three items, combine them in a sewing kit and then hand the sheath to me. I await your return.");
		eq.set_global("shadowknight_epic","2",5,"F");
	end
	if(qglobals["shadowknight_epic"] == "2" and item_lib.check_turn_in(e.trade, {item1 = 20426})) then --hand in Sheath of Darktidings (result of a combine, probably needs added to db)
		e.self:Say("I admit that I did not think you could accomplish this task. Perhaps you really are meant to be the sword's champion. Our work here is not done however. There are those that wish the sword to be destroyed. One of these beings is a froglok paladin named Fraga. He was last seen in the Plane of Valor. Kill him and bring me any clues as to what his plans may be.");
		eq.set_global("shadowknight_epic","3",5,"F");
	end
	if(qglobals["shadowknight_epic"] == "3" and item_lib.check_turn_in(e.trade, {item1 = 23492})) then --hand in Fraga's Parchment (drops from Fraga in PoValor)
		e.self:Emote("begins to read the parchment. A worried look plays across her face.");
		e.self:Say("The weapon is not safe. The forces of good strongly wish to have it destroyed. To make matters worse, the sword is emanating hate that can be felt by powerful beings, both good and evil, across all planes of existence. As it stands right now, I wouldn't be surprised if the forces of good are converging to have the sword destroyed and the forces of evil are conniving to take the sword for themselves. It is only a matter of time before they locate the sword and come for it themselves. I have been studying the tome while you were gone. The tome describes a way to [" ..eq.say_link('mask the sword\'s presence', false, 'mask the sword\'s presence') .. "].");
		eq.set_global("shadowknight_epic","4",5,"F");
	end
	if(qglobals["shadowknight_epic"] == "4" and item_lib.check_turn_in(e.trade, {item1 = 20497, item2 = 19025})) then --hand in Wailing Sister Blood and Wailing Rune (both drop from The Wailing Sister in the Plane of Nightmare)
		e.self:Emote("pours the blood on the rune. The rune begins to glow a bright red color and a horrifying wail fills your ears.");
		e.self:Say("The rune has been activated.");
		e.self:Emote("holds the rune against the sheath you created earlier. The rune instantaneously melts into the sheath.");
		e.self:Say("The sword is safe for now, but I think it should be moved just in case. Do not lose the sheathed sword. If you do lose it somehow, come back to me and tell me you lost it and I will attempt to make you another one. I only have enough left of the items you brought me to make you one more though. Now, take the sword to a servant of mine, named Gilina Yilzior, here in the Plane of Knowledge. She is very knowledgeable and should be able to help you further.");
		eq.set_global("shadowknight_epic","5",5,"F");
		e.other:SummonItem(11407); -- first version of Sheathed Innoruuk's Voice
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
