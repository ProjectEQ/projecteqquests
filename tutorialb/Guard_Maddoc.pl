#zone - tutorialb
#quest - Queen Gloomfang
#site3op
# items: 14018, 77780

sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("Greetings, $name. We're glad you found your way to our camp. We can use all the help we can get!");
      quest::taskselector(5096, 5098);
   }
} 

sub EVENT_ITEM{
  if(plugin::check_handin(\%itemcount, 14018 => 1)) {
    quest::summonitem(77780); # Item: Distillate of Celestial Healing II
    quest::summonitem(77780); # Item: Distillate of Celestial Healing II
    quest::summonitem(77780); # Item: Distillate of Celestial Healing II
    quest::summonitem(77780); # Item: Distillate of Celestial Healing II
    quest::summonitem(77780); # Item: Distillate of Celestial Healing II
    quest::exp(500);
  }
  plugin::return_items(\%itemcount); 
}