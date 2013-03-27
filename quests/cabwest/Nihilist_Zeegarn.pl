#Nihilist Zeegarn starts and ends The Penance quest. This allows a young iksar to replace their guild's starting item if they've lost it.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Mind yourself within Cabilis. We will not tolerate any mischief. If you don't heed my warnings, you may be sentenced to the pit of the Crusaders of Greenmist. You don't want that! Also, you should always wear your robe when entering these walls. You do have your Drape of the Brood, correct?");
  }
 elsif($text=~/yes/i){
  quest::say("Very good. Please keep it on and bow before the will of the Cazic-Thule when entering these walls. Be off.");
  }
 elsif($text=~/no/i){ #The Penance quest
  quest::say("What is this?' the Nihilist barks in disbelief. 'You have lost your drape? This is unacceptable! Take this note and report to the Toilmaster at once. Read it on the way and praise Cazic-Thule for any mercy that you may be granted!");
  quest::summonitem(18271);
  }
}

sub EVENT_ITEM {
 if(($itemcount{18272} == 1) && ($itemcount{24770} == 1)){ #The Penance quest
  quest::emote("takes the bag and tome from you and in return gives you the item that you have been thinking of all of this time.");
  quest::say("Lucky you. You have earned a second chance. Praise Cazic-Thule!");
  quest::summonitem(12407);
  quest::ding();
 }
  plugin::return_items(\%itemcount);
}

#Submitted by Jim Mills