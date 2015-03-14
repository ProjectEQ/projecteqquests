sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("It's a good thing Taskmistress Krisz doesn't know what we're up to.  Wow, does she have a temper, and enough skill with a blade to back it up.  No one would [" . quest::saylink("dare") . "] cross her.");
  }
  if ($text=~/dare/i) {
    if (!$entity_list->IsMobSpawnedByNpcTypeID(282105)) {
      if (!defined $qglobals{taskmistress}) {
        quest::emote("laughs, 'Think you could teach that old goat a lesson!?'");
        quest::spawn2(282105,21,0,-1117,-408,33,251);
      } else {
        quest::say("She hasn't been around much lately, but I'm sure she'll be back.");
      }
    }
  }
}
