sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail there. $name. So you are ready to learn more about our ways? Do you wish to try and expand your knowledge of our arcane arts? Then venture far from here to the darkest depths of our once great empire and seek the minions that inhabit the ruins. The arcane powers will come in the form of [scrolls].");
}
if($text=~/what scrolls?/i){
quest::say("Besides all the ones you will find. there are some that are only in my possession. To show that you have been successful on your journey. return one of splurt. defoliation. convergence. or thrall of bones. You then will be rewarded with one of my scrolls."); }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 19423 => 1) || # convergence
      plugin::check_handin(\%itemcount, 19296 => 1) || # defoliation
      plugin::check_handin(\%itemcount, 19294 => 1) || # splurt
      plugin::check_handin(\%itemcount, 19299 => 1)) { # thrall of bones
      quest::say("Here is the scroll that I promised. We have both gained much today. I hope to do business with you again soon. Farewell.");      
      quest::summonitem(quest::ChooseRandom(19297,19421,19408,19409));
      quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:cabwest  ID:2787 -- Izarod_Fristan 
#updated by:Maudigan/Airwalking added item handin event




