sub EVENT_CLICKDOOR {
  my $d_id = ($doorid);

  if($d_id == 515) {
    if((defined $qglobals{ikkydoor}) && ($qglobals{ikkydoor} >= 1)) {
       quest::forcedooropen(515);
	}
     }
  if($d_id == 516) {
    if((defined $qglobals{ikkydoor}) && ($qglobals{ikkydoor} >= 1)) {
       quest::forcedooropen(516);
	}
     }
  if($d_id == 510) {
    if((defined $qglobals{ikkydoor}) && ($qglobals{ikkydoor} >= 2)) {
       quest::forcedooropen(510);
	}
     }
  if($d_id == 512) {
    if((defined $qglobals{ikkydoor}) && ($qglobals{ikkydoor} >= 2)) {
       quest::forcedooropen(512);
	}
     }
  if($d_id == 508) {
    if((defined $qglobals{ikkydoor}) && ($qglobals{ikkydoor} == 3)) {
       quest::forcedooropen(508);
	}
     }
  if($d_id == 509) {
    if((defined $qglobals{ikkydoor}) && ($qglobals{ikkydoor} == 3)) {
       quest::forcedooropen(509);
	}
     }
}