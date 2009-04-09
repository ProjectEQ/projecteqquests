sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("ZZZzzzzzzzzzzz");
  }
  sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 29845 => 1)) {#Field Orders
    quest::say("Huh? What? Oh, umm, let's see here... OK I best get these taken care of right away. Thank you.");
    quest::faction( 350, 20);
    quest::faction( 168, 20);
    quest::faction( 206, 20);
    quest::faction( 228, -50);
    quest::faction( 54, -50);
    quest::faction( 284, -50);
    quest::faction(139,-50);
    quest::faction(96,-50); 
    quest::faction(138,-50);
  }  
  }
}