# Cragbeast Queen: Lodestar
# Cragbeast Queen: Loop of the Lizard Slayer
# Cragbeast Queen: Visage of the Brute
# created by Gonner

sub EVENT_SAY {
# Lodestar #

if($text=~/hail/i){

quest::say("Blast ye, $name! For the love of Brell what possessed ye to sneak up on a dwarf when he's drinkin'? I thought ye were the [Cragbeast Queen] come to have me for a light snack."); 
}

if($text=~/cragbeast queen/i){

quest::say("Listen to me carefully, Human. Keep a wide berth if ye value yer skin. She's got a jaw as wide as an ogre's backside and as strong as a steel trap. From what I gather from the natives, she made an appearance after the great explosion rocked this island. They say she crawled right out of the ocean if ye can believe that. Rumor has it that she's been sleepin' for ages and the blast woke her up. Now she roams the beaches at midnight. She's not angry so much as plain famished. We've been lookin' for bands of adventurers like yerself strong enough to take her down. If ye have the skills and ye manage to best the blasted lizard, come back and speak to me. There are [rewards] to be had for such bravery."); 
}

 if (($text=~/what rewards/i) && plugin::check_hasitem($client, 52111)) {

quest::say("Well look at what ye have here. Collected some of the Cragbeast Queen's, Umm, Bile, did ye? That's without a doubt the most foul wretched nauseatin' thing I've ever laid my eyes upon, and that's sayin' a lot. But wait, it's glowin' like a lamp. That's what ye call bio-lumee-nessence, or so a gnome once told me. If you got your hands on a specially made torch to mount the bile in you might have something, $name"); 

}
 if (($text=~/what reward/i) && plugin::check_hasitem($client, 52114)) {

quest::say("By Brell. Look at the craftsmanship, it's unmatched! Ye can tell by the way the gem was cut that it's from a magical ring - mighty powerful one I'd imagine. The rest of the ring was digested in the Cragbeast Queen's stomach so ye'll have to find a suitable replacement. Keep yer eyes peeled for a ring with room for a jewel and reforge the two pieces in a jeweler's kit. Ye shouldn't need any skill as a jewelcrafter per se, so needn't worry about that."); 

}

 if (($text=~/what reward/i) && plugin::check_hasitem($client, 52113)) {
 
quest::say("What's this, $name? A chunk of oddly shaped flesh that ye recovered from the Cragbeast Queen? It almost looks like a face, if ye squint your eyes and turn yer head like so. An ugly face at that. Hmph. Maybe there's something to it that I'm not seein'. Hrmph, [reminds me]."); 

} 

 elsif ($text=~/what rewards/i){

	quest::say("Nay, friend. I don't see that ye have anything from the Cragbeast. Did ye really kill her and come seeking a reward, or are ye just pulling an old dwarf's leg?");
	
}

if($text=~/reminds you of what/i){

quest::say("Well, ye see. There was this friend a' mine, goes by the name of Reyna. She was always blabbin' on and on about how wayward spirits see the world differently, sayin' they have mysterious ways of seein' things that the living cannot. Never quite understood what she was on about. Bunch of blooming balderdash if ye ask me."); 
}

}


#END of FILE zone:natimbi ID:280028 -- Mudarik_Aletipper.pl


