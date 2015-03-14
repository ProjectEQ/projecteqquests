sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 9968 => 1)) {
    quest::say("How dare you bring me this! You shall pay for what you have done!!");
    quest::attack($name);
    quest::summonitem(9967); #Karran's Head
  }
  plugin::return_items(\%itemcount);
}