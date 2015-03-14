sub EVENT_SAY {
  if ($text=~/hail/i) {
       quest::say("Greetings friend, please show me the Seal of Elder Dumul and I will brief you on the situation.");   
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 9045 =>1 )) {
    quest::say("Good to see you, now keep your head down friend. He may look out here at any moment, though he's been asleep most of the day. He's been staying in a ruined building on that island over there. I'm sure you can see it from here. You should be able to surprise him with little trouble. Just take care to avoid any traps he may have set. He's proven to be a very capable magic-user.");
    quest::say("When you finish with him, please bring any evidence of his being dispatched back to me in this bag. I'll direct you from there. Good luck... I'll watch from here.");
    quest::summonitem(17360);
    quest::spawn(96321,0,0,1988,-9203,10)  
  }
  
  if (plugin::check_handin(\%itemcount, 9047 =>1 )) {
    quest::say("I knew that this creature had power, but how do you explain this? That fight was well beyond my comprehension. I'm not sure what to do other than have you return the bag to Elder Dumul. I'm sure that he will know what to do next. Take care and be swift.");
    quest::summonitem(9048);
  }
  plugin::return_items(\%itemcount);
}