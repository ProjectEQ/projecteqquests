# items: 2692, 2693, 10015
sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Greetings $name. I am Avir Sterbla, Governor of Magician Studies here at the Magus Conlegium of Katta Castellum. I am currently in the middle of researching more effective magical methods of combating the [vampyres] of the Coterie of the Eternal Night. Governor Drenic Garrison has been assisting me with the scientific side of the research, that having to do with physical materials that have detrimental effects on the vampyres while my research is more with magical elements.");
 }
 elsif($text=~/vampyres/i){
  #Part of Vampyre Ash and Blood
  quest::say("The vampyres are becoming a larger threat to the safety of our citizens and it is the responsibility of the Magus Conlegium to find magical ways of stifling this threat while the Validus Custodus fight them with physical means. However, I am running short on research components. I will trade for every four samples of vampyre blood or every four piles of vampyre ashes.");
 }
}

sub EVENT_ITEM {
  #Handin: 4x Vampyre Ashes (2692) or 4x Vampyre Blood (2693)
  if((plugin::check_handin(\%itemcount, 2692 => 4)) || (plugin::check_handin(\%itemcount, 2693 => 4))){
  quest::say("Thank you $name! These samples will be put to good use I assure you. The Coterie will not stand much longer against the forces of Katta Castellum.");
  quest::summonitem(10015, 8); # Malachite
  quest::faction(1504,10);  # +Magus Conlegium
  quest::faction(1502,10);  # +Katta Castellum Citizens
  quest::faction(1503,10);  # +Validus Custodus
  quest::faction(1483,-10); # -Seru
  quest::faction(1484,-10); # -Hand of Seru
  quest::faction(1485,-10);  # -Eye of Seru
  quest::faction(1541,-10); # -Hand Legionnaries
  }
  plugin::return_items(\%itemcount);
}

#Quest: Vampyre Ash & Blood (Submitted By: Senzo)
