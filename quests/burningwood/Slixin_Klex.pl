# Part of quest for Veeshan's Peak key

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("So long ago... The burning of our land?");
  }
  if ($text=~/burning/i) {
    quest::say("Fiery death from the sky. Rock and fire burning our lands. Death and destruction splintering our tribe. Once, strong we were, but the fiery rocks from the sky crushed our proud cities and weakened our tribe.");
  }
  if ($text=~/tribe/i) {
    quest::say("Obulus was our people. The hills and trees were our lands. We tamed the dark and wilds and bent the forests to our needs. But all is gone, all our people, all our works, even the medallion that was the symbol of our power.");
  }
  if ($text=~/medallion/i) {
    quest::say("Medallion of the Obulus. Symbol of our proud people. Broken into pieces long lost to the dark forests now. I know where they are now but I am no longer flesh. If I were, I would find them and bring them back together.");
  }
  if ($text=~/pieces/i) {
    quest::say("Hhhhh. Three pieces there are. One sits in the hands of Sselot though he knows its purpose not. Another sits upon an iksar ghost in Trakanons. The last is held by a long rotted iksar skeleton in the Dreadlands. Bring them all here and I may be able to unite them again. Perhaps this will even free me from my torment... or not.");
  }
}

sub EVENT_ITEM {
  if (($itemcount{19956} == 1) && ($itemcount{19957} == 1) && ($itemcount{19958} == 1)) {
    quest::say("Ssssss. I thought I would never see these. I never thought the symbol of our people would be made whole again. I feel no rest for my sssoul though. My torment still flows as freely as when my peoples first suffered fiery death. I need this not. It is useless to me. Here, you take it. Maybe you can find some good to do with it.");
    quest::summonitem(19953);
    quest::exp(1000);
  }
}

# Quest by mystic414