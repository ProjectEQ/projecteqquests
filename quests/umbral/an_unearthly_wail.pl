# part of doomshade trigger
#

sub EVENT_SPAWN {
  $chantcount = 0;
}

sub EVENT_SIGNAL {
  if ($signal == 299) {
    $chantcount += 1;
    quest::shout("fills the air as the Dark Masters begin chanting for the coming of doom.");
    if ($chantcount == 10) {
      quest::depop_withtimer();
    }
  }
  if ($signal == 399) {
    quest::settimer("repopscream",300);
  }
}

sub EVENT_TIMER {
  if ($timer eq "repopscream") {
    quest::spawn2(176087,0,0,231,-74,-30.1,146);
    quest::stoptimer("repopscream");
  }
}

# EOF Zone: Umbral ID: 176105 NPC: an_unearthly_wail

