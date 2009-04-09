#Crusader Zixo starts and ends The Penance quest. This allows a young iksar to replace their guild's starting item if they've lost it.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Do you come to me empty handed, knave? Did you lose your pike?");
  }
 elsif($text=~/no/i){
  quest::say("Ah... Yes... very good! Continue to work at this pace and the enemies of the Legion of Cabilis will fall beneath the blades of Cazic-Thule! Now move out... To Victory!"); #Could not find original text, modified SK version to fit.
  }
 elsif($text=~/yes/i){ #The Penance quest
  quest::emote("shakes his head and growls. 'That is not good, broodling... Not good at all. You will need to take this note and seek out the Toilmaster immediately. Read it on the way and hope that your incompetence can be overcome. The Crusaders of Greenmist have a pit for you, should this prove to be impossible."); #Could not find original text, modified SK version to fit.
  quest::summonitem(18271);
  }
}

sub EVENT_ITEM {
 if(($itemcount{18272} == 1) && ($itemcount{24770} == 1)){ #The Penance quest
  quest::emote("takes the bag and tome from you and in return gives you the item that you have been thinking of all of this time.");
  quest::say("Lucky you. You have earned a second chance. Praise Cazic-Thule!");
  quest::summonitem(5130);
  quest::ding();
 }
 else{ 
  plugin::return_items(\%itemcount);
  quest::say("This isn't what I asked for.");
 }
}

#Submitted by Jim Mills