sub EVENT_ENTERZONE {
  if (quest::istaskcompleted(138) == 0 && quest::istaskactive(138) == 0) { #Check if completed Task: New Beginnings
    quest::assigntask(138); #Force assign Task: New Beginnings
  }
  #Remove old unneeded globals
  if (defined($qglobals{frizznik}) && ($ulevel > 15)) {
    quest::delglobal("frizznik");
  }
  if (defined($qglobals{frizznikfinal}) && ($ulevel > 15)) {
    quest::delglobal("frizznikfinal");
  }
}