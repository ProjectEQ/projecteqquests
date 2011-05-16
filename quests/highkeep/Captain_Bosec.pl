sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("I'm Captain Bosec. and I am the officer in charge down here. It's my job to patrol the prison and try to keep any [goblins] from getting into Highpass."); }

}

sub EVENT_ITEM { 
# Left Goblin Ear ID-13790
  my $ear = 0;
  if (plugin::check_handin(\%itemcount,13790=>4)) {$ear=4;
  } elsif (plugin::check_handin(\%itemcount,13790=>3)) {$ear=3;
  } elsif (plugin::check_handin(\%itemcount,13790=>2)) {$ear=2;
  } elsif (plugin::check_handin(\%itemcount,13790=>1)) {$ear=1;
  }
  if ($ear>=1) {
    for ($i=0; $i<$ear; $i++) {
	quest::say("Well done! We could really use the extra help around here.");
        quest::exp(100);
	quest::givecash("3","3","4","0");
	quest::faction(31,4); # Carson McCabe
	quest::faction(53,4); # Corrupt Qeynos Guards
	quest::faction(149,4); # Highpass Guards
	quest::faction(214,4); # Merchants of Highpass
	quest::faction(105 ,4); # Freeport Militia

}
}
}

#END of FILE Zone:highkeep  ID:6034 -- Captain_Bosec.pl  

