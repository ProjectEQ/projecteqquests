sub EVENT_SAY {
  if ($text=~/dare/i) {
    if (!$entity_list->IsMobSpawnedByNpcTypeID(282105)) {
      if (!defined $qglobals{taskmistress}) {
         quest::spawn2(282105,21,0,-1117,-408,33,251);
      } else {
      quest::say("She hasn't been around much lately, but I'm sure she'll be back.");
      }
    }
  }
}