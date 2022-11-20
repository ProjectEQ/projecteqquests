#BeginFile: butcher\Feriella_Vorana.pl (68248)
#Quest file for Butcherblock Mountains - Feriella Vorana: Beetles of the Estate

sub EVENT_SAY {
  if($text=~/hail/i) {
    if(quest::istaskactivityactive(1011,3)) {
      quest::say("Thanks for contacting me, $name. Your information on this matter has been most useful. Take this as payment for your time.");
    }
    else {
      quest::say("Hello, $name");
    }
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#EndFile: butcher\Feriella_Vorana.pl (68248)