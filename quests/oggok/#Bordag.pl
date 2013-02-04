sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18846 =>1)) { #A tattered note
    quest::say("You strong and mean like bear!  You wear bear fur so all know you beastlord o' da Feerrott!  Talk to Grapok and get to work!"); 
    quest::summonitem(13575); #Bear Fur Tunic
	quest::ding();
	quest::faction(295,5); # Shaman of War
	quest::exp(100);
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
    plugin::return_items(\%itemcount);
  }
}

