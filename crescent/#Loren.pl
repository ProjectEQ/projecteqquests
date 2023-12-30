sub EVENT_SPAWN {
  quest::settimer("feign", 3);
}

sub EVENT_TIMER {
  if ($timer eq "feign") {
    $npc->SetAppearance(3); #feign
    quest::settimer("feign", 30);
  }
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    $npc->SetAppearance(0); #standing
    if ($ulevel < 5) { #need actual level - random responses
      my $random_say = quest::ChooseRandom(
        "This matter is far too advanced for you to handle.  Come back after you've killed a few more large rats.",
        "Someone with your skills is more suited to beetle slaying.  Run along, now.",
        "I think I saw a gnoll pup you could probably defeat, a few miles back.",
        "It's much safer for you to spend time fishing than on a dangerous issue like this."
      );
      quest::say($random_say);
    }
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}