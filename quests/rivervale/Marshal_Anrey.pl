#Quest: Leatherfoot Raiders
#Note: All text made up until someone can capture from live.

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Do I look like your best friend?!!  Well I'm not, bixie buster!!  You will address an officer with the word 'Hail' like every other deputy. Stand up straight, hunchback, or you'll be [patrolling] Rivervale till dawn!");
  }
  if($text=~/patrolling/i) {
    quest::say("That's right soldier! Until you [prove] yourself as a true Leatherfoot Raider, you will be stuck with the menial guard duty tasks.");
  }
  if($text=~/prove/i) {
    quest::say("So, you think you're up for a challenge? Alright then. To prove you are worthy of joining the Leatherfoot Squad, I need you to bring me a few things. Gather up a Polar Bear Skin, a Thick Grizzly Bear Skin, a Shark Skin, and an Alligator Skin. Do this and we can discuss your future.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13761 => 1, 13756 => 1, 13075 => 1, 13749 => 1)) { #Polar Bear Skin, Thick Grizzly Bear Skin, Shark Skin, Alligator Skin
    quest::say("Good work, $name. You passed the first test. If you think you are one of us, return this cap to me along with a dagger from a Dark Elf for your true reward.");
    quest::summonitem(13941); #Leatherfoot Skullcap
    quest::exp(1000);
    quest::givecash(8,1,0,0); #Copper x 8, Silver x 1
  }
  elsif(plugin::check_handin(\%itemcount, 13941 => 1, 13942 => 1)) { #Leatherfoot Skullcap, Dragoon Dirk
    quest::say("Wonderful, $name. You have proven yourself to the Leatherfoot Squad. Take this and wear it with honor.");
    quest::summonitem(12259); #Leatherfoot Raider Skullcap
    quest::exp(5000);
    quest::givecash(7,3,2,1); #Copper x 7, Silver x 3, Gold x 2, Platinum x 1
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:rivervale  ID:19059 -- Marshal_Anrey