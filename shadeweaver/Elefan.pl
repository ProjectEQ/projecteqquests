# items: 4759, 4758

sub EVENT_SAY { 
  if ($text=~/hail/i) {
    quest::say("Hello, $name. It's a pleasure to meet you as I do not see many visitors while I am working in the field gathering research.");
  }
  if (($text=~/fresh samples/i) && (quest::get_data("$name-zimloro") == 1)) {
    quest::say("Oh, some antidote ingredients that I stumbled upon not long ago. They should meet his needs. Will you be so kind as to [" . quest::saylink("take the antidote ingredients") . "] to Zimloro?");
  }
  if (($text=~/take the antidote ingredients/i) && (quest::get_data("$name-zimloro") == 1)) {
    quest::say("Here you are, $name. Please bring them to him at once so they do not spoil and thank you for your help.");
    quest::summonitem(4759); # Item: Antidote Ingredients
    quest::delete_data("$name-zimloro");
  }
}

sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 4758 => 1)) { #Item: Zimloro Ingredient List
    quest::say("Ah! Master Zimloro sent you, eh? This note indicates that he wants some specific ingredients. Luckily, I've got several [" . quest::saylink("fresh samples") . "] that I've only recently collected.");
    quest::set_data("$name-zimloro", 1);
    quest::exp(500);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:shadeweaver  ID:165178 -- Elefan