sub EVENT_SAY {
  if($text=~/hail/i) {
    if(quest::istaskactivityactive(1947,0)) {
      quest::say("Thanks for contacting me, $name. Your information on this matter has been most useful.");
      quest::updatetaskactivity(1947,0);
    }
    else {
      quest::say("Hello, $name.");
    }
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}