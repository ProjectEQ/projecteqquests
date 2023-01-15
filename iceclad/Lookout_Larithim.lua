-- items: 52339, 52341, 52342
function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if(e.message:findi("lirprin sent me") and qglobals["Fatestealer"] == "3") then
		e.self:Say("Lirprin sent ye, did he mate? I was beginnin' ta wonder when the perils of me dastardly mutiny would catch up with me. Tis my shame, and I'll shoulder the burden 'til the day I rest at the bottom of the ocean. To tell ye the truth Cap'n Lirprin treated us alright, but te be away from ship n' sail was murder. I'd rather be scrapin' barnacles for all eternity than spend another moment in yon Discord Plane. Only, well, it seems that me ship and sail are gone again.' Larithim sighs dramatically, and waits for the effect to sink in before continuing. 'Would ye like ta [" .. eq.say_link("hear the tale") .. "], landlubber? Tis guaranteed to bring a tear ta the eye o' even the saltiest sea dog. Arrrr.");
	elseif(e.message:findi("hear the tale") and qglobals["Fatestealer"] == "3") then
		e.self:Say("Allow me te paint ye the picture, Sanam, of a story so strange and frightenin'! Twasn't more than a fortnight followin' my glorious return to plunderin'. I was bringin' me ship, Glaciersmash, into the coast ye see before ya now. The weather was cruel and unrelentin'. Waves they were crashin' up against the port bow.' He motions with his arms to indicate large waves, and makes a shrill blowing sound to imitate the wind. 'Hoist the main sail, tug the riggin's and man the longboats men, says I. That's when a twisting tentacle as thick as yer leg stretched out from the waters and latched ahold of the main mast! Guess ye [" .. eq.say_link("what happened then") .. "]?");
	elseif(e.message:findi("what happened then") and qglobals["Fatestealer"] == "3") then
		if(qglobals["rogue_epic_iceclad"] ==  nil) then
			eq.set_global("rogue_epic_iceclad","1",3,"H2");
			e.self:Say("Arrr. The boat she tipped and groaned, wood bucklin' and rope snappin'. My precious cargo of metal alloy spilled overboard. Before we knew it, she capsized like a maiden's . . . Wait, is that . . .? Well I'll be a crusty barnacle. Ye see that there, Sanam!? NO, not the tower. There it is again - the scurvy squid has returned. IT BE THE POLAR KRAKEN! Get out there and harpoon its backside, Sanam. I'll keep a sharp lookout here and we'll split the booty. The alloy will oxidize right quick if ye expose it to the air - stash it in here and bring it back te me.");	
			e.other:SummonItem(52339); --Air-Tight Strongbox
			eq.depop_all(110131); --polar kraken
			eq.depop_all(110132); --krakling
			eq.spawn2(110131,0,0,752,2876,-85,0); -- NPC: #Polar_Kraken
		else
			e.self:Say("Hrm, looks like the tentacled monstrosity has taken its leave of us. Had its fill of hapless sailors I'd wager, but not te worry. The kraken'll be back, and we'll be waitin' for it. Arrr.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 52341}) ) then 
		e.self:Say("Yar! Heres ye half matey");  --made up, cant find any info
		e.other:SummonItem(52342); --Strongbox Half Full of Velixite
		eq.set_global("rogue_epic_larithim","1",5,"F");
		e.other:Message(15,"You have confirmed Larithim's innocence.");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end