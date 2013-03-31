#NPC: Byzar_Bloodforge  #Zone: kaladima
#modified by Qadar

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("State your business!!  I have no time for chitchat.  Well..  speak up. toad!!  What?!!..  Have you come here to [return goblin beads]?");
  }
  if($text=~/return goblin beads/i){
    quest::say("If you wish to return Runnyeye Warbeads you best have at least four of them.  Do not waste my time with any less.  If I am in a good mood I just may reward you with some trash, err..  I mean equipment from our armory.");
  }
  if(($text=~/Zachoomi/i) || ($text=~/Corflunk/i)){
    quest::say("Do not speak the names of Zarchoomi and Corflunk!!  I have heard enough of those ogres!!  I would pay greatly for their heads!!");
  }
  if($text=~/take a little trip/i){
    quest::say("Yes.  You will do.  My sister was once engaged to a fellow warrior.  He disgraced her and left her crying at the altar.  I will have his head for such a slap in the face of my family.  His name was Trumpy Irontoe, once a member of the now defunct Irontoe Brigade.  I know not where he went.  Find his whereabouts and return his head to me.  Do so, and I shall make you an honorary member of the Bloodforge Brigade.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13931 => 4)){
    quest::say("You finally have proven yourself a warrior, a slow one!!  Take this reward and ask for nothing else.  You should be proud to defend Kaladim and expect no reward.");
    quest::faction(314,15);   # StormGuard better
    quest::faction(169,15);   # KazonStormhammer better
    quest::faction(219,15);   # MinersGuild249 better
    quest::faction(215,15);   # MerchantsOfKaladim better
    quest::faction(57,-15);   # CraknekWarriors worse
    quest::exp(10000);
    quest::ding();
	quest::givecash(7,1,2,0);
    quest::summonitem(quest::ChooseRandom(2113,2114,2115,2117,2119,2121,2122));
  }
  elsif(plugin::check_handin(\%itemcount, 13741 => 1, 13740 => 1)){
    quest::say("I underestimated you.  You are truly a great warrior.  I reward you with a piece of my own Bloodforge armor.  You would be fine Bloodforge Brigade material!  How would you like to [take a little trip] in the name of the Bloodforge Brigade?");
    quest::faction(314,15);   # StormGuard better
    quest::faction(169,15);   # KazonStormhammer better
    quest::faction(219,15);   # MinersGuild249 better
    quest::faction(215,15);   # MerchantsOfKaladim better
    quest::faction(57,-15);   # CraknekWarriors worse
    quest::exp(10000);
    quest::ding;
    quest::summonitem(quest::ChooseRandom(3090,3090,3090,3090,3090,3090,3091,3092,3093,3094,3095,3096));  
  }
  elsif(plugin::check_handin(\%itemcount, 12136 => 1)){
    quest::say("Ha!! His death brings me great happiness.  I owe you much.  Take this hammer.  It is the hammer of the Bloodforge Brigade.  May it serve you well.  Now go,so I can enjoy this moment of happiness alone.");
    quest::faction(314,15);   # StormGuard better
    quest::faction(169,15);   # KazonStormhammer better
    quest::faction(219,15);   # MinersGuild249 better
    quest::faction(215,15);   # MerchantsOfKaladim better
    quest::faction(57,-15);   # CraknekWarriors worse
    quest::exp(10000);
    quest::ding;
    quest::summonitem(13314);
  }
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}