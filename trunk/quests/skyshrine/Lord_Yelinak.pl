sub EVENT_SAY {
  if ($faction <= 3) { # Require kindly faction
    if($text=~/hail/i){
      quest::say("Welcome, young mortal. Word of your deeds has preceded your arrival. Your intentions seem honorable, young one, however my trust is not an easy thing to win these days. Like you, there has been another that came before me with the trust of the dragon kin, and trust them too I did, but alas that proved to be destructive. I note your deeds to this shrine young one, but should you wish my counsel, you must prove your worth beyond doubt. Perhaps a small challenge shall be of interest to you?");
    }
    elsif($text=~/i wish to prove my worth/i){
      quest::say("Then as agreed, young mortal, I will grant you one chance to prove your worth in my eyes. The Storm King Tormax sits on a throne carved from the skull of one of our fallen within the city of Kael, which disgraces the mighty children of Veeshan. His life alone is a blight upon the children of Veeshan. Should you be a true patriot to our cause, I seek of you but one task. Should you succeed in this task, not only will your actions offset the balance of this war in our favor, but will surely take a step in driving the vileness of the giants from our noble lands. Bring me, young one, the head of Tormax, and then we shall speak further.");
    }
    elsif($text=~/treasure/i){
      quest::say("This sword is a symbol of our evolution and ancient heritage. Back when our feathered relatives were not so distant, a sword was forged and enchanted with the spirit of an elder griffin. This noble griffin bound his soul to the sword, the essence of his being honing the blade to an edge imperceptible to mortal eyes. Although our races have evolved away from each other, we still hold them in high regard. But if you think you are not worthy to wield this honor, return the sword to me and I have other tokens you may find of more use.");
    }
  }
  else {
    quest::say("You have yet to prove your loyalty to me, $race.  Return to me when you have done so."); # Text made up
  }
}

sub EVENT_ITEM {
  if ($faction <= 3) { # require kindly faction
    if(plugin::check_handin(\%itemcount, 30516 => 1)){
      quest::emote("watches as you drop the colossal head of King Tormax to the ground before him. You sense intense hatred within Yelinak as he stares down at the bloody remains of a descendent of the one who slew his mate. Obviously the death of Tormax has done little to console the ancient snow dragon. Finally Yelinak speaks,");
      quest::say("I look upon this face, and even though he is dead, the hatred burns on. My grief and anger are unchanged even in the face of ultimate fate. His grandfathers act was so despicable and all-encompassing that it instilled an... immortal loathing. Nevertheless, you have completed the task I set before you and, as such, you deserve my gratitude. Please accept this [treasure].");
      quest::summonitem(29647);
    }
    elsif(plugin::check_handin(\%itemcount, 29647 => 1)){
      quest::say("I lost the scales that made these boots in a battle with Tormaxs minions. The casters of the shrine gathered these fallen scales up and fashioned a very powerful enchantment into these boots.");
      quest::summonitem(29645);
    } 
    elsif(plugin::check_handin(\%itemcount, 29645 => 1)){
      quest::say("This helm was created by our smiths and enchanted by the priests of the shrine to provide protection to our new allies who have found that their heads are much more fragile than those of our kin.");
      quest::summonitem(29648);
    } 
    elsif(plugin::check_handin(\%itemcount, 29648 => 1)){
      quest::say("This sword is a symbol of our evolution and ancient heritage. Back when our feathered relatives were not so distant, a sword was forged and enchanted with the spirit of an elder griffin. This noble griffin bound his soul to the sword, the essence of his being honing the blade to an edge imperceptible to mortal eyes. Although our races have evolved away from each other, we still hold them in high regard. But if you think you are not worthy to wield this honor, return the sword to me and I have other tokens you may find of more use.");
      quest::summonitem(29647);
    } 
    else {
      quest::say("I do not need this little one.");
      plugin::return_items(\%itemcount);
    }
  }
  else {
    quest::say("I do not know you well enough to trust you with such an item, yet.");
    plugin::return_items(\%itemcount);
  }
}


#Zone : skyshrine : NPC_ID : 114106 : Lord Yelinak