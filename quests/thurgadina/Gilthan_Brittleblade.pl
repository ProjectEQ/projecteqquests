# part of seventh coldain prayer shawl
#

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 1198 => 1)) {
    quest::say("So, you've been chosen to attempt the rune, eh? Been ages since anyone's even made an attempt. The rune represents the very essence of our people, our culture, and our religion. Take a sea shell runed with enduring breath and a small brick of velium and grind them together in a mortar and pestle. Add water to the powder and model the rune. Fire the rune with water and the best of firing sheets. Show the product to Trademaster Kroven.");
    quest::summonitem(1198);
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: thurgadina ID: 115172 NPC: Gilthan_Brittleblade

