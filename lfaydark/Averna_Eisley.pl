#BeginFile: lfaydark\Averna_Eisley.pl (57138)
#Quest file for Lesser Faydark - Averna Eisley: Tour of the Castle

sub EVENT_SAY {
  if($text=~/hail/i) {
    if(quest::istaskactivityactive(14,0)) {
      quest::say("Thank you for contacting me. Your information on this matter has been most useful.");
    }
    else {
      quest::say("Hello, $name");
    }
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

#EndFile: lfaydark\Averna_Eisley.pl (57138)