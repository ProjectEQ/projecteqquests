#BeginFile: butcher\Gibi_Bilgum.pl (68090)
#Quest file for Butcherblock Mountains - Gibi Bilgum: They're a Bit Short

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Get a load of my sister over yonder. She doesn't know when to give up the swashbuckling. Idiocy is more like it. She's not the only one around here with some [tasks] that need... well, tasking. You might say I'm a taskmaster, only without the whip. I'm not sure how to even use a whip though, so maybe it's for the best.");
  }
  if($text=~/tasks/i) {
    if($ulevel >= 12) {
      if(quest::istaskactive(13)) {
        quest::say("They're a Bit Short is already in progress.");
      }
      else {
        quest::taskselector(13); #Task: They're a Bit Short
      }
    }
    else {
      quest::say("I don't have any tasks suitable to one of your experience.");
    }
  }
}

sub EVENT_ITEM {
  quest::say("I have no use for this, $name.");
  plugin::return_items(\%itemcount);
}

#EndFile: butcher\Gibi_Bilgum.pl (68090)