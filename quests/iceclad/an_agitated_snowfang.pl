#Zone: Iceclad Ocean
#Short Name: iceclad
#Zone ID: 110
#
#NPC Name: an agitated snowfang
#NPC ID: 110091
#Quest Status: finished
#

sub EVENT_SPAWN {  
  quest::settimer("despawn",60); #this triggered mob is only available for hails for one minute then depops
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("shivers and growls to itself.");
    quest::say("Much thanks must I give, $name. Furless one still wants magic thing, after all the troubles? Say quickly. Much pain from attack. Must go, shaman help.");
  }
  if ($text=~/magic thing/i) {
    quest::summonitem(30042);
    quest::stoptimer("despawn");
    quest::depop();
  }
}

sub EVENT_TIMER {
  quest::stoptimer("despawn");
  quest::depop();
}

#END of FILE Zone: iceclad ID:110091 -- an_agitated_snowfang

