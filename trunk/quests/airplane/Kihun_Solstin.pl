#Zone: Plane of Sky
#Short Name: airplane
#Zone ID: 71
#
#NPC Name: Kihun Solstin
#NPC ID: 70155
#Quest Status: finished
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("So, you have made it this far. I am Kihun Solstin, the Master of Wind. I control the unfettered Element like none other. As you should have learned, Air is the most potent of Elements. It fuels Fire, Water is comprised of it, and Earth cannot restrain it. Knowing this, do you seek the Element of Wind?");
  }
  if ($text=~/i seek the element of wind/i) {
    quest::say("I will test you then. In this wondrous plane of Sky, find the Crown of Elemental Mastery. Then, search the world below for an Elemental Binder and a cloak fashioned from the feathers of a Pegusus. Return them to me and I shall give you the Element of Wind.");
  }
  if ($text=~/see the master/i) {
    quest::say("Very well."); #Text made up
    quest::spawn2(71040,0,0,604.5,1346.3,-766,0); #spawn the master of elements
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20764 => 1, 28043 => 1, 2463 => 1)) {
    quest::say("If you have obtained the other, lesser Elements, go speak with The Master of Elements, who is now waiting for you. I wish you luck. If you have not completed all the tasks set for you, let me know, and I shall let you see the Master.");
    quest::summonitem(28033);
    quest::exp(5000);
    quest::spawn2(71040,0,0,604.5,1346.3,-766,0); #spawn the master of elements
  }
  else {
    quest::say("I have no need for this.");
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone: airplane ID:70115 -- Kihun_Solstin

