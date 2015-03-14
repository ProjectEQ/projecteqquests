# Living Granite
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hmmm, I didn't know refuse could speak. Are you here to annoy me or are you planning on making yourself useful, if the latter is even possible?");
  }
  if ($text=~/make myself useful/i) {
    quest::say("A feeble creature like yourself is near worthless. If you must insist on serving the mighty Kromzek then go to the caverns of the geonids and bring me four blocks of living granite so that I may perform some tests on its value as a resource in the expansion of Kael.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 24872 => 4)) {
    quest::say("So you proved to be of value after all, take this for your work. Don't let it go to your head.");
    quest::exp(25000);
    quest::summonitem(24877);
    quest::faction(189,10); #kromzek
    quest::faction(188,10); #kromrif
    quest::faction(179,10); #king tormax
    quest::faction(42,10); #CoV
  }
  plugin::return_items(\%itemcount);
}

#EOF zone: wakening ID: 119138 NPC: #a_storm_giant_architect

