sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Hello. Nice day, isn't it? It would be nicer if I didnt have to spend it killing these disgusting rodents that have infested town. Hey, I have an idea! How about you go kill some of them for me and collect four of their whiskers? I will reward you, of course.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13071 => 4)){
    quest::say("Here are you coins as promised. Have a nice day. I wish I could.");
    quest::faction(212,5);
    quest::faction(8,5);
    quest::givecash(1,1,1,0);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

#Submitted by Senzo : PEQ Quest Team