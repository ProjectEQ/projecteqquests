sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("ZZZzzzzzzzzzzz");
  }
  sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 29845 => 1)) {#Field Orders
    quest::say("Huh? What? Oh, umm, let's see here... OK I best get these taken care of right away. Thank you.");
    quest::faction( 1503, 20);
    quest::faction( 1502, 20);
    quest::faction( 1504, 20);
    quest::faction( 1505, -50);
    quest::faction( 1525, -50);
    quest::faction( 1483, -50);
    quest::faction(1484,-50);
    quest::faction(1485,-50); 
    quest::faction(1541,-50);
  }  
  }
}
