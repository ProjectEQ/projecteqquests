-- items: 52346
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if( qglobals["Fatestealer_bard"] == "1" and e.message:findi("hail")) then
		e.self:Emote("Smith Dandi looks to Lirprin for approval and he nods. She turns to you again, smiling broadly, and clasps your fingers in a warm handshake.");
		e.self:Say("Smith Dandi is my name. I trained under Rondo before we lost him in that horrible incident, bless his poor soul. Lirprin says it's okay to talk, and I understand you have a job for me? Let's see if you have what we need...");
		
		if (qglobals["Fatestealer_nk"] == "1") then
			e.other:Message(MT.Yellow,"In the rocky lair of Kaladim, you have coerced the Dwarven rogues into sharing their secret of blade construction: Metallurgy.");
		else
			e.other:Message(MT.Red,"You have not coerced the Dwarven rogues into revealing their secret.");
		end
		if (qglobals["Fatestealer_sv"] == "1") then		
			e.other:Message(MT.Yellow,"In the majestic palace of Shar Vahl, you have coerced the Vah Shir rogues into sharing their secret of blade construction: Blade Form.");
		else
			e.other:Message(MT.Red,"You have not coerced the Vah Shir rogues into revealing their secret.");
		end
		if (qglobals["Fatestealer_hl"] == "1") then		
			e.other:Message(MT.Yellow,"In the frigid northern lands of Halas, you have coerced the Barbarian rogues into sharing their secret of blade construction: Grip.");
		else
			e.other:Message(MT.Red,"You have not coerced the Barbarian rogues into revealing their secret.");
		end
		if (qglobals["Fatestealer_pl"] == "1") then		
			e.other:Message(MT.Yellow,"In the dank caverns of Paludal, you have coerced the Human rogues into sharing their secret of blade construction: Endless Poison. ");
		else
			e.other:Message(MT.Red,"You have not coerced the Human rogues into revealing their secret.");
		end
		if (qglobals["Fatestealer_rv"] == "1") then		
			e.other:Message(MT.Yellow,"In the cozy hovel of Rivervale, you have coerced the Halfling rogues into sharing their secret of blade construction: Perfect Balance.");
		else
			e.other:Message(MT.Red,"You have not coerced the Halfling rogues into revealing their secret.");
		end
		if (qglobals["Fatestealer_forge"] == "1") then		
			e.other:Message(MT.Yellow,"You have fueled Smith Dandi's furnace with Solusek's Embers.");
			eq.delete_global("Fatestealer_culth");
		else
			e.other:Message(MT.Red,"Smith Dandi's forge is not hot enough to craft the blade.");
			eq.set_global("Fatestealer_culth","1",5,"F");
		end		
		if (qglobals["Fatestealer_page"] == "1") then		
			e.other:Message(MT.Yellow,"Wresting the information from the icy grip of Lanys T`Vyl, you have obtained the Teir`dal secret of blade construction: Dark Enchantments.");
		else
			e.other:Message(MT.Red,"You lack the Teir`dal secret of blade construction.");
		end
		
		if (qglobals["Fatestealer_nk"] == "1" and qglobals["Fatestealer_sv"] == "1" and qglobals["Fatestealer_hl"] == "1" and qglobals["Fatestealer_pl"] == "1" and qglobals["Fatestealer_rv"] == "1" 
			and qglobals["Fatestealer_forge"] == "1" and qglobals["Fatestealer_page"] == "1") then
			e.self:Say("Seems you're all ready to craft the blade. The instructions you've provided call for a soulstone. If you have one of those, show it to Lirprin and then I'll get started.");
		else
			e.self:Say("Hmm, you're still missing a few things. Keep at it, " .. e.other:GetName() .. "."); 
		end		
	end
	if( qglobals["Fatestealer"] == "3" and e.message:findi("hail")) then
		e.self:Emote("wipes her sooty hands on her apron and smiles at you. 'So, it looks as if you'll need the services of Smith Dandi once again. I was hoping you'd stop by soon so we could talk. Fantastic work clearing the names of those innocent Wayfarers. I knew them all personally and they weren't bad folk. It's a shame Lirprin can be so quick to judge. Now, something tells me you're looking to get that blade of yours improved. Let's see if you have what we need. . .");
		if (e.other:HasItem(47100)) then		
			e.other:Message(MT.Yellow,"From the deadly realm of Mata Muram himself, you have recovered a source of discordant energy.");
		else
			e.other:Message(MT.Red,"Smith Dandi is unable to duplicate the enchantments on Wren's weapon without a source of discordant energy.");
		end
		if (e.other:HasItem(52342)) then		
			e.other:Message(MT.Yellow,"From the freezing depths of Iceclad, you have recovered a lump of Velixite alloy.");
		else
			e.other:Message(MT.Red,"Smith Dandi is unable to craft the blade without a special alloy.");
		end		
 		if (e.other:HasItem(21346)) then		
			e.other:Message(MT.Yellow,"You have slain Wren Simsy and recovered her blade, which courses with discordant energy. ");
		else
			e.other:Message(MT.Red,"Smith Dandi requires a blade touched by discordant energy.");
		end
		if (e.other:HasItem(47100) and e.other:HasItem(52342) and e.other:HasItem(21346)) then	
			e.self:Say("Seems you're all ready to craft the blade. We'll need the Velixite alloy, the weapon I crafted for you last time, an example of someone else's weapon that I can use for a reference, and a source of pure discordant energy. Show those items to Lirprin and we'll get started!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);

	if(qglobals["Fatestealer_bard"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 52346}) ) then
		e.self:Emote("gawks in amazement.  By the Gods, where did you come by these embers? These are positively unnatural, and they bare the mark of Solusek himself!' She sprinkles a handful of the smoldering lumps into the forge and -KABOOM- a blast of incredible heat knocks you off your feet. Immediately, the metal of the forge swells and becomes white hot. 'Yep, this will do the trick,' she gloats cheerfully. The blazing heat doesnt seem to bother her.");
		eq.set_global("Fatestealer_forge","1",5,"F");
		e.other:Message(MT.Red,"You have fueled Smith Dandi's furnace with Solusek's Embers.");
	end

	item_lib.return_items(e.self, e.other, e.trade);
end
