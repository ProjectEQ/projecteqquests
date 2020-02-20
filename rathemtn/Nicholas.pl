##############################################################
# NPC:  Nicholas
# Zone:  Rathe Mountains
# Quest:  Boots of Ro
##############################################################
sub EVENT_SAY { 
    if($text=~/Hail/i)
        {
        quest::say("Greetings, friend.  I am the keeper of the [Boots of Ro].  Please rest here with us in our camp of righteousness.  No harm can come to you while we paladins keep watch.");
        }
    elsif ($faction > 5)
        {
        quest::say("How dare you approach a member of the Clerics of Underfoot?!  Dogs such as you lie in the same bed as aviaks and ogres!");
        }
    elsif ($faction == 5)
        {
        quest::say("You and I must be brothers and serve the Lord of Underfoot.  Go to Kaladim and serve her cathedral.  When you think you are ready. then ask Lord Datur if you are an [honored member] of the temple.  If the answer is yes.  then I will trust you.");
        }
    else
        {  # amiable or better to get the quest
        quest::say("If you desire the mold needed for smithing the Boots of Ro, then first, you shall prove your power.  I have long sought an ancient holy weapon called the brazen brass kilij.  I have heard rumors of detailed plans on how to make it, coming from Faydwer.  Seek out the kilij plans.  Bring them to me and you shall have the mold.");
        }
}
sub EVENT_ITEM {
  if (($faction <= 4) && (plugin::check_handin(\%itemcount,12206=>1))) { # Kilij Plans
    quest::say("Ahh!!  The kilij!!  The legend was true.  As for you..  the mold for the Boots of Ro.  Go and speak with Thomas for the final component.  Ask him of [Lord Searfire].  Brell be with you.");
    quest::summonitem(12304);  # Mold of the Boots of Ro
    quest::faction(227,20); # Clerics of Underfoot
    quest::faction(274,20); #Kazon Stormhammer
    quest::faction(293,15); #Miner's guild 249
    quest::exp(100000);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:rathemtn  ID:50110 -- Nicholas
