sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings friend, it is good to be freed from the clutches of those evil creatures. Tell me are you willing to help me bring some [justice] to them?");
  }
  if ($text=~/justice/i) {
    quest::say("For justice to be brought to them you will need to strike at some of the most powerful goblins found there. Seek out Death Knight Donkot deep within the Mines of Nurga and bring me back his death blade. Also I will need 3 totems of death casting from the goblin death casters. Bring me these items and you will be well rewarded. ");
  }
  
  sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 62091 => 1, 62090 => 3)) {
    quest::say("Excellent, justice has been served.  Please take this as your reward.");
  }  
  quest::summonitem(62201);
  }
}