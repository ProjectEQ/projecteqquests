#BeginFile: jaggedpine\#Sergeant_Caelin.pl
#
#Quest: Gnoll Canines (Complete)
#Quest: Qeynos Badge of Nobility (Badge #5) (Incomplete)
#

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail, $name. You have nothing to fear from the gnolls. My men and I have been sent from Qeynos to help defend Fort Jaggedpine should those worthless curs make the mistake of assuming this will be a place of easy plunder. I've fought and slain scores of gnolls in my time. Were I not bound to my post here I would go forth and drive them from their dark cave to the north myself. However, I can offer you a [bounty], should you choose to take such a mission upon yourself.");
  }
  if($text=~/bounty/i) {
    quest::say("If you choose to go and fight against the gnolls, I shall offer a bounty for every gnoll canine that you return to me. You look a bit more adventurous then many of those that live in this settlement. They seem a bit [docile].");
  }
  if($text=~/docile/i) {
    quest::say("Perhaps it comes from living in harmony with nature for an extended period of time but they are more concerned with trading food recipes and doing arts and crafts. I have offered to give them some basic training in the arts of war but they seem to have no interest. This is a dangerous world in which we live and failure to acknowledge that has meant the downfall of many a society. I won't let this happen on my watch, provided my [men] are on their toes.");
  }
  if($text=~/men/i) {
    quest::say("Guard Bossamir is a model soldier and a good man. I'm happy to have him watching my back. That Finewine character however, he is not worth the cost of the sword he wields! All he does is whine and complain. He was born with a silver spoon in his mouth and his family enrolled him in the guard to teach him some discipline but I've had no luck with him. He hasn't even turned in a [shift report] for weeks. Captain Tillin will bust me down to private if I don't deliver those soon.");
  }
  if($text=~/shift report/i) {
    if($faction <=3) {
      quest::say("You have been helpful in our defense efforts. However, I can not be too careful about whom I trust with carrying this information. If you truly consider yourself an ally to Qeynos then no doubt you have assisted the city in its defense before. Show me your Qeynos Badge of Honor and I'll know I can trust you fully. I'll place my mark upon it should anyone question your authority to do this service for me.");
    }
    else {
      quest::say("I am sorry, $name. You have not yet proved yourself worthy to our cause.");
    }
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 8264 => 4)) { #Gnoll Canine x 4
    quest::faction(135,20); #Guards of Qeynos
    quest::faction(159,20); #Jaggedpine Treefolk
    quest::faction(265,20); #Protectors of Pine
    quest::faction(271,20); #Residents of Jaggedpine
  }
  elsif(plugin::check_handin(\%itemcount, 8264 => 3)) { #Gnoll Canine x 3
    quest::faction(135,15); #Guards of Qeynos
    quest::faction(159,15); #Jaggedpine Treefolk
    quest::faction(265,15); #Protectors of Pine
    quest::faction(271,15); #Residents of Jaggedpine
  }
  elsif(plugin::check_handin(\%itemcount, 8264 => 2)) { #Gnoll Canine x 2
    quest::faction(135,10); #Guards of Qeynos
    quest::faction(159,10); #Jaggedpine Treefolk
    quest::faction(265,10); #Protectors of Pine
    quest::faction(271,10); #Residents of Jaggedpine
  }
  elsif(plugin::check_handin(\%itemcount, 8264 => 1)) { #Gnoll Canine
    quest::faction(135,5); #Guards of Qeynos
    quest::faction(159,5); #Jaggedpine Treefolk
    quest::faction(265,5); #Protectors of Pine
    quest::faction(271,5); #Residents of Jaggedpine
  }
  elsif(plugin::check_handin(\%itemcount, 2388 => 1)) { #Qeynos Badge of Honor
    quest::emote("takes your badge and places his mark upon it.");
    quest::say("I see that I can fully trust you. Here is your badge back.");
    quest::summonitem(8285); #Marked Qeynos Badge of Honor
    quest::say("Take this note to Guard Finewine. He is officially on notice...");
    quest::summonitem(8283); #Official Warning
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:jaggedpine  ID:Not_Found -- #Sergeant_Caelin