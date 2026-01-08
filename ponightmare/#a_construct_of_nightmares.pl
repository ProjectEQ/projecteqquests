sub EVENT_DEATH_COMPLETE {
  # Keep your original notification to Thelin (if other logic listens for it)
  quest::signalwith(204016, 8, 1); # NPC: Thelin_Poxbourne

  # Prevent duplicate PPs in this DZ instance (if the event can chain/reset)
  quest::depopall(202365);         # NPC: Planar Projection (Hedge)

  # Spawn the PP at the Construct's death location, preserving heading if available
  my $heading = defined $h ? $h : 0;
  quest::spawn2(202365, 0, 0, $x, $y, $z, $heading);

  # Optional flavor text
  quest::ze(15, "A planar projection materializes from the unraveling nightmare, beckoning the victors.");
}
