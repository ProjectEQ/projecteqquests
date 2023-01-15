# items: 17043, 18211, 17994, 12661, 12657, 12435, 12436, 12437, 5133, 12477, 12913, 18073
sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("What business do you have speaking to an Iksar Warlord? Be gone before you find yourself served as my evening meal. Go to Captain Nedar if you wish to assist my garrison. Fool.");
  }
  if ($text=~/trooper reporting for duty/i) {
    quest::say("It is about time they sent new troopers for my garrison!! This is the toughest garrison in Kunark!! And you're going to help prove it. The legion needs to get a hold of some new frog shields called Krup warrior guards. You're going to take this pack and fill it with not one, but four!! When you can return a full, combined pack to me, maybe you will show me that you're not as weak as you look!!");
    quest::summonitem(17043); # Item: Swamp Garrison Pack
  }
  
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18211 =>1 )) {
    quest::say("Ah!! Good to have you on board. We lack strong young recruits such as yourself. Take this bag. Your task is to seek escaped frogloks near this gate. Apparently, the slaves have been breaking loose from their shackles and attempting to head home. Fill and combine within the bag their broken shackles and return the filled box to me for your geozite tool.");  #not live text
    quest::summonitem(17994); # Item: Slave Shackle Bag
  }
  if (plugin::check_handin(\%itemcount, 12661 =>1 )) {
    quest::say("Great work!! You have kept the frogloks from returning home. I reward you with the geozite tool. You may find its purpose within Cabils' warriors guild. A true Iksar warrior should always have one."); #not live text
    quest::summonitem(12657); # Item: Geozite Tool
  }
  if (plugin::check_handin(\%itemcount, 12435 =>1, 12436 =>1, 12437 =>1, 5133 =>1 )) {
   quest::emote("hands you plans for a trooper's pike head.");
   quest::say("Congratulations. You are now a trooper of the Legion of Cabilis. Now you may fight with honor and a mighty weapon.");
   quest::summonitem(12477); # Item: Trooper Head Plans
   quest::faction( 440,2); # Faction: Cabilis Residents
   quest::faction( 441,2); # Faction: Legion of Cabilis
   quest::faction( 445,2); # Faction: Scaled Mystics
   quest::faction( 444,2); # Faction: Swift Tails
   quest::faction( 442,2); # Faction: Crusaders of Greenmist
   quest::exp(1200);
   quest::ding();
  }
  if (plugin::check_handin(\%itemcount, 12913 =>1 )) {
    quest::say("What?!! You crushed all the shields!! You croak-faced skulking brute!! You don't deserve to be in my garrison!! I am going to recommend you for a promotion in hopes that you will be sent to hunt dragons and meet your end!");
    quest::summonitem(18073); # Item: Legionnaire Recommendation
    quest::exp(2000);
    quest::ding();
    quest::faction( 440,2); # Faction: Cabilis Residents
   quest::faction( 441,2); # Faction: Legion of Cabilis
   quest::faction( 445,2); # Faction: Scaled Mystics
   quest::faction( 444,2); # Faction: Swift Tails
   quest::faction( 442,2); # Faction: Crusaders of Greenmist
      }
  plugin::return_items(\%itemcount);
}

#Scripted By: Fatty Beerbelly
#additional work by:  Jaekob
