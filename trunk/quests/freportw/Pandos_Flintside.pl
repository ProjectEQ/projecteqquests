############################################
# ZONE: West Freeport (freportw)
# DATABASE: Latest
# LAST EDIT DATE: 09-17-06
# VERSION: 2.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Pandos_Flintside
# ID: 9057
# TYPE: Warrior
# RACE: Dwarf
# LEVEL: 28
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Muffin ID-13014
#
# *** QUESTS INVOLVED IN ***
#
#1 - Muffin Man
#
# *** QUESTS AVAILABLE TO ***
#
#1 - All
#
############################################

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings! Please move along. I am not paid to converse with strangers... unless of course you have a muffin or two..?");
  }
  if($text=~/brownloe bakery/i) {
    quest::say("Oh, yes! That is close by. I am sure Lady Shae will be fine for just a minute. I will just run there and run back. Thanks, friend!");
  }
}

sub EVENT_ITEM {
  my $muffins = 0;

  if(plugin::check_handin(\%itemcount,13014=>4)) {
    $muffins = 4;
  }
  elsif(plugin::check_handin(\%itemcount,13014=>3)) {
    $muffins = 3;
  }
  elsif(plugin::check_handin(\%itemcount,13014=>2)) {
    $muffins = 2;
  }
  elsif(plugin::check_handin(\%itemcount,13014=>1)) {
    $muffins = 1;
  }
  else {
    quest::say("I do not want this.");
    plugin::return_items(\%itemcount);
  }
  if ($muffins >= 1) {
    for ($i=0; $i<$muffins; $i++) {
      quest::say("Mmmm. This smells delicious. Oh great!! No milk!! Don't you have any sense?! Just tell me the name of the bakery and I will run and get it myself. I am sure Lady Shae will be safe.");
      quest::ding();
      quest::exp(10);
      quest::faction(43,5);   #Clerics of Tunare
      quest::faction(99,5);   #Faydark's Champions
      quest::faction(178,5);  #King Tearis Thex
      quest::faction(304,5);  #Soldiers of Tunare
      quest::faction(63,-10); #Crushbone Orcs
    }
  }
}
#End of File, Zone:freportw  NPC:9057 -- Pandos_Flintside