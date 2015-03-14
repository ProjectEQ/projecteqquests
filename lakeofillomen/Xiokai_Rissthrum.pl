sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings friend, it is good to be freed from the clutches of those evil creatures. Tell me are you willing to help me bring some [justice] to them?");
  }
  if ($text=~/justice/i) {
    quest::say("For justice to be brought to them you will need to strike at some of the most powerful goblins found there. Seek out Death Caller Joepla deep within the Mines of Nurga and bring me back the scrolls that the Death Caller carries. Also I will need 3 bracers of blood from the goblin blood knights. Bring me these items and you will be well rewarded. ");
  }
  
  sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 62077 => 1, 62076 => 3)) {
    quest::say("Excellent, justice has been served.  Please take this as your reward.");
  }  
  quest::summonitem(62194);
  }
}