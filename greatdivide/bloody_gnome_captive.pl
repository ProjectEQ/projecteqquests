#Zone: Great Divide
#Short Name: greatdivide
#Zone ID: 118
#
#NPC Name: gnomish captive
#NPC ID: 118154
#Quest Status: In Prog.
#
# items: 30045

sub EVENT_SPAWN {
  quest::settimer("despawn",60); #this is to keep the captive gnome from staying spawned indefinately if someone triggers bloodmaw and leaves
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Uh, hi. Hey, that was great work and all. I couldn't believe that. Knowing that bear, I was sure my time was up. I'm heading back to Ak'Anon. I've had enough of pirates, mountains, snow, and bears ten times my size. If you want a map to get back you can have it.");
  }
  if ($text=~/map/i) {
    quest::summonitem(30045); # Item: Third part of an Iceclad Map
    quest::exp(100);
    quest::stoptimer("despawn");
    quest::depop();
  }
}

sub EVENT_TIMER {
  quest::stoptimer("despawn");
  quest::depop();
}

#END of FILE Zone: greatdivide  ID:118154 -- gnomish_captive