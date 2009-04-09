sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18757 => 1)) { #A tattered note
    quest::say("Welcome young $race. Here, take this and use it wisely."); #Text made up
    quest::summonitem(13586); #Black Training Tunic
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:neriakc  ID:42069 -- Nezzka_Tolax 
