sub EVENT_SAY {
  if (defined $qglobals{bic} && $qglobals{bic_sew} == 12 && $qglobals{bic_vxe} == 13 && $qglobals{bic_tip} == 14) {
    if ($text=~/hail/i) {
      quest::say("Access code?");
      quest::setglobal("clockwork",1,4,"H2");
    }
    if ($text=~/040703/i) {
      if (defined($qglobals{clockwork}) && ($qglobals{clockwork} == 1)) {
        quest::say("Verifying password and user identity . . .");
        quest::say("Identity verified as $name. Processing scout report. Please return report to Vaifan.");
        quest::summonitem(67536);
        quest::settimer(60);
      }
    }
  } else {
    quest::emote("does not seem to respond to your command.");
  }
}

sub EVENT_TIMER {
  quest::say("Power cells low. Shutting down to reserve power.");
  quest::depop();
}
