##############################################################
# NPC:  Nicholas
# Zone:  Rathe Mountains
# Quest:  Boots of Ro
##############################################################
sub EVENT_SAY { 
  if ($text=~/boots of ro/i) {
    if ($faction <= 4) {  # amiable or better to get the quest
      quest::say("If you desire the mold needed for smithing the Boots of Ro, then first, you shall prove your power. I have long sought an ancient holy weapon called the brazen brass kilij. I have heard rumors of detailed plans on how to make it, coming from Faydwer. Seek out the kilij plans. Bring them to me and you shall have the mold.");
    } else {
      quest::say("You and I must be brothers and serve the Lord of Underfoot. Go to Kaladim and serve her cathedral. When you think you are ready. then ask Lord Datur if you are an [honored member] of the temple. If the answer is yes, then I will trust you.");
    }
  } elsif ($text=~/chalice of conquest/i) {
    if ($faction > 4) {
      quest::say("How dare you approach a member of the Clerics of Underfoot?! Dogs such as you lie in the same bed as aviaks and ogres!!");
    } else {
      quest::say("You must be the one Sir Dru of Kaladim sent to retrieve the candlestick which was broken in the [orc onslaught]. I have only this piece in my possession as the other portion was taken by an [odd druid] of these mountains. Should you reclaim it, I am sure the maker of the candlestick can patch it together.");
      quest::summonitem(12276);
    }
  } elsif ($text=~/candle of bravery/i) {
    if ($faction > 4) {
      quest::say("How dare you approach a member of the Clerics of Underfoot?! Dogs such as you lie in the same bed as aviaks and ogres!!");
    } else {
      quest::say("You must be the one Sir Dru of Kaladim sent to retrieve the candlestick which was broken in the [orc onslaught]. I have only this piece in my possession as the other portion was taken by an [odd druid] of these mountains. Should you reclaim it, I am sure the maker of the candlestick can patch it together.");
      quest::summonitem(12276);
    }
  } elsif ($text=~/orc onslaught/i) {
    quest::say("The orcs attempted to take the hill, as they do on a frequent basis. We repelled them, of course, but a [blue orc] rushed off with the [Chalice of Conquest]. Where he came from, I do not know. He was no part of the battle!! I believe he just found an opportune moment to loot our camp.");
  } elsif ($text=~/blue orc/i) {
     quest::say("I had a visiting ranger track him to his camp near Lake Rathetear. I spied the camp and saw his lifeless body near two other blue orcs. Apparently, he must have taken a fatal blow, but had enough stamina to make it to his camp. I returned the following day with my fellow paladins and found the camp long gone. The ranger, who was still with us, found two sets of tracks leading away. We found [orc remnants].");
  } elsif ($text=~/orc remnants/i) {
    if ($faction > 4) {
      quest::say("How dare you approach a member of the Clerics of Underfoot?! Dogs such as you lie in the same bed as aviaks and ogres!!");
    } else {
      quest::say("Here. We found this worthless orc bracelet with the name Klunga on it. There was also an orc shovel and a bag of Cauldron prawns. We left them, of course. The camp has now been taken over by the green-skinned orcs. I would advise you to stay clear of this camp in Lake Rathe.");
      quest::summonitem(12280);
    }
  } elsif ($text=~/odd druid/i) {
    quest::say("The mountains have been plagued not only by beasts, but by evil druids!! They attempt to force all men from this land. One has stolen the foot of the candlestick which holds the [Candle of Bravery]. I remember that battle cry of hers, 'Long live the green!!'.");
  }
}
sub EVENT_ITEM {
  if (($faction <= 4) && (plugin::check_handin(\%itemcount,12206=>1))) { # Kilij Plans
    quest::say("Ahh!!  The kilij!!  The legend was true.  As for you..  the mold for the Boots of Ro.  Go and speak with Thomas for the final component.  Ask him of [Lord Searfire].  Brell be with you.");
    quest::summonitem(12304);  # Mold of the Boots of Ro
    quest::faction(44,2); # Clerics of Underfoot
    quest::faction(169,2); #Kazon Stormhammer
    quest::faction(219,2); #Miner's guild 249
    quest::exp(100000);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:rathemtn  ID:50110 -- Nicholas