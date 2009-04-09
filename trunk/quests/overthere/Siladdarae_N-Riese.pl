sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello, $name. This place is quite a formidable outpost, but it lacks the comforts of home. Once I have finished collecting some of my [missing scrolls], I'll be able to leave this place and all its hidden dangers.");
}
if($text=~/missing scrolls/i){
quest::say("Travelers have been bringing back numerous scrolls from the depths of darkness in the Outlands. They contain arcane knowledge specific to our classes. Only four are left that I seek. Keep a wary out for Theft of Thoughts, Color Slant, Cripple, and Dementia. Return any one of these to me and your reward shall be a scroll that can be found nowhere else."); }
}

sub EVENT_ITEM(){
  if (plugin::check_handin(\%itemcount, 19374 => 1) || # theft of thought
      plugin::check_handin(\%itemcount, 19378 => 1) || # color slant
      plugin::check_handin(\%itemcount, 19269 => 1) || # cripple
      plugin::check_handin(\%itemcount, 19384 => 1)) { # dementia
    quest::say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");      
    quest::summonitem(quest::ChooseRandom(19386,19379,19381,19215));
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:overthere  ID:93098 -- Siladdarae_N`Riese 

