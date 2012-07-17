# Bloody Shak Dratha Hearts
#

my $count = 0;

sub EVENT_SPAWN {
  quest::settimer("koldar",150);
}

sub EVENT_TIMER {
  $count++;
  if ($count == 1) {
    quest::say("There are many things you can do for Shar Vahl. Do not sit on your arse expecting our city to progress without your aid. It is your duty and your honor to defend our king.");
  }
  if ($count == 2) {
    quest::say("We cannot afford to let those vile creatures take our city.");
  }
  if ($count == 3) {
    quest::say("I want every one of you to bring at least four of their bloody hearts to me every day.");
  }
  if ($count == 4) {
    quest::say("We have a responsibility to protect this city. We cannot afford to wait for them to understand that we are not their enemy.");
  }
  if ($count == 5) {
    quest::say("If you see someone in battle, you must ask them before assisting. Do not dishonor them by taking their right to die in a fair and honorable battle.");
  }
  if ($count == 6) {
    quest::say("You there! Is that rust I see on your spear? You must find a blacksmith to repair it immediately.");
  }
  if ($count == 7) {
    quest::say("Remember to protect your hunting groups. It is our duty as Khala Dun to do so. Anger your enemy, use taunting tactics to keep them distracted.");
  }
  if ($count == 8) {
    quest::say("If you are wounded, seek out a Dar Khura. It is better to allow them to aid you than to wait for your wounds to heal. There is no shame in seeking assistance in this, for we must be sure to return to the battle as quickly as possible. Remember, we have a city to defend.");
  }
  if ($count == 9) {
    quest::say("Watch your spear there! Your weapons are not toys. Be careful where you point them.");
     $count = 0;
    quest::settimer("koldar",150);
  }
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Stand back hunter! Not all of my men are properly trained in the use of their spears. You may find yourself losing an eye if you get too close. Now then, I assume you have [come to help.] Is that correct?");
  }
  if ($text=~/come to help/i) {
    quest::say("Then why are you standing around! Can't you see the invading forces of the Shak Dratha approach our town? Destroy them and bring me four of their bloody hearts as proof of your deed. Snap to it!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30616 => 4)) {
    quest::say("Well done, hunter."); #generic reward text
    quest::exp(2000);
    quest::summonitem(13009,6);
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}

# EOF zone: shadeweaver ID: 165144 NPC: Captain_Koldar

