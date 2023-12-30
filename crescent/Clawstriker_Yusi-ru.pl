sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Vasha, $name. We must all realize that an ant may well destroy a whole dam. And even a hare will bite when it is cornered. These are some of the teachings of the monks of the Fangs of the Dragon that remind us of how we learn from the world to make us stronger.");
  }
}

sub EVENT_ITEM {
  if (($class eq "Monk") && (plugin::check_handin(\%itemcount, 58655 => 1))) { #Crescent Reach Guild Summons
    quest::say("Karui, young one, for becoming one with the Fangs of the Dragon. You shall discover many things in this world -- that killing one can warn a hundred and that as vicious as a tigress can be, she never eats her own cubs. We become wise by observing the world and gain power by joining our mind, body and spirit to defend that which is most important to us.  Take this tunic of the Fangs of the Dragon to guard you.  Now, find Innkeeper Fathus and Initiate Dakkan. They will provide you with work. Udra, apprentice.");
    quest::faction(1129, 100); #Circle of the Crystalwing
    quest::summonitem(58759); #Fangs of the Dragon Apprentice Tunic*
  }
  plugin::return_items(\%itemcount);
}