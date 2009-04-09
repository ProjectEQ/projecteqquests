#BeginFile: lakerathe\#Worboli.pl
#Quest file for Lake Rathetear - Worboli: Necromancer Epic 1.5 (pre)

sub EVENT_SPAWN {
  quest::settimer("WorboliDepop",1800); #Depop after 30 minutes
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Yes, yes, looking for the staff are yous? We can tell. We does see a staff but yous must [do somethings] for us first, yes?");
  }
  if($text=~/do somethings/i) {
    quest::say("The gnolls tooks something that was mines. They tooks my fish. It was nice and rotten, yes it was. Yous finds my rotten fish and maybe we can tell about the staff.");
    quest::spawn2(51157,0,0,2260,950,-16,0); #Gnoll Scavanger
  }
}

sub EVENT_ITEM {
  quest::say("I have no use for this, $name.");
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  quest::spawn2(51158,0,0,2260,950,-16,0); #Man-Eating Freshwater Shark
  quest::depop();
}

sub EVENT_TIMER {
  quest::stoptimer("WorboliDepop");
  quest::depop();
}

#EndFile: lakerathe\#Worboli.pl (51156)