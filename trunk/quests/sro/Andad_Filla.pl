#Zone: Southern Ro
#Short Name: sro
#Zone ID: 35
#
#NPC Name: Andad Filla
#NPC ID: 35030
#Quest Status: finished
#

sub EVENT_SAY { 
  if ($text=~/Hail/i) {
    quest::say("Hello traveler, please do not bother me right now; I am waiting for someone.");
  }
}

sub EVENT_ITEM {
  if ($itemcount{20533} == 1) {
    quest::say("You still have a ways to go! Seek out Misty Tekcihta near the arena at Lake Rathe. Run like the wind!");
    quest::summonitem(20534);
  }
}

#END of FILE Zone:sro  ID:35030 -- Andad_Filla