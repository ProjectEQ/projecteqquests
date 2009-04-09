# Cragbeast Queen: Lizardscale Woven Sash
# Created by Gonner

sub EVENT_SAY {

 if (($text=~/hail/i) && plugin::check_hasitem($client, 52125)) { # scale of the cragbeast queen

quest::say("Unbelievable! Those are authentic ancient cragbeast scales. Why, they're absolutely humongous. Some of the scales are a bit charred or damaged in places, hmm. She chuckles, The beast didn't go down without a
fight, I take it? There are enough scales in good shape to fashion a sash. I could do so with the right [materials], if you wish."); 

}

 elsif ($text=~/hail/i){
	quest::emote("nods in your direction.");
	quest::say("Greetings. This is a place of peace and safety. Feel free to have a seat in our camp and relax. The Wayfarers have rescued me from the clutches of the Legion of Mata Muram. We owe them so much. I wish there were some way I could [repay] them.");
}


if($text=~/repay/i){

quest::say("I am not a warrior, and that's what is truly needed in these dark times. There's nothing I can do except weave. In our tribe I was an expert seamstress. I can work with nearly any material, but my specialty is decorative clothing woven from scales of the cragbeast."); }

if($text=~/what materials/i){

quest::say("This shouldn't be too difficult for someone like yourself. I will need you to bring me the raw materials to weave the sash. Combine them in this box and then return the box to me. The work will require three Pristine Hynid Manes, a pair of Untainted Spectral Essences, and the Cragbeast Queen's Scales."); 
quest::summonitem(52129); # Lienni's empty box
}

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 52131 => 1)) { # Lienni's Box of Raw Materials
quest::say("This is my finest work, $name. Wear it with pride and know that it was my distinct honor to assist you in this fashion.");
quest::summonitem(52124); # Lizardscale Woven Sash
quest::exp(200000);
 }

}
#END of FILE zone:natimbi ID:280041 -- Lienni.pl

