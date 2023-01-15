-- items: 77603

function event_say(e)
    if e.message:findi("hail") then
		e.self:Emote("eyes you curiously. 'Greetings " .. e.other:GetName() .. ". What brings you to this frigid place?")
	elseif e.message:findi("Lantaric") then
		local qglobals = eq.get_qglobals(e.other)
		if qglobals["bardPQ"] == "3" then
			e.self:Emote("flashes a sly grin at you. 'So you're the one that's impressed Lantaric`Dar. We'll soon see whether his faith is ill conceived. The emissaries have just arrived at the portal to the south. Several of the mortal races are represented in their ranks. I suspect the Kromzek are attempted to recruit aid for a rather large mystical undertaking. Although for exactly what I don't know. They were lingering at the portal last I saw, no doubt waiting for the escort that isn't coming.' Vas Thorel grins at you again.")
			e.self:Say("No doubt Tormax has by now learned that his mercenaries are dead and has dispatched another escort. Perhaps the new escort will have further information on what he's planning. Follow the emissaries towards Kael and keep your eyes open for a Kromzek Escort. We can't go leaving those necromancers alive if they're going to be helping the Kromzek. Bring me any information you find. Oh yes, I'm sure Lantaric will want their heads as proof of their involvement.")
		eq.spawn2(110123, 0, 0, 8859.7,-4502.8,225.25,390); --#Noble_Oldencamp
		eq.spawn2(110128, 0, 0, 8859,-4525.8,230.25,390); --#Amilia_Verisue
		eq.spawn2(110127, 0, 0, 8859,-4550,230.25,390); --#Nihilist Xeegarn
		eq.spawn2(110126, 0, 0, 8859,-4475,230.25,390); --#Puella_Opalis
		eq.spawn2(110125, 0, 0, 8859,-4450,230.25,390); --##Locis_V`Sek
		eq.spawn2(110129, 0, 0, 8879,-4465,230,390); --#a_frost_giant_escort
		eq.spawn2(110129, 0, 0, 8879,-4525,230,390); --#a_frost_giant_escort
		eq.spawn2(110129, 0, 0, 8879,-4585,230,390); --#a_frost_giant_escort
		eq.spawn2(110130, 0, 0, 8879,-4495,230,390); --#a_frost_giant_warrior
		eq.spawn2(110130, 0, 0, 8879,-4555,230,390); --#a_frost_giant_warrior
		eq.spawn2(110130, 0, 0, 8879,-4435,230,390); --#a_frost_giant_warrior
		end
	end	
end

function event_trade(e)
    local item_lib = require("items")
    local qglobals = eq.get_qglobals(e.other)

    if qglobals["bardPQ"] == "3" and item_lib.check_turn_in(e.trade, {item1 = 77603}) then --Sealed Kromzek Scroll 
		eq.set_global("bardPQ", "4", 5, "F")
        e.self:Say("Well done " .. e.other:Race() .. ", but I'm afraid this scroll bears ill tidings indeed. Lantaric must be informed with haste. Take the heads of the necromancers and give them to Lantaric. I have a feeling your work is far from done " .. e.other:Race() .. ".")				
	end
	
    item_lib.return_items(e.self, e.other, e.trade)
end
