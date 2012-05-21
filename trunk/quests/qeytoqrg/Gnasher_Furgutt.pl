###################################################
# NPC: Gnasher_Furgutt.pl
# Part of the Gnashers Head quest And blackburrow stout quest
# Loot items: A Gnoll Head, identifies as Gnasher's Head (13309)
# A Note (18800)
# Zone: qeytoqrg
# By Andrew80k
# modified by Mitzrugi
##################################################

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Who are you? Did McNeal send you? If not, you would do yourself good to leave Gnasher alone. I have friends in high places.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18800 => 1)) {
    quest::say("Ah. Good for you! Here you are. Take this to McNeal, but next time there will be no stout if there are no weapons.");
    quest::summonitem(13131);
    quest::faction(33,5);
    quest::faction(217,-10);
    quest::faction(53,5);
    quest::faction(135,-10);
    quest::faction(164,5);
  }
  else {
    quest::say("I do not want this.");
    plugin::return_items(\%itemcount);
  }
}

