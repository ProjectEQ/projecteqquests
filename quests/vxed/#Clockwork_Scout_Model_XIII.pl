sub EVENT_SPAWN {
  quest::emote("With the final piece in place, the clockwork scout's eyes light up as it comes to life.");
}
sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (defined $qglobals{bic} && $qglobals{bic} == 13) {
      quest::say("Access code?");
      quest::setglobal("clockwork",1,4,"H2");
}
}
 if ($text=~/040703/i) {
    if (defined $qglobals{bic} && $qglobals{bic} == 13) {
          if (defined $qglobals{clockwork} && $qglobals{clockwork} == 1) {
    quest::say("Verifying password and user identity . . .");
    quest::say("Identity verified as $name. Processing scout report. Please return report to Vaifan.");
   quest::summonitem(67536);
   quest::settimer(60);
   }
  }
 }
}
sub EVENT_TIMER {
  quest::say("Power cells low. Shutting down to reserve power.");
  quest::depop();
}