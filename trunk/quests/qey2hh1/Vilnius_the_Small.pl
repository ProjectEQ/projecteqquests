# Rogue Epic NPC -- Vilnius_the_Small

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Yes? What is it you need?");
 }
}

sub EVENT_ITEM {
  if($itemcount {1357} == 1 && $itemcount {1253} == 1 && $itemcount {1354} == 1 && $itemcount {1360} == 1) {
    quest::say("You do good work, $race. Here is another trinket for your trouble, you should be able to make use of it. Malta still hasn't made it back yet, and I have one more order to fill, if you're willing. This one should be easy. My sword collector has decided he wants rapiers now, of all things. He has asked for an Eyerazzia, a Martune Rapier, a Burning Rapier, and a well balanced rapier.");
    quest::ding();
    quest::exp(1500);
    quest::summonitem(7505);

 }
  else {
    quest::emote("will not accept this item.");
    plugin::return_items(\%itemcount);
 }
}

#END of FILE  Quest by: Solid11  Zone:qey2hh1  ID:12019 -- Vilnius_the_Small

