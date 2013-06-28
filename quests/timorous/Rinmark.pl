#Rinmark is spawned from an iksar master in this zone and is part of the Test of Patience. Please see the iksar master's quest file for details.

sub EVENT_SPAWN {
  quest::settimer("Depop3",90);
}

sub EVENT_AGGRO {
  quest::say("Good, your sense of timing is correct. Now begin! Show me that your training has not been wasted.");
}

sub EVENT_TIMER {
 if ($timer eq "Depop3") {
  quest::stoptimer("Depop3");
  quest::depop();
 }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("Your ability is strong, may you serve Cazic Thule with all your might.");
}

#Submitted by: Jim Mills