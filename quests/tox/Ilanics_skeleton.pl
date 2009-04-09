# Ilanic's Scroll

sub EVENT_SAY {

   if($text=~/Hail/i){

   quest::say("My scroll must find my [scroll] so I may finish my research.");

}

   if($text=~/scroll/i){

    quest::say("Kobold! Kobold!");

}
 }
      plugin::return_items(\%itemcount);
      quest::say("What am I supposed to do with these?");


#END of FILE Zone:erudnint  ID:38150 --  Ilanics_skeleton