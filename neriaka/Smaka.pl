# Part of SK Epic 1.0
# items: 14365

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("You want stuff? Or mebby you looks for a cure?");
  }
  if($text=~/cough elixir/i) {
    quest::say("Ahh, you want me cure?! It cost lots of money, big big secret it is. Only us ogres know how to make. You wants? Only 1000 platinum! Make you feels bedder in no times!");
  }
}

sub EVENT_ITEM {
  if (quest::handin({"platinum" => 1000})) { #1000 Platinum
    quest::say("Okay, enjoy me drink!");
    quest::faction(236,5); #Dark Bargainers
    quest::faction(334,5); #Dreadguard Outer
    quest::faction(370,5); #Dreadguard Inner
    quest::summonitem(14365); #Cough Elixir
  }
}