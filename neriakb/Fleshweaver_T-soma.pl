# items: 17592, 17593, 63012, 63013, 63015, 63052, 63053
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Ah you must be the one sent to assist me. Good. I have need of flesh for my spellwork. I wish to summon them myself! Get me three samples of flesh from these new Luggald beings. Put the samples in this Fleshthread Satchel so that they don't decay.");
    quest::summonitem(17592); # Item: Fleshthreaded Satchel
  }
  if ($text=~/task/i) {
    if (defined $qglobals{tsoma} && $qglobals{tsoma} == 1) {
    quest::say("We first learned of the Luggalds through our agents on Broken Skull Rock. It appears that Innoruuk intended these servants only for the trolls. We shall see about that! Go retrieve three samples of Fecund Luggald Flesh. You will need to get the flesh of those in the Crypt of Nadox this time. Here. Make sure to put them in this Fleshwoven Bag.");
    quest::summonitem(17593); # Item: Fleshwoven Bag
    }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 63012 =>1 )) {
    quest::say("Hmm. You seem more capable than my other assistants. I have another [task] to ask of you.");
    quest::setglobal("tsoma",1,5,"F");
  }
  if (plugin::check_handin(\%itemcount, 63013 =>1 )) {
    quest::say("Ah, yes. These are fantastic examples. No doubt they will ensure the success of our attempt. Now quickly, go speak with my Assistant T`os. She's prepared the ritual of summoning on the shores of Toxxulia Forest. It should be far enough away if anything...occurs.");
    quest::setglobal("tsoma",2,5,"F");
  }
  if (defined $qglobals{tsoma} && $qglobals{tsoma} == 2) {
  if (plugin::check_handin(\%itemcount, 63015 =>1 )) {
    if (($class eq "bard") || ($class eq "beastlord") || ($class eq "paladin") || ($class eq "ranger") || ($class eq "rogue") || ($class eq "shadowknight") || ($class eq "warrior")){
    		quest::say("Apparently our ignorance exceeded our luck. Ah well, I'm sure the Prince of Hate will find some other punishment for our folly. Well, since you too chance his anger I suppose you deserve a reward. Here, take this...though I'm not sure how much use it will be against a god."); 
    		quest::summonitem(63052); # Item: Heartspike
		quest::exp(5000);
    }
	else{
		quest::say("Apparently our ignorance exceeded our luck. Ah well, I'm sure the Prince of Hate will find some other punishment for our folly. Well, since you too chance his anger I suppose you deserve a reward. Here, take this...though I'm not sure how much use it will be against a god."); 
    		quest::summonitem(63053); # Item: Fleshweaver's Mark
		quest::exp(5000);

  }
  }
  }
  plugin::return_items(\%itemcount);
}