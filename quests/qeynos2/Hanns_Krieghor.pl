#Hanns accepts Stanos' head for yet another alternate ending to the rogue epic quest (the other being to give Stanos' head to General V`ghera and receive the high elf illusion mask).

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("My name is Hanns..  Do as I say. and we shall get along just fine.");
  }
  if($text=~/carson has a mole in the highpass/i) {
    quest::say("Arrgg, that Carson can't control anything. Sometimes he's practically useless. Go tell Zannsin that [I want him to send some of his men to Prak in Highpass], to help Carson get back on track.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 28058 => 1)) {
    quest::say("Well done, $name."); #Text made up
    quest::summonitem(7501);
    quest::exp(500000);
    quest::ding();
    quest::faction(33,20);
  }
  else{
    plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
    plugin::return_items(\%itemcount);
  }
}

#Submitted by Jim Mills