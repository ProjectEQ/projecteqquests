sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Rrrr..I am  Asad. Shazda of the Kerran [Sejah]. It is my duty to ensure the safety of what lands have not been taken from us by the Erudites, and to train my soldiers in the fighting styles of our heritage.");
  }
  if ($text=~/sejah/i) {
    quest::say("The soldiers of our sejah are all trained from the time they are weaned from their matriarchs. If you wish to be honored by the sejah you must prove to us your loyalty and devotion to the defense of our lands. In Toxxulia Forest there are Erudite emissaries who constantly attempt to encroach upon our territory. Bring me the head of one such emissary."); 
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 12319 => 1)) {
    quest::say("Excellent work, young ayyar! You have proven your willingness to dispose of the enemies of our tribe, now you must face one of their most murderous sentries! Bring me the head of Sentinel Creot and I shall induct you into our sejah!");
    quest::faction(175,20);
    quest::givecash(0,6,0,0);
    quest::summonitem(10343);
    quest::exp(5000);
  }
  if (plugin::check_handin(\%itemcount, 12438 => 1)) {
    quest::say("You have proven your self yet again! You are now a full member of our sejah because of this brave act! To show your status here is a bracer for you to wear.");
    quest::summonitem(3147);
    quest::faction(175,30);
    quest::exp(6500);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:kerraridge  ID:74012 -- Shazda_Asad