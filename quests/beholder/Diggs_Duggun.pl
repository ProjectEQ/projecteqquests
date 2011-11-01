# 1st part of paladin quest spell - divine might
#
# small dialogue addition to key the player to hand the leg bone to valeron.
# more details in valeron's .pl file in freportn.
#

sub EVENT_COMBAT {
     if($combat_state == 1) {
    quest::say("Time to mine fer yer brains!!");
 }
}

sub EVENT_DEATH {
	quest::say("Aaargh!!  The picks of Mining Guild 628 shall avenge my death.");
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("ail, dere! Ain'tcha a sight fer me sore eyes! I knows dat we're strangers an' all, but might I ask a [boon] of ye?");
  }
  if ($text=~/boon/i) {
    quest::say("Well, me pickaxe is blunted awfully bad and me ale supplies are dangerously low. If'n ye would be kind enough t' get me a new pick and a couple o' bottles o' dwarven ale, I would be f'rever in yer debt.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 5018 => 1, 13036 => 2)) {
    quest::emote("drinks one of the ales, burps loudly, then says 'By Brell's Beard! Yer a lifesaver, ya are! 'ere, take dis bone I've found 'ere in dis maze. Looks human ta me and I'm thinkin that a proper burial is in order. Freeport's the closest place dat has one o Marr's temples. I'm thinkin dis was one o' his Holy Knights by da look o' da tattered tunic I found it wrapped in. I'm thinkin Valeron might be havin an interest in it if you show that to him.'");
    quest::summonitem(6701);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}
# EOF zone: beholder ID: 16013 NPC: Diggs_Duggun

