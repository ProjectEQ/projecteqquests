#Last part of Sir Arium's Bridal quest.

sub EVENT_SAY {
 if($text=~/Hail/i){
  quest::say("Welcome to the Lodge of the Dead. May you serve our Queen with the bleeding of others.");
 }
 if($text=~/befallen/i){
  quest::say("It is true that the return of Marnek could create difficulties for us, especially if this has the blessing of Solusek Ro himself. Therefore, I command you to deliver to me any further information you uncover regarding the plans of the Burning Dead, and likewise I order you to return here at my bidding for further instructions in this matter. Now, begone.");
 }
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount,18474 =>1)){
  quest::say("Very interesting, servant of the Queen. This deed has stayed my wrath for this interruption of my business. Where did you find this?");
  quest::faction(322,1);
  quest::faction(268,1);
  quest::faction(177,-3);
  quest::faction(170,-3);
  quest::faction(91,-3);
  quest::faction(260,-3);
  quest::exp(6400);
  quest::ding();
  quest::givecash(0,8,0,0);
 }
 if(plugin::check_handin(\%itemcount,31492 => 1)){
  quest::say("It is true that the return of Marnek could create difficulties for us, especially if this has the blessing of Solusek Ro himself. Therefore, I command you to deliver to me any further information you uncover regarding the plans of the Burning Dead, and likewise I order you to return here at my bidding for further instructions in this matter. Now, begone.");
  quest::summonitem(31496);
  quest::faction(322,1);
  quest::faction(268,1);
  quest::faction(177,-3);
  quest::faction(170,-3);
  quest::faction(91,-3);
  quest::faction(260,-3);
  quest::exp(6400);
  quest::ding();
 }
 if(plugin::check_handin(\%itemcount,18758 => 1)){
  quest::summonitem(13587);
  quest::faction(322,1);
  quest::faction(268,1);
  quest::faction(177,-3);
  quest::faction(170,-3);
  quest::faction(91,-3);
  quest::faction(260,-3); 
  quest::exp(100);
  quest::ding();
 }
}