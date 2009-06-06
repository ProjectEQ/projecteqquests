#BeginFile cabeast\Half_Elf_Maiden.pl
#
#Quest: Tayla Ironforge
#

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 54026 => 1)) { #Klok's Seal
    quest::say("Oh! thank you! I did not expect to hear of my family ever again. This seal should grant me protection out of the city if I am careful. Please take this note to my father and let him know I am safe!");
    quest::summonitem(18863); #Sealed Letter
    quest::exp(2000);
  }
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:cabeast  ID:Not_Found -- Half Elf Maiden