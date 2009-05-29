#########################################################
# Bidl Frugrin (ID:54302?)
# Zone:   Greater Faydark (gfaydark)
# Quest:  Telescope Lenses
# Author: a_sewer_rat
#########################################################

sub EVENT_SAY {
   if($text=~/Hail/i){
      quest::say("Greeting. Do not you find the wine of Kelethin as sweet as their women?");
   }
   if($text=~/lens/i){
      quest::say("Oh my!! I forgot I had that. Here you are. You better take it back I need to go elsewhere, bye now.");
      quest::summonitem(13276); #telescope lens [bidl's lens]
   }
}

#END of FILE Zone:gfaydark  ID:54302? -- Bidl_Frugrin

