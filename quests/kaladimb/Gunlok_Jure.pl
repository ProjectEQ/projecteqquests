sub EVENT_SAY {
# Bone Chips (Kaladim) (START)
  if($text=~/hail/i) {
    quest::say("Hail, $name!  Bow before the greatness of the Clerics of Underfoot!  It is good to be a paladin in such an order as ours - to fight the good fight and defend Kaladim from the evil and undead.  If you be a paladin, then I pray you find the [courage to battle the undead].");
  }
  if($text=~/courage/i) {
    quest::say("Yes!!  To battle the undead is our greatest call.  There has been a rise in the number of dwarven skeletons seen in the Butcherblocks.  If you are a true member of this order, I shall reward you for the return of four bone chips.  We shall defend our land from evil!");
  }
# Bone Chips (Kaladim) (END)
}

sub EVENT_ITEM {
# Bone Chips (Kaladim) (START)
  if(plugin::check_handin(\%itemcount, 13073 => 4)) {
    quest::say("You have done well. We thank you for your deed with this humble reward. The power behind the raising of our dead shall soon be found. You will earn more respect with more bone chips. I only wish you could assist in the return of the [remains of Cromil].");
    quest::summonitem(quest::ChooseRandom(2116,2122,5013,5014,5016,5023,6011,13002,13003));
    quest::exp(2000);                  # Experience
    quest::givecash("7","10","0","0"); # Cash
    quest::faction(44,10);             # Clerics of Underfoot
    quest::faction(169,10);            # Kazon Stormhammer
    quest::faction(219,10);            # Miners Guild 249
# Bone Chips (Kaladim) (END)
  } else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
 }
}

