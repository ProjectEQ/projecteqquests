# Necromancer Epic NPC -- Gkzzallk

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings, would you care for some tea?");
 }
  if($text=~/tea/i) {
    quest::say("The fairies should be bringing me some tea soon.");
 }
}
sub EVENT_ITEM {
  if($itemcount {18087} == 1) {
    quest::emote("screams as he touches the book. His body shimmers as he shrinks smaller and smaller until it's no larger than an insect. The book shimmers, shifting into the shape of a small, black box. Gkzzallk holds on to the opening of the box as he is sucked backward into it. The tiny screams are finally silenced as the box top closes.");
    quest::summonitem(20652);
    quest::depop();
 }
}

#END of FILE  Quest by: Solid11  Zone:airplane  ID:71073 -- Gkzzallk

