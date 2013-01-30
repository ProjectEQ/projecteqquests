#Quest file for Dulak's Harbor - Quigli (225231)

#This is the non-attackable version. It should only trigger for the monk ready for this fight after killing Wygrish.

sub EVENT_SAY {
  if ($class eq "Monk") { #need to add check for Wygrish kill
    if ($text=~/hail/i) {
      quest::say("I have nothing for you unless say you have the [right price]. . .");
    }
    if ($text=~/right price/i) {
      quest::say("I have just placed my 'ands on this 'ere book and I'd be willin to part with it for a mighty price else you could try and [defeat me crew].");
    }
    if (($text=~/defeat/i) || ($text=~/crew/i)) {
      quest::say("Good. . .good. I 'aven't 'ad much change to stretch me arms in a while.");
    }
  }
  else {
    quest::say("Go away!");
  }
}

sub EVENT_AGGRO { #NPC event is not ready.
  quest::depop_withtimer();
}