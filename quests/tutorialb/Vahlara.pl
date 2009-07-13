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
   elsif ($text=~/hail/i && quest::istaskactivityactive(22,2)){
      quest::say("I'm glad you managed to escape the slave warrens in one piece. There are many [others] who were not as lucky. Here, take this burlap armor. It's not much, but it should keep you safe");
      quest::summonitem(54224);
      quest::updatetaskactivity(22,2);
   }
   #elsif ($text=~/hail/i && quest::istaskactivityactive(22,7)) {
   #      quest::say("I'm glad you managed to escape the slave warrens in one piece. There are many [others] who were not as lucky. I have something that might save you from the same fate. Take this kobold charm. It will increase in power as you talk to the rest of the members of the revolt. May it bring you good luck, $name.");
   #      quest::updatetaskactivity(22,7);
   #   }
   elsif ($text=~/hail/i){
      quest::say("I'm glad you managed to escape the slave warrens in one piece. There are many [others] who were not as lucky.");
   }
   elsif ($text=~/others/i) {
      quest::say("These few here. They were injured when the revolt broke out. I'm trying to help, but we have a short supply of [bandages], and more wounded keep coming. I fear many will not survive the hour.");
      }
   elsif ($text=~/bandages/i) {
      quest::say("I was a skilled tailor before I was enslaved, so I'm able to weave spider silk into makeshift gauzes and dressings. But now even the spiderling silk is running scarce. If you can find three pieces of spiderling silk, bring them to me unstacked, and I'll give you some armor I've crafted from burlap. Burlap's no good for bandages anyway.");
  }     
   
 }
}
      
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 54234 => 1) || plugin::check_handin(\%itemcount, 54234 => 3)) { #Gloomingdeep Silk x 1 or 3
    quest::say("You have proven most resourceful $name.");
    quest::summonitem(quest::ChooseRandom(54217,54218,54219,54220,54221,54222,54223,54224,54225,54226,54227,54228)); #Random Stitched Burlap item
  }

if (plugin::check_handin(\%itemcount, 86010 => 4)) {
      if (quest::istaskactivityactive(28,1)) {
         quest::emote("bows as you return. 'Just in time. Many are wounded and more arrive by the hour. If you can find any Gloomingdeep silk, bring it to me and I can reward you with more burlap clothing. It's not much, but it's nicer than the rags these kobolds left us with.'");
         # Minor rearranging to make it work with how emote() formats the message.
      }
    }
      else { 
      plugin::return_items(\%itemcount); 
 }
   } 