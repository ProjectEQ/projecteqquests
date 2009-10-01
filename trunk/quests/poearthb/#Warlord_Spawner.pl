sub EVENT_SPAWN {
    $counter=0;
}
sub EVENT_SIGNAL {
    $counter += 1;
    if ($counter == 3) {
        quest::spawn2(222019,0,0,$x,$y,$z,$h);
        $counter=0;
   }
}