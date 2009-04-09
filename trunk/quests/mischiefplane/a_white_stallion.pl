sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 22856 => 1)) {
    quest::say("The madness has fled my mind and I am once again whole! Give Gelistial my regards, I must leave this place and try to quell the madness I have inflicted.");
    quest::summonitem(24869);
  }
}