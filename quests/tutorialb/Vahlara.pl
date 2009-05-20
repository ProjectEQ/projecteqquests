#BeginFile Vahlara.pl
#Quests for The Mines of Gloomingdeep - Vahlara: Gloomingdeep Silk Collecting
sub EVENT_SAY {
   if (quest::istaskactivityactive(17,3)){
      quest::say("Well done. The revolt's food supply is safe for the time being. Report back to the guards when you're rested.");
   }
      else {
        if ($amote==2) { #Emote spawnwer "Vast"
             quest::spawn2(189119,0,0,-126.0,-295.8,3.0,124.8);
      }
        if ($bmote==2) { #Emote spawner "Screams"
             quest::spawn2(189120,0,0,-385.2,-516.3,-39.3,135.1);
        }
        if ($text=~/hail/i) {
         quest::say("I'm glad you managed to escape the slave warrens in one piece. There are many [others] who were not as lucky. I have something that might save you from the same fate. Take this kobold charm. It will increase in power as you talk to the rest of the members of the revolt. May it bring you good luck, $name.");
         quest::summonitem(59943); #Kobold Skull Charm
      }
      if ($text=~/others/i) {
         quest::say("These few here. They were injured when the revolt broke out. I'm trying to help, but we have a short supply of [bandages], and more wounded keep coming. I fear many will not survive the hour.");
      }
      if ($text=~/bandages/i) {
         quest::say("I was a skilled tailor before I was enslaved, so I'm able to weave spider silk into makeshift gauzes and dressings. But now even the spiderling silk is running scarce. If you can find three pieces of spiderling silk, bring them to me unstacked, and I'll give you some armor I've crafted from burlap. Burlap's no good for bandages anyway.");
  }     
 }
}
      
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 54234 => 1)) { #Gloomingdeep Silk
    quest::say("You have proven most resourceful $name.");
quest::summonitem(ChooseRandom(54217,54218,54219,54220,54221,54222,54223,54224,54225,54226,54227,54228)); #Random Stitched Burlap item
  }

  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}