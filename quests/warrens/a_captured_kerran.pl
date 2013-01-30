###############################
# NPC: A captured Kerran
# Zone: The Warrens
# Quest: Erudite Prisoners
# Modified by RealityIncarnate
###############################

sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::say("My spirrrit witherrrrs herrre in this dank, stinking, flea infested hole! I must be set frrree frrrom these shackles!!"); 
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 6923 => 1)) {
    quest::say("I thank you for frrreeing me frrrom my dog face captorrrs.");
    quest::exp(300);
    quest::depop_withtimer();
  }
  else {
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:warrens  ID:101085 -- a_captured_kerran