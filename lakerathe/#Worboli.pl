#BeginFile: lakerathe\#Worboli.pl
#Quest file for Lake Rathetear - Worboli: Necromancer Epic 1.5 (pre)

sub EVENT_SAY {
  if(defined($qglobals{NecroPre}) && ($qglobals{NecroPre} == 1)) {
    if($text=~/hail/i) {
      quest::say("Yes, yes, looking for the staff are yous? We can tell. We does see a staff but yous must [do somethings] for us first, yes?");
    }
    if($text=~/do somethings/i) {
      quest::say("The gnolls tooks something that was mines. They tooks my fish. It was nice and rotten, yes it was. Yous finds my rotten fish and maybe we can tell about the staff.");
      quest::unique_spawn(51157,0,0,950,2260,-16,0); #Gnoll Scavanger
    }
  }
  else {
    quest::emote("hisses at you.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  quest::unique_spawn(51158,0,0,$x,$y,$z,0); #Man-eating Freshwater Shark
  quest::depop();
}
#EndFile: lakerathe\#Worboli.pl (51156)