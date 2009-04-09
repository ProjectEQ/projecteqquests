#BeginFile: butcher\Atwin_Keladryn.pl (68076)
#Quest file for Butcherblock Mountains - Atwin Keladryn: Beetles of the Estate

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello, $name. Would you be interested in assisting me in a special [task]?"); #Text made up
  }
  if($text=~/task/i) {
    if(($ulevel > 9) && ($ulevel < 21)) {
      if(quest::istaskactive(15)) {
        quest::say("Beetles of the Estate is already in progress.");
      }
      else {
        quest::taskselector(15); #Task: Beetles of the Estate
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

#EndFile: butcher\Atwin_Keladryn.pl (68076)