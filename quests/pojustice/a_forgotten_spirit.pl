sub EVENT_SAY {
  if ($text=~/I remember/i) {
    quest::summonitem(11043);
  }
}