#####################################
#Quests: Convert Fishermen
#NPC: Marlin Bizmite
#Zone: Qeynos
#Author: RealityIncarnate
#####################################

sub EVENT_SAY { 
  if ($text=~/Hail/i) {
    quest::say("You know.. I took up fishing because it was a nice, quiet activity. Most of all, I took it up to avoid conversing with strangers. Get the picture?!!"); 
  }

  if ($text=~/blessing of prexus/i) {
    quest::say("Prexus!!? Aye!! I once followed the ways of the Ocean Lord. I remember those days. So clear and peaceful were they. I shall make a deal with you, my friend. I shall give up fishing if you give me your guild tunic. With such a tunic I shall once again be compelled to follow the peaceful ways of the Ocean Lord.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13544 => 1)) {
    quest::say("Nice material!! I feel the ways of Prexus enlightening my soul. Unngh!! Enough of this fishing. Here take my broken fishing pole and toss it to the sea. All hail Prexus!!");
    quest::summonitem(13922);
    quest::faction( 79, 5);
    quest::faction( 145, 5);
    quest::faction( 143, -5);
    quest::exp(100);
  }
}
    
#END of FILE Zone:qcat  ID:10139 -- Bait_Masterson