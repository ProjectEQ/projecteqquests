sub EVENT_CLICKDOOR {
  my $d_id = ($doorid % 256);

  if($d_id == 41) {
    if((defined $qglobals{inktdoor}) && ($qglobals{inktdoor} == 1)) {
       quest::forcedooropen(41);
	}
     }
}