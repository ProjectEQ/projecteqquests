# Epic NPC -- Keeper_of_Souls

sub EVENT_SPAWN {
  quest::settimer("summit",1800);
}

sub EVENT_TIMER {
  if ($timer eq "summit") {
    quest::stoptimer("summit");
    quest::depop();
  }
}

sub EVENT_DEATH_COMPLETE {
  $sirran= undef;
  quest::setglobal("sirran",4,3,"M20");
  quest::spawn2(71058,0,0,-543,767,174,64);
} 

#END of FILE  Quest by: Solid11  Zone:airplane  ID:71075 -- Keeper_of_Souls
