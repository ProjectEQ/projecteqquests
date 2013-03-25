################################### 
#Zone: Ak`Anon                    #
#Short Name: akanon               #    
#Zone ID: 55                      #                                        
###################################                                             
#NPC Name: Drekon_Vebnebber       #                             
#NPC ID: 55116                    #
#Quest Status: Complete           #                                      
###################################

sub EVENT_SAY { 
  if($text=~/hail/i) {
    quest::say("Hello, $name. It is grand to make your acquaintance. I am the in-house merchant-slash-file clerk. I have goods to offer and I handle all the Gemchopper paperwork. Thrilling, don't you think?");
  }
  if ($text=~/red/i) {
    quest::say("Red 5 is rumored to be a haywire clockwork. They say he pieced himself back together and lives in the scrapyard. If he IS there, you must hunt him down and take his blackbox to Manik Compolten. Be careful, if Red 5 rebuilt himself, he may have rebuilt minions as well.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18837 =>1)) {
    quest::say("Why, thank you. Hey!! This log indicates some messy business is going on at the scrapyard. Something happened to a group of gnomes. They never came out!! Go check out the scrapyard! I believe the rumors of [Red 5] are true.");
    quest::faction(115,2);
    quest::faction(210,2);
    quest::faction(176,2);
    quest::faction(71,-2);
    quest::faction(39,-2);
    quest::exp(2000);
    quest::ding();
  }
  elsif (plugin::check_handin(\%itemcount, 18838 => 1)) {
    quest::say("Why, thank you. Hey!! What's this? This log is showing that two obsolete duster models have escaped! Well they'll need to be taken care of right away. Go out and find models V and X and take care of them. Bring Sanfyrd Featherhead proof that you've destroyed them and he'll probably have a reward for you."); #text not live-like. Need original
    quest::faction(115,2);
    quest::faction(210,2);
    quest::faction(176,2);
    quest::faction(71,-2);
    quest::faction(39,-2);
    quest::exp(2000);
    quest::ding();
  }
  plugin::return_items(\%itemcount);
}