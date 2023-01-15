--Shaman Skull Quest 4
--Shaman Skull Quest 5
-- items: 12736, 5143, 12671, 12739, 12441
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("shows the signs of a great mystic. You can feel the power resonating from his aura. 'Greetings and may the cursed blessings of Cazic-Thule be yours. What may I do for you this fine evening? Perhaps I can [cure disease] or [heal] you, perhaps even [purge toxins] from your system?");
	elseif(e.message:findi("cure disease")) then
		e.self:Say("Your malady shall dissipate once you deliver to me one giant blood sac.");
	elseif(e.message:findi("heal")) then
		e.self:Say("I can call upon the power of the ancients to mend your wounds if you can deliver to me two brittle Iksar skulls.");
	elseif(e.message:findi("purge toxins")) then
		e.self:Say("The toxins shall surely be purged from your system when I have proof of your allegiance to the empire. Let that proof be one goblin watcher signal torch.");
	elseif(e.message:findi("rok nilok") and e.other:GetFaction(e.self) < 6) then
		e.self:Say("Mystic Dovan lowers his head in sorrow let us have a moment of peace. I cannot find the words to speak of the unspeakable act of the gods which took the lives of the legendary Crusaders of Rok Nolok. You must find the answers for yourself. All I can do is wait for their return. ");
	elseif(e.message:findi("galdon vok nir?") and e.other:GetFaction(e.self) < 8) then
		e.self:Say("He is a merchant hiding in The Overthere. He is greedy and will not give the skull up easily. Seek him out and ask him what he would [trade] for the skull.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Full C.O.R.N. Chest turn in and Cudgel of the Mystic
	if(item_lib.check_turn_in(e.trade, {item1 = 12736, item2 = 5143})) then
		e.self:Say("I see that you have found your answers. Now I must ask you to to retrieve for the council the skulls of the Di Nozok.  The sarnak in Lake of Ill Omen hold one of the skulls, while [Galdon Vok Nir] holds the other. Once you have retrieved them, give them to Hierphant Zand.");
		e.other:Faction(445, 10); --Scaled Mystics
		e.other:Faction(441, 10); --Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,5144,100000); --Give the player the Iron Cudgel of the Prophet
	--Cure disease.
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12671})) then--giant blood sac
		e.self:Emote("grabs from his beltpouch a fine dust and cakes the slimy blood sac with it. He then punctures the sac and smears the blood upon your chest. Your chest tingles. Your fill your lungs and exhale a bitter mist.");
		-- Confirmed Live Faction
		e.self:CastSpell(213,e.other:GetID()); -- Spell: Cure Disease
		e.other:Faction(445, 1); --Scaled Mystics
		e.other:Faction(441, 1); --Legion of Cabilis
	--Heal (Light Healing)
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12739, item2 = 12739})) then--2x Brittle Iksar Skull
		e.self:Emote("takes the skulls and holds them before your wounds. They shatter into a fine glowing powder and you feel your wounds being cauterized with no visible flame upon them.");
		-- Confirmed Live Faction
		e.self:CastSpell(17,e.other:GetID()); -- Spell: Light Healing
		e.other:Faction(445, 1); --Scaled Mystics
		e.other:Faction(441, 1); --Legion of Cabilis
	--Cure Poison
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12441})) then--Watcher Signal Torch
		e.self:Emote("chants in an unknown tongue as he takes a dagger and slits your forearm. He then takes a tiny glowing vein worm from his beltpouch and forces it into the open wound. You feel the worm explode within. The pain is unbearable, but then, a coolness courses through your body.");
		-- Confirmed Live Faction
		e.self:CastSpell(203,e.other:GetID()); -- Spell: Cure Poison
		e.other:Faction(445, 1); --Scaled Mystics
		e.other:Faction(441, 1); --Legion of Cabilis
	end
	item_lib.return_items(e.self, e.other, e.trade) --return items if not the ones required
end
