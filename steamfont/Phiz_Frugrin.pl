#########################################################
# Phiz Frugrin (ID:56177)
# Zone:   Steamfont (steamfont)
# Quest:  Telescope Lenses
# Author: a_sewer_rat
#########################################################

sub EVENT_SAY {
   if($text=~/Hail/i){
      quest::say("Hello my friend. Good to meet you.");
   }
   if($text=~/lens/i){
      quest::say("Oh my. I have bad news. It was stolen by a dark elf rogue. She fled very quickly. My little legs could not keep up. Here. She dropped this. You must find her. Get it back. We have very few Lenses.");
      quest::summonitem(18867); # filthy towel
   }
}

#END of FILE Zone:steamfont  ID:56115 -- Phiz_Frugrin 