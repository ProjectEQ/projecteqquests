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

my $Bakery;

sub EVENT_SPAWN {
  $Bakery = 0;
}

sub EVENT_SAY {
  if($Bakery == 0) {
    if($text=~/hail/i) {
      quest::say("Greetings! Please move along. I am not paid to converse with strangers... unless of course you have a muffin or two..?");
    }
    if($text=~/brownloe bakery/i) {
      quest::say("Oh, yes! That is close by. I am sure Lady Shae will be fine for just a minute. I will just run there and run back. Thanks, friend!");
      quest::start(85); Move towards Brownloe Bakery
      quest::settimer("Pandos", 5);
    }
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

sub EVENT_TIMER {
  if(($x == -693) && ($y == -279) && ($Bakery == 0)) {
    $Bakery = 1;
    quest::pause(60);
    quest::say("I sure could use some of those famous muffins you make!");
    quest::signalwith(9088, 1, 10);
  }
  if(($x == -446) && ($y == -226) && ($Bakery == 1)) {
    quest::stop();
    quest::stoptimer("Pandos");
    $Bakery = 0;
  }
}

sub EVENT_SIGNAL {
  if($signal == 1) {
    quest::say("Thank you very much! These look delicious. Well, I need to get back to duty. I'll be back tomorrow!");
    quest::signalwith(9088, 2, 10);
  }
  if($signal == 2) {
    quest::resume();
  }
}
#End of File, Zone:freportw  NPC:9057 -- Pandos_Flintside