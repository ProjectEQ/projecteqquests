# items: 18245, 18246
sub EVENT_SAY {
  if ($text=~/hail/i) { #Did not respond to hail on live 01/22/2014
    quest::say("Greetings, citizen. Looking for healing or other such services? If so, then I urge you to seek out the Temple of Terror. The hierophants will see to it for you.");
  }
  if ($text=~/sign the restraining order/i) {
    quest::say("I knew my wicked ways would eventually come to an end. Very well, then. Hand me the legion order and I shall sign it.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18245 => 1)) { #Legion Order (5 signed)
    quest::emote("signs the order and hands it back to you.");
    quest::summonitem(18246); #Legion Order (6 signed)
    quest::exp(200);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:cabwest  ID:5133 -- Trooper_Ogmire