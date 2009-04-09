sub EVENT_SAY {
  if ($faction == 1) { #Require Ally faction
    if ($text=~/hail/i) {
      quest::say("I am Vorken Iceshard, one of the lords of Iceshard manor. In this day and age you can never tell where one's allegiances are. Leave my servants in peace or you may leave in pieces.");
    }
    if ($text=~/allegiances/i) {
      quest::say("Loyalties, of course, little one. Each day I see more mercenaries come to Kael, seeking their fortunes. King Tormax will use your kind to wage war on the dragons and upon the Coldain. But I question the motives of your kind.");
    }
    if ($text=~/motives/i) {
      quest::say("My motives are simple. I will acquire as much power and prestige as possible before I die. Such is life for me, a constant search for power and wealth. But my great power and wealth have not brought me happiness. Enough of my motives, what drives you? A constant search for more power, a search for security and happiness? Or do you truly believe in the rhetoric of King Tormax which advocates that we eradicate the dragons?");
    }
    if ($text=~/power/i) {
      quest::say("I understand. You seek wealth and power. Believe me, young one, it will not bring you happiness. Each item you acquire will only quell your lust for more power for a short time. There is always something slightly better to gain. Would yet another useless possession really make you feel better? Let me tell you a little story.");
    }
    if ($text=~/story/i) {
      quest::say("Before I ascended to power here in Kael Drakkel, I lived as a nomad in the eastern wastes. My brother Klaggan and I did as we pleased, not abiding by the laws of the Kromrif leaders at the time. With each 'crime' we committed we drew the attention of Beleveios Thunderstone, the so called leader of the wandering giants at that time. His anger with us grew so much that he eventually came looking for us.");
    }
    if ($text=~/beleveios/i) {
      quest::say("Beleveios came seeking my brother and me to slay us and end the whining of the weaker giants. The day is still crisp in my mind. Four of his greatest champions fell upon my brother and me in our encampment, attempting to slay us in our sleep. We Iceshards are not so easy to slay, however. Klaggan awoke as they attempted to slit our throats and snapped the neck of one of our assailants. I leaped to my feet as well, and with my trusty axe I slashed at the knaves who had come to [murder] us.");
    }
    if ($text=~/murder/i) {
      quest::say("Yes, they tried to stop our actions without so much as a trial by honorable combat. My brother and I slaughtered Beleveios' most powerful guards as he watched. When the last one fell, I was covered in the blood of my foes, as was Klaggan. Beleveios stood there dumbfounded, before he dropped to his knees begging for our mercy and forgiveness. He prattled on about his [family], and wanting to protect his people. I would hear no more of this. His head lay on the ground not long after that.");
    }
    if ($text=~/family/i) {
      quest::say("I took little heed of Beleveios' ranting about his family at the time. I have not thought of it much until recently either. I have heard rumors that his son has been attempting to gain support from the other Kromrif. The whispers on the wind speak of my assassination by this fool who wants vengeance for a father who would murder men in their sleep. If you wish powerful possessions, then seek out the son of Beleveios Thunderstone and slay him. Bring me his head as proof and I will reward you with what you seek so avidly.");
    }
    if ($text=~/dragons/i) {
      quest::say("So your cause is to destroy the dragons as King Tormax says? If you wish to be noticed by King Tormax, you must do great deeds.");
    }
    if ($text=~/great deeds/i) {
      quest::say("If you expected to come to Kael Drakkel and immediately have an audience with the king, you are a bigger fool than most. Go out and slay the weaker members of dragonkind. That might gain his favor. If you do hunt the wurms and drakes, you may be able to please me as well.");
    }
    if ($text=~/please you/i) {
      quest::say("In my youth, I was bitten by a very intelligent wurm named Bllizent. My brother and I were foolish enough to try to slay the great beast. He tasted my flesh and the flesh of my brother that day and I fear he liked it too much. I have nightmares of this beast's return to taste me again. I would rest easier at night if I knew Bllizent was dead and gone. He will be quite an elderly wurm if he is still alive today.");
    }
  }
  else {
    quest::say("You must prove your dedication to Kael Drakkal and the Kromrif clan before I will speak to you.");
  }
}

sub EVENT_ITEM {
  if ($faction == 1) { #Require Ally faction

    if (plugin::check_handin(\%itemcount, 25117 => 1)) {
      quest::say("So, the beast was still alive! Now I may rest easier knowing my dreams are only dreams and not a prophecy of his return to finish me off. The king will surely hear of your deeds, $name. Take this belt as a token of my gratitude.");
      quest::summonitem(25049);
    }
    
    elsif (plugin::check_handin(\%itemcount, 25116 => 1)) {
      quest::say("Congratulations, mercenary. You have earned your precious reward. Tell me, did Ekelng whine like his father for forgiveness, or did he die like a true Kromrif warrior?");
      quest::summonitem(25048);
    }

    else {
      quest::say("I have no need of this, little one."); #text made up
      plugin::return_items(\%itemcount);
      return 1;
    }
    
    quest::faction(188,30);
    quest::faction(189,30);
    quest::faction(49,-30);
    quest::faction(42,-30);
    quest::exp(1000);

  }
}

# Quests by mystic414