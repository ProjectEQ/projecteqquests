#Bzzazzt - #1
sub EVENT_DEATH_COMPLETE {
	quest::spawn2(71103,0,0,$x+10,$y,$z,$h); #Bazzazzt #1-1
	quest::spawn2(71103,0,0,$x-10,$y,$z,$h); #Bazzazzt #1-2
}