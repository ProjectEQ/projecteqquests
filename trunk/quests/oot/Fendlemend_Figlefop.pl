sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("sighs and looks up at you.");
    quest::say("What a horrible expedition!");
    quest::say("No goblin relics, not even some goblin dishes! My rebreather is broken and the only thing we [found] was not even from the goblinempires!");
  }
  if ($text=~/found/i) {
    quest::emote("huffs for a moment, looking quite upset.");
    quest::say("I found a [silly sword blade]. It is useless to me. The only thing I study is goblins, and this thing is definitely not goblin insign.");
  }

  if ($text=~/silly sword blade/i) {
    quest::say("You will have to ask Denken about the blade. I gave it to him to get it out of my way.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount); # return unused items
}

#End of File, Zone:oot  NPC:69062 -- Fendlemend_Figlefop
