# Part of the quest for Incandescent Gloves

sub EVENT_ITEM {
  # Enchanted Gloves
  if($gold == 50) {
    quest::say("I see that Sultin has sent you to me.  Very well, here are your gloves."); # Made this text up
    quest::summonitem(2354);
  }
}

# Quest by mystic414

