sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("What business do you have speaking to an Iksar Warlord? Be gone before you find yourself served as my evening meal. Go to Captain Nedar if you wish to assist my garrison. Fool.");
  }
  if ($text=~/trooper reporting for duty/i) {
    quest::say("It is about time they sent new troopers for my garrison!! This is the toughest garrison in Kunark!! And you're going to help prove it. The legion needs to get a hold of some new frog shields called Krup warrior guards. You're going to take this pack and fill it with not one, but four!! When you can return a full, combined pack to me, maybe you will show me that you're not as weak as you look!!");
    quest::summonitem(17043);
  }
  
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18211 =>1 )) {
    quest::say("Ah!! Good to have you on board. We lack strong young recruits such as yourself. Take this bag. Your task is to seek escaped frogloks near this gate. Apparently, the slaves have been breaking loose from their shackles and attempting to head home. Fill and combine within the bag their broken shackles and return the filled box to me for your geozite tool.");  #not live text
    quest::summonitem(17994);
  }
  if (plugin::check_handin(\%itemcount, 12661 =>1 )) {
    quest::say("Great work!! You have kept the frogloks from returning home. I reward you with the geozite tool. You may find its purpose within Cabils' warriors guild. A true Iksar warrior should always have one."); #not live text
    quest::summonitem(12657);
  }
  if (plugin::check_handin(\%itemcount, 12435 =>1, 12436 =>1, 12437 =>1, 5133 =>1 )) {
   quest::emote("hands you plans for a trooper's pike head.");
   quest::say("Congratulations. You are now a trooper of the Legion of Cabilis. Now you may fight with honor and a mighty weapon.");
   quest::summonitem(12477); 
   quest::faction( 30,2);
   quest::faction( 193,2);
   quest::faction( 282,2);
   quest::faction( 317,2);
   quest::faction( 62,2);
   quest::exp(1200);
   quest::ding();
  }
  if (plugin::check_handin(\%itemcount, 12913 =>1 )) {
    quest::say("What?!! You crushed all the shields!! You croak-faced skulking brute!! You don't deserve to be in my garrison!! I am going to recommend you for a promotion in hopes that you will be sent to hunt dragons and meet your end!");
    quest::summonitem(18073);
    quest::exp(2000);
    quest::ding();
    quest::faction( 30,2);
   quest::faction( 193,2);
   quest::faction( 282,2);
   quest::faction( 317,2);
   quest::faction( 62,2);
      }
  plugin::return_items(\%itemcount);
}

#Scripted By: Fatty Beerbelly
#additional work by:  Jaekob