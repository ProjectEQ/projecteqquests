#BeginFile: erudnext\Valani_Gadriek.pl
#Quest for Erudin - Valani Gadriek: LoY Cultural Robes

sub EVENT_SAY {
  my $TrueRace = $client->GetBaseRace();

  if($text=~/hail/i) {
    quest::say("Hello, $name. Feel free to browse my wares. Unless you are looking to make a special Erudian robe. If so, just let me know that you want a [robe pattern]."); #Still need real text
  }
  if($text=~/robe pattern/i) {
    if ($TrueRace==3) { #Erudite
      quest::say("Very well. Take this pattern, and good luck to you Erudite."); #Still need real text
      quest::summonitem(65168); #Erudian Robe Pattern
    }
    else {
      quest::say("You are not an Erudite! Who are you trying to fool?"); #Still need real text
    }
  }
}

sub EVENT_ITEM {
  quest::say("I have no use for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:erudnext  ID:24096 -- Valani_Gadriek