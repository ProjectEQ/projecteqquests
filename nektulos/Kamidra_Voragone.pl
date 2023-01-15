# items: 13088
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello, $name. I am so hungry, but I have much work to do. Do you think you can [help] me?"); #Text made up
  }
  if ($text=~/help/i) {
    quest::say("Excellent."); #Text made up
    quest::taskselector(154); #Black Eggs for Breakfast
  }
}
  
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13088 => 4) || plugin::check_handin(\%itemcount, 13088 => 3) || plugin::check_handin(\%itemcount, 13088 => 2) || plugin::check_handin(\%itemcount, 13088 => 1)) { #Snake Eggs
    quest::say("Thank you. I am impressed!");
  }
  plugin::return_items(\%itemcount);
}