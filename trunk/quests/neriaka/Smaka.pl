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
  if ($platinum==1000) { 
    quest::say("Okay, enjoy me drink!");
    quest::summonitem(14365);
  }
}

# Quest by mystic414

