# items: 11043
sub EVENT_SAY {
  if ($text=~/I remember/i) {
    quest::summonitem(11043); # Item: Tears of the Forgotten
  }
}