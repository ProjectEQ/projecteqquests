sub EVENT_CLICKDOOR {
  if($doorid == 12 && $version == 5) {
    if(defined($qglobals{ikkydoor}) && ($qglobals{ikkydoor} >= 1)) {
      quest::forcedooropen(12);
	}
  }
  if($doorid == 15 && $version == 5) {
    if(defined($qglobals{ikkydoor}) && ($qglobals{ikkydoor} >= 1)) {
      quest::forcedooropen(15);
	}
  }
  if($doorid == 16 && $version == 5) {
    if(defined($qglobals{ikkydoor}) && ($qglobals{ikkydoor} >= 1)) {
      quest::forcedooropen(16);
	}
  }
  if($doorid == 8 && $version == 5) {
    if(defined($qglobals{ikkydoor}) && ($qglobals{ikkydoor} == 3)) {
      quest::forcedooropen(8);
	}
  }
  if($doorid == 9 && $version == 5) {
    if(defined($qglobals{ikkydoor}) && ($qglobals{ikkydoor} == 3)) {
      quest::forcedooropen(9);
	}
  }
  if($doorid == 10 && $version == 5) {
    if(defined($qglobals{ikkydoor}) && ($qglobals{ikkydoor} >= 1)) {
      quest::forcedooropen(10);
	}
  }
}