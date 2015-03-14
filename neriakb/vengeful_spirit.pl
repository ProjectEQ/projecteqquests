
# vengeful spirit - The Visiting Priestess
#

sub EVENT_SPAWN {
  # Allow the quest to reset
  quest::settimer("despawn", 6000);
}

sub EVENT_TIMER {
  quest::stoptimer("despawn");
  quest::depop();
}

sub EVENT_ITEM {
# 18401 - Scroll of Flayed Goblin Skin
#
if (plugin::check_handin(\%itemcount,18401 => 1)) {
  quest::stoptimer("despawn");
  quest::emote("flares brightly as you place the scroll into the blue flames of the forge. The scroll quickly catches fire and burns out in a flash of white fire. In it's place is left a hammer. As you snatch the hammer from the flames you hear the spirit begin to cackle wildly and fade away.");
  quest::summonitem(6403);  # Blued Two-Handed Hammer
  quest::exp(132775);      # 2.5% @ level 30
  quest::depop();
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: neriakb ID: 41106 NPC: vengeful_spirit 