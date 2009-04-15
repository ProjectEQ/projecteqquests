sub EVENT_SAY {
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/elder spirit sent me/i) {
  quest::say("Ah, another courageous alchemist after my own heart. I've been so worried and consumed by aiding the spirits that I'd forgotten how much time I'd spent here. Anyway, no matter. If you give me 1000 platinum pieces, I will give you the medicine bag you will need to work the potion for the spirit. I hate to ask for money, but this bag has cost me four times that to make. It's a long process that requires the magic of some very rare and expensive materials. We are dealing with wisps of consciousness, after all.");
}
}
}
sub EVENT_ITEM {
  if($platinum >= 1000) {
  quest::summonitem(57704);
  quest::say("When you have all the pieces you need, you must find the great shaman who seeks greater knowledge of the spirit world. You will need his guidance with this task.");
}
plugin::return_items(\%itemcount);
}