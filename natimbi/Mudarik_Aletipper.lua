-- Cragbeast Queen: Lodestar / Cragbeast Queen: Loop of the Lizard Slayer /  Cragbeast Queen: Visage of the Brute

function event_say(e)
    if(e.message:findi("hail")) then
		e.self:Emote("spits out a mouthful of brew. 'Blast ye, ".. e.other:GetCleanName() .."! For the love of Brell what possessed ye to sneak up on a dwarf when he's drinkin'? I thought ye were the [Cragbeast Queen] come to have me for a light snack");
    elseif(e.message:findi("Cragbeast Queen")) then
		e.self:Emote("nods knowingly and leans in close. 'Listen to me carefully, ".. e.other:Race() ..". Keep a wide berth if ye value yer skin. She's got a jaw as wide as an ogre's backside and as strong as a steel trap. From what I gather from the natives, she made an appearance after the great explosion rocked this island. They say she crawled right out of the ocean if ye can believe that. Rumor has it that she's been sleepin' for ages and the blast woke her up. Now she roams the beaches at midnight. She's not angry so much as plain famished. We've been lookin' for bands of adventurers like yerself strong enough to take her down. If ye have the skills and ye manage to best the blasted lizard, come back and speak to me. There are [rewards] to be had for such bravery");
    elseif(e.message:findi("remind")) then
        e.self:Say("Well, ye see. There was this friend a' mine, goes by the name of Reyna. She was always blabbin' on and on about how wayward spirits see the world differently, sayin' they have mysterious ways of seein' things that the living cannot. Never quite understood what she was on about. Bunch of blooming balderdash if ye ask me.");
    elseif(e.message:findi("reward")) then
	    if(e.other:HasItem(52111)) then --phosphorescent bile
	        e.self:Say("Well look at what ye have here. Collected some of the Cragbeast Queen's, umm, Bile, did ye? That's without a doubt the most foul wretched nauseatin' thing I've ever laid my eyes upon, and that's sayin' a lot. But wait, it's glowin' like a lamp. That's what ye call bio-lumee-nessence, or so a gnome once told me. If you got your hands on a specially made torch to mount the bile in you might have something, ".. e.other:GetCleanName() .."");
	    elseif(e.other:HasItem(52114)) then --glowing bile drenched jewel
            e.self:Say("By Brell. Look at the craftsmanship, it's unmatched! Ye can tell by the way the gem was cut that it's from a magical ring - mighty powerful one I'd imagine. The rest of the ring was digested in the Cragbeast Queen's stomach so ye'll have to find a suitable replacement. Keep yer eyes peeled for a ring with room for a jewel and reforge the two pieces in a jeweler's kit. Ye shouldn't need any skill as a jewelcrafter per se, so needn't worry about that.");
        elseif(e.other:HasItem(52113)) then --misshapen cragbeast flesh
	        e.self:Say("What's this, ".. e.other:GetCleanName() .."? A chunk of oddly shaped flesh that ye recovered from the Cragbeast Queen? It almost looks like a face, if ye squint your eyes and turn yer head like so. An ugly face at that. Hmph. Maybe there's something to it that I'm not seein'. Hrmph, [reminds me].");
        else
            e.self:Emote("Nay, friend. I don't see that ye have anything from the Cragbeast. Did ye really kill her and come seeking a reward, or are ye just pulling an old dwarf's leg?");
        end
    end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
