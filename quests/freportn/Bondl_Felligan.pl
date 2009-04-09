sub EVENT_SAY {
 if($text=~/hail/i){ #Part of Shaman Epic 1.0
  quest::emote("burps loudly in your face and says, 'Bah! Leave me be, fool! You have nothin' I want and I certainly have nothin' you want.");
  }
 elsif($text=~/you can buy booze/i){ #Part of Shaman Epic 1.0
  quest::emote("suddenly becomes completely sober and says, 'Very well, shaman, please come with me.'");
  quest::start(13);
 }
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 1665 => 1)) { #Part of Shaman Epic 1.0
  quest::say("WOW, thanks! This must be worth a fortune! I could drink for a month after sellin' this to one of them fool merchants. I'm going to see how much I can get for it right now!");
  quest::faction(342,100);
  quest::exp(1000);
  quest::spawn2(8117,0,0,62,66,32.1,254);
  quest::spawn2(8118,0,0,67,103,32.1,508);
  quest::say("What!? You don't approve of me buyin' some drinks with this gem? Who the heck are you to offer me a gift and order me what to do with it? Is this some kinda conditional kindness? Well? Are you gonna let me buy some booze with this or not?");
 }
}

#Submitted by: Jim Mills