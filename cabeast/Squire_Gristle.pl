#Squire Gristle starts and ends The Penance quest. This allows a young iksar to replace their guild's starting item if they've lost it.
# items: 18271, 18272, 24770, 5120

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Hail Broodling! When you walk the halls of this tower, you should always display the status that you have earned within our ranks. It brings me pride to see the might of the brood displayed by one such as you while I reflect here in the tower. Do you have the tool of your caste with you at this time?");
  }
 elsif($text=~/yes/i){
  quest::say("Ah... Yes... very good! Continue to work at this pace and the enemies of the Greenmist will fall beneath the blades of Cazic-Thule! Now move out... To Victory!");
  }
 elsif($text=~/no/i){ #The Penance quest
  quest::emote("shakes his head and growls. 'That is not good, broodling... Not good at all. You will need to take this note and seek out the Toilmaster immediately. Read it on the way and hope that your incompetence can be overcome. We do have a pit for you, should this prove to be impossible.");
  quest::summonitem(18271); # Item: Ragged Book
  }
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 18272 => 1, 24770 => 1)){ #The Penance quest
  quest::emote("takes the bag and tome from you and in return gives you the item that you have been thinking of all of this time.");
  quest::say("Lucky you. You have earned a second chance. Praise Cazic-Thule!");
  quest::summonitem(5120); # Item: Pawn's Khukri
  quest::ding();
 }
  plugin::return_items(\%itemcount);
}

#Submitted by Jim Mills