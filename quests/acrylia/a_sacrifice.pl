# Khati Sha Event
# Created by Gonner

sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 2) {
    quest::castspell(154155,6974); #cast Health Infusion on Ward of Death (154155)
    quest::depop();
  }
}

#END of FILE zone:acrylia ID:154148,154149,154150 -- a_sacrifice.pl