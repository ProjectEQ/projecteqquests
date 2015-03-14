#BeginFile: felwithea\Chenori_Berinal.pl
#Quest for Northern Felwithe - Chenori Berinal: LoY Cultural Robes

sub EVENT_SAY {
  my $TrueRace = $client->GetBaseRace();

  if($text=~/hail/i) {
    quest::say("Hello, $name. Feel free to browse my wares. Unless you are looking to make a special Feir`Dal robe. If so, just let me know that you want a [robe pattern]."); #Still need real text
  }
  if($text=~/robe pattern/i) {
    if ($TrueRace==5) { #High Elf
      quest::say("Very well. Take this pattern, and good luck to you High Elf."); #Still need real text
      quest::summonitem(65212); #Feir`Dal Robe Pattern
    }
    else {
      quest::say("You are not a High Elf! Who are you trying to fool?"); #Still need real text
    }
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:felwithea  ID:61068 -- Chenori_Berinal