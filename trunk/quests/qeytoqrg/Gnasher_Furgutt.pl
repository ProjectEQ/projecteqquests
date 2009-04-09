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
if($text =~ /hail/i ){
    quest::say("Who are you? Did McNeal send you? If not, you would do yourself good to leave Gnasher alone. I have friends in high places.");
  }
}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount,18800 => 1)){
quest::say("Ah. Good for you! Here you are. Take this to McNeal, but next time there will be no stout if there are no weapons.");
quest::summonitem("13131");
quest::faction(33,5);
quest::faction(217,-10);
quest::faction(53,5);
quest::faction(135,-10);
quest::faction(164,5);
}
else {
    plugin::return_items(\%itemcount);
 }
}
sub EVENT_AGGRO {
    quest::say("Grrrrr!! You'd best run! If Gnasher dies, more than Sabertooths will be after you.");
}

sub EVENT_DEATH {
    quest::say("Uuungghh!! You fool. Gnasher have human friends. They not be happy.. Bash you!!");
}