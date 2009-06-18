sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Congratulations $name! If you turn in your horse I have something that will help you on the rest of your journey.");
  }
  sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 21800 => 1)) {
    quest::say("Perfect!  Here take these and finish the race! Remember to give this to my friend at the end to receive your proof of completing the race!");
    quest::summonitem(2300);
  }  
  }
}