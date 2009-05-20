sub EVENT_SPAWN {
	$counter=0;
	$countertwo=0;
}

sub EVENT_SIGNAL {
	if($signal == 1 && $dust_ring == undef) {
	quest::spawn2(218064,0,0,-221,-1339,-35.5,0);
	quest::spawn2(218064,0,0,-275,-1339,-35.5,0);
	quest::spawn2(218064,0,0,-248,-1290,-35.5,0);
	quest::spawn2(218064,0,0,-250,-1360,-35.5,0);
	quest::setglobal(dust_ring_run,1,3,"H3");
	}

 if($signal == 2) {
    $counter += 1;		
if($signal == 2 && $counter == 4 && $dust_ring == undef && $dust_ring_run == 1) {
      quest::spawn2(218064,0,0,-135,-539,30.5,0);
      quest::spawn2(218064,0,0,-132.2,-567.9,31.1,0);
	quest::spawn2(218064,0,0,-51,-539,30.5,0);
	quest::spawn2(218064,0,0,-23,-529,30.5,0);
	quest::spawn2(218064,0,0,5,-539,30.5,0);
	quest::spawn2(218064,0,0,33,-529,30.5,0);
	quest::spawn2(218064,0,0,61,-539,30.5,0);
	quest::spawn2(218064,0,0,89,-529,30.5,0);
	quest::spawn2(218064,0,0,-7.3,-422.9,31.1,0);
	quest::spawn2(218064,0,0,145,-529,30.5,0);
	quest::spawn2(218064,0,0,9,-415,30.5,0);
	quest::spawn2(218064,0,0,0,-444,30.5,0);
	quest::spawn2(218064,0,0,9,-473,30.5,0);
	quest::spawn2(218064,0,0,0,-502,30.5,0);
	quest::spawn2(218064,0,0,9,-531,30.5,0);
	quest::spawn2(218064,0,0,0,-560,30.5,0);
	quest::spawn2(218064,0,0,9,-589,30.5,0);
	quest::spawn2(218064,0,0,0,-618,30.5,0);
	quest::spawn2(218064,0,0,9,-647,30.5,0);
	quest::spawn2(218064,0,0,0,-676,30.5,0);
	quest::spawn2(218064,0,0,9,-705,30.5,0);
	quest::spawn2(218064,0,0,-48,-498,30.5,0);
	quest::spawn2(218064,0,9,-60,-626,30.5,0);
	quest::spawn2(218064,0,0,78,-629,30.5,0);
	quest::spawn2(218064,0,9,78,-489,30.5,0);
	}

	if($signal == 2 && $counter == 29 && $dust_ring == undef && $dust_ring_run == 1) {
	quest::spawn2(218045,0,0,0,-520,30.5,0);
	quest::spawn2(218045,0,0,0,-555,30.5,0);
	quest::spawn2(218045,0,0,0,-589,30.5,0);
        $counter=0;		
}
 }

 if($signal == 3 && $dust_ring_run == 1) {
    $countertwo += 1;
	if($signal == 3 && $countertwo == 3 && $dust_ring == undef && $dust_ring_run == 1) {
	$countertwo=0;
	quest::spawn2(218096,0,0,0,-520,30.5,0);
	}
 }

 if($signal == 4 && $dust_ring_run == 1) {
   $dust_ring=undef;
   #put global back in

 }
}