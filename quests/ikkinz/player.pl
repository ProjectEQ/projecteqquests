sub EVENT_CLICKDOOR {
  my $d_id = ($doorid % 256);

  if($d_id == 3) {
    if((defined $qglobals{ikkydoor}) && ($qglobals{ikkydoor} == 1)) {
       quest::forcedooropen(515);
	}
     }
  if($d_id == 4) {
    if((defined $qglobals{ikkydoor}) && ($qglobals{ikkydoor} == 1)) {
       quest::forcedooropen(516);
	}
     }
  if($d_id == 254) {
    if((defined $qglobals{ikkydoor}) && ($qglobals{ikkydoor} == 2)) {
       quest::forcedooropen(510);
	}
     }
  if($d_id == 0) {
    if((defined $qglobals{ikkydoor}) && ($qglobals{ikkydoor} == 2)) {
       quest::forcedooropen(512);
	}
     }
  if($d_id == 252) {
    if((defined $qglobals{ikkydoor}) && ($qglobals{ikkydoor} == 3)) {
       quest::forcedooropen(508);
	}
     }
  if($d_id == 253) {
    if((defined $qglobals{ikkydoor}) && ($qglobals{ikkydoor} == 3)) {
       quest::forcedooropen(509);
	}
     }
   }