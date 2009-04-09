#PRIMARY REWARD:  FACTION.  Player turns in one to four orc scalps to Captain Ashlan.

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Greetings, traveler! I am Captain Ashlan of the Highpass Guards. I keep watch over my men and the [volunteers] here at the East Gate. It's been a busy [job] here lately, with the [orc raids] and all.");
  }
  if($faction>=8||$faction<=5) {
    #[job]
    if($text=~/what job/i){
      quest::say("We're short-handed around here, as usual. Would you like to help us out with the [Volunteer Watch]?");
    }
    #[Volunteer Watch], [Volunteers]
    if($text=~/what volunteer/i){
      quest::say("The Volunteer Watch guards the entry gates of Highpass. Since the [orc raids] are becoming more and more frequent, it's a busy job. But it can pay well, depending on how many [orcs] you slay.");
    }
    #[orcs], [orc raids]
    if($text=~/what orc/i){
      quest::say("One of the orc clans of Kithicor Woods has been trying to expand their territory. Small orc raiding parties are frequently rushing the East Gate. Without the [Volunteer Watch] helping us out, Highpass would probably be overrun by those vile beasts.");
    }
  } else {
    #INCORRECT TEXT
    quest::say("I will not deal with ilk such as you.");
  }
}

sub EVENT_ITEM {
  #Player gives orc scalp
  my $scalps = 0;
  if (plugin::check_handin(\%itemcount,13791=>4)) {$scalps=4;
  } elsif (plugin::check_handin(\%itemcount,13791=>3)) {$scalps=3;
  } elsif (plugin::check_handin(\%itemcount,13791=>2)) {$scalps=2;
  } elsif (plugin::check_handin(\%itemcount,13791=>1)) {$scalps=1;
  }
  if ($scalps>=1) {
    for ($i=0; $i<$scalps; $i++) {
      if ($faction>=8||$faction<=5) {
        my @randomGivenCopper = (0,1,2,3,4,5,6,7,8,9);
        my $copperGiven = ($randomGivenCopper[int(rand(scalar @randomGivenCopper))]);
        my @randomGivenSilver = (0,1,2,3,4,5,6);
        my $silverGiven = ($randomGivenSilver[int(rand(scalar @randomGivenSilver))]);
        my @randomGivenGold = (0,1,2,3);
        my $goldGiven = ($randomGivenGold[int(rand(scalar @randomGivenGold))]);
        my @randomGivenPlatinum = (0,1);
        my $platinumGiven = ($randomGivenPlatinum[int(rand(scalar @randomGivenPlatinum))]);
        quest::say("Great work! Maybe you can help us out again sometime?");
        quest::givecash($copperGiven,$silverGiven,$goldGiven,$platinumGiven);
        quest::faction(149,20);
        quest::faction(31,10);
        quest::faction(214,10);
        quest::faction(53,10);
        quest::faction(105,10);
        quest::exp(10000);
        quest::ding();
      } else {
        #INCORRECT TEXT.  Faction is too low, eat items and laugh.
        quest::say("I will not aid beings such as you.");
      }
    }
  }
  plugin::return_items(\%itemcount); # return unused items
}

#End of File, Zone:highpass  NPC:5013 -- Captain_Ashlan