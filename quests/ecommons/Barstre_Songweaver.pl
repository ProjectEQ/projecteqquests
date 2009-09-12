#
#Quest: Adventurer's Stone
#
#Selephra Giztral, Barstre Songweaver, Vual Stoutest, Teria Grinntli, or Ruanya Windleaf

sub EVENT_SAY {
  if($ulevel >= 15) {
    if(defined($qglobals{Wayfarer}) && ($qglobals{Wayfarer} == 1)) { #PC has spoken to home town Wayfarer recruiter but not received Adventurer's Stone
      if($text=~/hail/i) {
        quest::say("Welcome stranger. I'm afraid you must answer some questions before I can consider opening our wealth of skill and knowledge to you. First, what does the Wayfarers Brotherhood call the tasks they will ask you to do for them?");
      }
      if($text=~/adventures/i) {
        $client->Message(15, "You have completed a step toward becoming a great adventurer. Well done!");
        quest::say("We will reward based on your improving position with the Wayfarers Brotherhood. We keep a certain type of log that records how often and well you help us. What is it called?");
      }
      if($text=~/favor journal/i) {
        $client->Message(15, "You have completed a step toward becoming a great adventurer. Well done!");
        quest::say("Who discovered that some treasures have strange magical properties by poking one with his dagger?");
      }
      if($text=~/morden rasp/i) {
        $client->Message(15, "You have completed a step toward becoming a great adventurer. Well done!");
        quest::say("Our brilliant magi use a special kind of magic to help teleport us between camps. What is it called?");
      }
      if($text=~/farstone/i) {
        $client->Message(15, "You have completed a step toward becoming a great adventurer. Well done!");
        quest::say("Congratulations! I believe now that you are trustworthy enough to take on some of the adventures the Wayfarers Brotherhood have to give. We will be able to continue with our discussions once you complete some adventures. We can also help you with travel between our camps. Be well, fair $name. I'm sure, someday, you will be a great addition to the Wayfarers Brotherhood.");
        quest::faction(356,50); #Wayfarers Brotherhood
        quest::setglobal("Wayfarer",2,5,"F");
        quest::say("Take this Adventurer Stone with you on your journeys into the dungeons. You will find it useful. Should you lose it somehow, come talk to me and I'll replace it.");
        quest::summonitem(41000); #Adventurer's Stone
      }
    }
    elsif(defined($qglobals{Wayfarer}) && ($qglobals{Wayfarer} == 2)) { #PC is ready for Adventurer's Stone
      if(!plugin::check_hasitem($client,41000)) { #PC does not have an Adventurer's Stone
        quest::say("Take this Adventurer Stone with you on your journeys into the dungeons. You will find it useful. Should you lose it somehow, come talk to me and I'll replace it.");
        quest::summonitem(41000); #Adventurer's Stone
      }
      else {
#
# Begin RUJ wins check
#
#      if($ruj_wins < 2) {
        quest::say("Greetings, $name. I always have a story to tell, but I've been consumed with learning about the Rujarkian Hills. If you do enough work for us in those hills, I can share some of my knowledge with you!");
#      }
#      elsif($ruj_wins >= 74) {
#        quest::say("Have you had your fill of story yet $name? You have spent a lot of time learning about the Rujarkian Hills. And, I can tell by the look in your eye that you know just as much as anyone about the orcs and goblins in those hills. I consider you a master of the story here as much as anyone. I have nothing to tell you, but you can stand by as I sing if you like. Be well, $name. I consider you a great adventurer and good friend. I'd fight with you by my side any day.");
#      }
#      elsif(player_has_maxed_out_stone) { #PC has maxed out stone
#        $client->Message(9, "It's time to acknowledge you as a Wayfarer. Give Chaenz Abella in East Commonlands your Adventurer Stone and he'll replace it with your very own Wayfarers Emblem. Or, if it's being used in a charm, you must remove it to get your new one. And, if you simply destroy the stone, he will replace it with your much-deserved emblem. Just tell him you want your [emblem].");
#        quest::setglobal("Wayfarer",3,5,"F");
#      }
      }
    }
    else { #PC has not talked to hometown Wayfarer recruiter yet
      quest::say("You will have to excuse me, I am quite busy. Maybe you can talk to a Wayfarer in your home town?"); #Text made up
    }
  }
  else {
    quest::say("You will have to excuse me, I am quite busy."); #Text made up
  }
}

sub EVENT_ITEM {
  quest::say("I have no use for this, $name.");
  plugin::return_items(\%itemcount);
}