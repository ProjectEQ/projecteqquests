sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, small one! You should not waste your time in the safety of the troopers' patrols. Go forth into the land and earn your stripes in battle. Become a greater asset to the Iksar empire.");
  }
 if ($text=~/thieves/i) {
    quest::say("Never mind how the book was taken, just go find the goblin thieves that did the deed.");   #not live text
  }
  if ($text=~/trooper reporting for duty/i) {
    quest::say("Welcome to my garrison, Trooper $name. Lucky for you that you do not serve the inferior swamp garrison. They lose more troopers than any legion unit. You have come just in time. We need you to take this pack and fill it with goblin warlord warbeads. Combine the beads in the pack and return it to me.");
    quest::summonitem(17042);
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18210 =>1 )) {
    quest::say("I am glad to see they have sent a strong new recruit. I have a task for you which will require you to recover a few pages of a certain poem I once wrote. I never should have written of such weak-minded things, but the pages were stolen from me before I could destroy them. Take this poem binder and find the [thieves]. When you combine the pages in the binder, it will magically lock and you may return it to me for your prize, the geozite tool.");
    quest::summonitem(17995);
  }
  if (plugin::check_handin(\%itemcount, 12667 =>1 )) {
    quest::say("Great work!! You have saved me from disgrace. I reward you with the geozite tool. You may find its purpose within Cabils' warriors guild. A true Iksar warrior should always have one.");
    quest::summonitem(12657);
    quest::exp(1000);
   quest::faction( 30,2);
   quest::faction( 193,2);
   quest::faction( 282,2);
   quest::faction( 317,2);
   quest::faction( 62,2);
   quest::givecash(0,0,1,0);
   quest::ding();
  }
  if (plugin::check_handin(\%itemcount, 12912 =>1 )) {
    quest::say("Great job, Trooper $name. Such a warrior would serve the empire better as a legionnaire and not a trooper. I shall recommend you for the rank of legionnaire.");
    quest::summonitem(18072);
    quest::ding();
    quest::exp(2000);
    quest::faction( 30,2);
   quest::faction( 193,2);
   quest::faction( 282,2);
   quest::faction( 317,2);
   quest::faction( 62,2);    
  }
  plugin::return_items(\%itemcount);
}