sub EVENT_WAYPOINT_ARRIVE {
	if ($wp eq 3) {
		quest::SetRunning(1);
	}
	if ($wp eq 6) {
		quest::SetRunning(0);
	}
}

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Brrrr.. It.. Is sooo.. c-cold!! I never.. sh-should've j-joined.. the.. the W-wolves of the N-north!!");
  }
  if ($text=~/Ivan's remains/i) {
    quest::say("You were sent to retrieve the remains? I am sorry, I lost them. It was not my fault! There was no escort as I was told. I got lost returning to Halas and ended up on a frozen river. The ice broke and the remains were scattered into the freezing water. Will you [dive for the remains]?");
  }
  if ($text=~/I will dive/i) {
    quest::say("Thank the Tribunal!! I would have, but I cannot swim. Take this chest. Fill it with the four pieces which fell below the surface. I know not what else lies within. When you fill the box and combine the items, return it to Renth. Good luck, $name.");
    quest::summonitem(17945);
  }
}

sub EVENT_ITEM {
  # 13244 :  One Quarter Bottle of Elixir
  if ($itemcount{13244} == 1){
    quest::say("Oh thank you. Sorry, but the bottle is empty now. I hope you did't need any. Take the empty bottle back to Dargon. He may refill it for you.");
    quest::exp(125);
    quest::faction(213,10); # 213 : Faction Merchant's of Halas
    quest::faction(294,10); # 294 : Faction Shaman of Justice
    quest::faction(311,10); # 311 : Faction Steel Warriors
    quest::faction(361,10); # 361 : Faction Wolves of the North
    quest::summonitem(13245); # 13245 :  Empty Bottle of Elixir
  }
}

#END of FILE Zone:everfrost  ID:30029, 30096, 30119 -- Megan_OReilly

