# Bloody Shak Dratha Hearts
#

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

