# name: Faelin Bloodbriar
# level: 55
# class: druid
# race: wood elf
# gender: female
# texture: leather
# pri. faction: faydark's champions
#
#
#
#
# receive swiftwind on hand in of refined ancient sword
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Didn't think I was gone for good, did you? We're that much closer to finishing this trial of our strength, thanks to you.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20481 => 1)) {
    quest::emote("smiles at you, then closes her eyes as she sets the gem 'Nature's Balance' into the crossguard and begins to channel her spirit into the sword. The ground rumbles loudly as she casts. She collapses in exhaustion after a short time. 'Take the blade, and perhaps you can finish this. You must strike at the heart of Innoruuk's lair. Bring a shattered gem and the mithril blade to Xanuusus. Only by weakening Innoruuk's grip over his realm can the balance of the land once again be restored. If we do not meet again, $name, remember you always have my eternal thanks.'");
    quest::summonitem(20487);
    quest::exp(1000000);
    quest::depop();
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: burningwood ID: XXXXXX NPC: Faelin_Bloodbriar

