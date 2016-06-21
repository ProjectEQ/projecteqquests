function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if( qglobals["Fatestealer_bard"] == "1" and e.message:findi("hail")) then
		e.self:Emote("Smith Dandi looks to Lirprin for approval and he nods. She turns to you again, smiling broadly, and clasps your fingers in a warm handshake.");
		e.self:Say("Smith Dandi is my name. I trained under Rondo before we lost him in that horrible incident, bless his poor soul. Lirprin says it's okay to talk, and I understand you have a job for me? Let's see if you have what we need...");
		
		if (qglobals["Fatestealer_nk"] == "1") then
			e.other:Message(15,"In the rocky lair of Kaladim, you have coerced the Dwarven rogues into sharing their secret of blade construction: Metallurgy.");
		else
			e.other:Message(13,"You have not coerced the Dwarven rogues into revealing their secret.");
		end
		if (qglobals["Fatestealer_sv"] == "1") then		
			e.other:Message(15,"In the majestic palace of Shar Vahl, you have coerced the Vah Shir rogues into sharing their secret of blade construction: Blade Form.");
		else
			e.other:Message(13,"You have not coerced the Vah Shir rogues into revealing their secret.");
		end
		if (qglobals["Fatestealer_hl"] == "1") then		
			e.other:Message(15,"In the frigid northern lands of Halas, you have coerced the Barbarian rogues into sharing their secret of blade construction: Grip.");
		else
			e.other:Message(13,"You have not coerced the Barbarian rogues into revealing their secret.");
		end
		if (qglobals["Fatestealer_pl"] == "1") then		
			e.other:Message(15,"In the dank caverns of Paludal, you have coerced the Human rogues into sharing their secret of blade construction: Endless Poison. ");
		else
			e.other:Message(13,"You have not coerced the Human rogues into revealing their secret.");
		end
		if (qglobals["Fatestealer_rv"] == "1") then		
			e.other:Message(15,"In the cozy hovel of Rivervale, you have coerced the Halfling rogues into sharing their secret of blade construction: Perfect Balance.");
		else
			e.other:Message(13,"You have not coerced the Halfling rogues into revealing their secret.");
		end
		if (qglobals["Fatestealer_forge"] == "1") then		
			e.other:Message(15,"You have fueled Smith Dandi's furnace with Solusek's Embers.");
			eq.delete_global("Fatestealer_culth");
		else
			e.other:Message(13,"Smith Dandi's forge is not hot enough to craft the blade.");
			eq.set_global("Fatestealer_culth","1",5,"F");
		end		
		if (qglobals["Fatestealer_page"] == "1") then		
			e.other:Message(15,"Wresting the information from the icy grip of Lanys T`Vyl, you have obtained the Teir`dal secret of blade construction: Dark Enchantments.");
		else
			e.other:Message(13,"You lack the Teir`dal secret of blade construction.");
		end
		
		if (qglobals["Fatestealer_nk"] == "1" and qglobals["Fatestealer_sv"] == "1" and qglobals["Fatestealer_hl"] == "1" and qglobals["Fatestealer_pl"] == "1" and qglobals["Fatestealer_rv"] == "1" 
			and qglobals["Fatestealer_forge"] == "1" and qglobals["Fatestealer_page"] == "1") then
			e.self:Say("Seems you're all ready to craft the blade. The instructions you've provided call for a soulstone. If you have one of those, show it to Lirprin and then I'll get started.");
		else
			e.self:Say("Hmm, you're still missing a few things. Keep at it, " .. e.other:GetName() .. "."); 
		end		
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);

	if(qglobals["Fatestealer_bard"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 52346}) ) then
		e.self:Emote("gawks in amazement.  By the Gods, where did you come by these embers? These are positively unnatural, and they bare the mark of Solusek himself!' She sprinkles a handful of the smoldering lumps into the forge and -KABOOM- a blast of incredible heat knocks you off your feet. Immediately, the metal of the forge swells and becomes white hot. 'Yep, this will do the trick,' she gloats cheerfully. The blazing heat doesnt seem to bother her.");
		eq.set_global("Fatestealer_forge","1",5,"F");
		e.other:Message(13,"You have fueled Smith Dandi's furnace with Solusek's Embers.");
	end	
end