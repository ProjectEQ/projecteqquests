sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome back, $name. Why don't you purchase a few things before you head out into the tundra again?");
  }
}
#END of FILE Zone:halas  ID:29038 -- Hetie_McDonald