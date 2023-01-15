# items: 29062, 29124, 29125
sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Hmm, the guards at the gate sent a $race to assist with the [rampant problems]? They shall have to be replaced with functional sentries so this does not occur again, but that is another matter for later.");
 }
 elsif($text=~/rampant problems/i){ #Start of: Helms of Giant Warriors
  quest::say("I trust that what is said here will not be repeated to outsiders, yes? Good. For some time now, we've been fortifying our position in the shrine to fend off giant attacks as they come. Though there hasn't been a major engagement between the shrine and the giants for quite some time, there have been strafing runs done by them in an attempt to test us. If you're up for it, I have a [mission] I need someone new to the shrine to complete.");
 }
 elsif($text=~/mission/i){ #Part of: Helms of Giant Warriors
  quest::say("We've been looking for someone that isn't from the shrine to find some of the giants that have been on these strafing runs and have them eliminated. You're of the perfect ilk because they will not recognize you as a friend to the shrine. Once you pry their steel-plated helms from their cold, dead heads and bring them back to me, your worth will be proven and you may show promise as an ally to the shrine.");
 }
 elsif($text=~/assignment/i){ #Start of: Strike Home Toe The Giants
  quest::say("While the helmets of the giants are a good way to prove your worth, it really strikes home to the giants when they see some of their best warriors dead without their toes. If you can bring me back either Storm Giant toes or Frost Giant toes, you will not only show us that you are a friend to the shrine, but also that the giants are not as indestructible as they would have you believe.");
 }
}

sub EVENT_ITEM {
 #Handin: Giant Warrior Helmet (29062)
 if(plugin::check_handin(\%itemcount, 29062 => 1)){ #End of: Helms of Giant Warriors
  quest::say("Well done, $name. You are proving to be worth the risk of sending a new recruit out on a mission such as this. If you feel this is the type of mission you're best suited for, feel free to slay more of these beasts and return their helmets to me. The fewer giants there are out there, the less chance they continue their random attacks against us. I also may have another [assignment] for you if you're interested.");
  quest::faction(430,15); # +Claws of Veeshan
  quest::faction(436,3); # +Yelinak
  quest::faction(448,-7); # -Kromzek
  quest::exp(10000);
 }
 #Handin: Storm Giant Toes (29124)
 elsif(plugin::check_handin(\%itemcount, 29124 => 1)){ #End of: Strike Home Toe The Giants (Storm)
  quest::emote("chuckles as he looks at the toes of the giants.");
  quest::say("You have indeed proven yourself to me, and in doing so to the shrine. Keep it up and you'll be on your way to becoming a great ally to the shrine. We appreciate your efforts in this matter greatly, and if you choose to continue your endeavors in this matter, we won't hold it against you.");
  quest::emote("gives you a sly grin before going back to his work.");
  quest::faction(430,7); # +Claws of Veeshan
  quest::faction(436,1); # +Yelinak
  quest::faction(448,-3); # -Kromzek
  quest::givecash(14,10,14,4);
  quest::exp(10000);
 }
 #Handin: Frost Giant Toes (29125)
 elsif(plugin::check_handin(\%itemcount, 29125 => 1)){ #End of: Strike Home Toe The Giants (Frost)
  quest::emote("chuckles as he looks at the toes of the giants.");
  quest::say("You have indeed proven yourself to me, and in doing so to the shrine. Keep it up and you'll be on your way to becoming a great ally to the shrine. We appreciate your efforts in this matter greatly, and if you choose to continue your endeavors in this matter, we won't hold it against you.");
  quest::emote("gives you a sly grin before going back to his work.");
  quest::faction(430,7); # +Claws of Veeshan
  quest::faction(436,1); # +Yelinak
  quest::faction(448,-3); # -Kromzek
  quest::givecash(14,10,14,4);
  quest::exp(5000);
 }
  plugin::return_items(\%itemcount);
}


#Scripted By: Fatty Beerbelly
