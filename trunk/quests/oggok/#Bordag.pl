sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say('Hello. I am the guild master.');
 }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18846 =>1)) { #A tattered note
    quest::say("Ah, a new recruit! Here, take this and bring pride upon yourself, $name."); #Text made up
    quest::summonitem(13575); #Bear Fur Tunic
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Beastlord');
    plugin::return_items(\%itemcount);
  }
}