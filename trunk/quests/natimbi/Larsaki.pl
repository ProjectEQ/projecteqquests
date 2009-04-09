# Cragbeast Queen: Lizardscale Plated Girdle
# Created by Gonner

sub EVENT_SAY {

 if (($text=~/hail/i) && plugin::check_hasitem($client, 52125)) { # scale of the cragbeast queen
 
 quest::emote("yelps with surprise as she notices the bundle of scales you carry.");
quest::say("How? Where did you acquire those ancient cragbeast scales? As long as I've lived in Taelosia I've never seen any so enormous. The beast must have been several centuries old!' She pauses a moment to regain her composure, 'It would be my honor to fashion those scales into something more practical for you. They are intact enough to create a scale plated belt. All I need are the remaining raw [materials]."); 

}

 elsif ($text=~/hail/i){
	quest::emote("smiles and extends her arm to welcome you.");
	quest::say("Pleased to have you in our quaint makeshift camp, $name. Stay as long as you like. The Wayfarers always seem busy, but there's not much for me to do here other than work on my [weaving].");
}


if($text=~/what weaving/i){

quest::say("Yes. You may have heard of my skill. Among my tribe I was an expert seamstress, the most talented seamstress that has existed for generations. While I can work with a variety of materials, my forte lies in weaving the scales from cragbeasts into decorative attire."); }

if($text=~/what materials/i){

quest::say("Splendid. This is what will be required of you, $name. Bring me the raw materials necessary to forge the belt. Combine them in this container and then return the box to me. The work will require three Polished Stonemite Shells, a pair of Untainted Spectral Essences, and the Cragbeast Queen's Scales."); 
quest::summonitem(52130); # Larsaki's empty box
}

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 52132 => 1)) { # Larsaki's Box of Raw Materials
quest::say("This is my finest work, $name. Wear it with pride and know that it was my distinct honor to assist you in this fashion.");
quest::summonitem(52123); # Lizardscale Plated Girdle
quest::exp(200000);
 }

}
#END of FILE zone:natimbi ID:280042 -- Larsaki.pl
