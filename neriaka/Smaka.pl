# Part of SK Epic 1.0

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("You want stuff? Or mebby you looks for a cure?");
  }
  if($text=~/cough elixir/i) {
    quest::say("Ahh, you want me cure?! It cost lots of money, big big secret it is. Only us ogres know how to make. You wants? Only 1000 platinum! Make you feels bedder in no times!");
  }
}

sub EVENT_ITEM {
  my $cash = 0;
  $cash = ($platinum * 1000) + ($gold * 100) + ($silver * 10) + $copper;
  if ($cash == 1000000) { #1000 Platinum
    quest::say("Okay, enjoy me drink!");
    quest::faction(69,5); #Dark Bargainers
    quest::faction(88,5); #Dreadguard Outer
    quest::faction(87,5); #Dreadguard Inner
    quest::summonitem(14365); #Cough Elixir
  }
  else {
    quest::givecash($copper, $silver, $gold, $platinum);
  }
    plugin::return_items(\%itemcount);
}

# Quest by mystic414