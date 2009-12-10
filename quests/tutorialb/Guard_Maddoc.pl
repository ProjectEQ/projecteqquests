#zone - tutorialb
#quest - Queen Gloomfang
#site3op

sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::say("Greetings, $name. We're glad you found your way to our camp. We can use all the help we can get!");
      quest::taskselector(34, 35);
   }
} 

sub EVENT_ITEM{
  if(plugin::check_handin(\%itemcount, 14018 => 1)) {
    quest::summonitem(77780);
    quest::summonitem(77780);
    quest::summonitem(77780);
    quest::summonitem(77780);
    quest::summonitem(77780);
    quest::exp(500);
  }
  else {
    plugin::return_items(\%itemcount); 
  }
}