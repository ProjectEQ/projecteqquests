sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Yeah, hello. I'm Prak, co-owner of the Golden Rooster. If you're thirsty, we have some great imported ales at our bar. If you're looking for a little excitement, try your hand at a little King's Court. We aim to please, my friend.");
  }
  if($text=~/get rid of stald/i) {
    quest::say("Good.. Zannsin said you had a special talent for this sort of thing, so here's your chance to prove it. What you need to do is follow Stald on his patrol, and when the coast is clear, take him down. Good luck. Oh yeah.. not that I don't trust you or anything, but bring me back some sorta proof that Stald is dead, got it?");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18795 => 1)) {
    quest::say("Hmm, I see. We think we've found out who the mole is in Carson's guards, some guy named Stald. We need to get rid of this guy as quickly, and as quietly, as possible. Carson doesn't want to cause a stink by eliminating one of his own men, so he asked us to do it. What about you? Do you think [you could get rid of Stald] for us?");
  }
  if(plugin::check_handin(\%itemcount, 13793 => 1)) {
    quest::say("Great! Thanks for taking care of this 'problem' for us $name. Please return to Zannsin with this note and he should reward you for your assistance."); #Made up text
    quest::summonitem(18028);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:highpass  ID:5053 -- Prak