#BeginFile: butcher\Alun_Bilgum.pl (68091)
#Quest file for Butcherblock Mountains - Alun Bilgum: Tour of the Castle

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello, $name. Would you be interested in assisting me in a special [task]?"); #Text made up
  }
  if($text=~/task/i) {
    if(($ulevel > 15) && ($ulevel < 25)) {
      if(quest::istaskactive(14)) {
        quest::say("Tour of the Castle is already in progress.");
      }
      else {
        quest::taskselector(14); #Task: Tour of the Castle
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

#EndFile: butcher\Alun_Bilgum.pl (68091)