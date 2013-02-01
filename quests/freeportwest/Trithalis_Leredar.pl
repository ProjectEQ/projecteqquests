#BeginFile: freportw\Trithalis_Leredar.pl
#Quest for West Freeport - Trithalis Leredar: LoY Cultural Robes

sub EVENT_SAY {
  my $TrueRace = $client->GetBaseRace();

  if($text=~/hail/i) {
    quest::say("Hello, $name. Feel free to browse my wares. Unless you are looking to make a special Antonican robe. If so, just let me know that you want a [robe pattern]."); #Still need real text
  }
  if($text=~/robe pattern/i) {
    if ($TrueRace==1) { #Human
      quest::say("Very well. Take this pattern, and good luck to you Human."); #Still need real text
      quest::summonitem(65234); #Antonican Robe Pattern
    }
    else {
      quest::say("You are not a Human! Who are you trying to fool?"); #Still need real text
    }
  }
}

sub EVENT_ITEM {
  quest::say("I have no use for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportw  ID:9114 -- Trithalis_Leredar