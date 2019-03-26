sub EVENT_AGGRO {
	quest::spawn2(123132,0,0,$x,$y,$z,$h); # NPC: a_swarming_beetle
	quest::spawn2(123132,0,0,$x-2,$y,$z,$h); # NPC: a_swarming_beetle
	quest::spawn2(123132,0,0,$x+2,$y,$z,$h); # NPC: a_swarming_beetle
	quest::spawn2(123132,0,0,$x,$y-2,$z,$h); # NPC: a_swarming_beetle
	quest::spawn2(123132,0,0,$x,$y+2,$z,$h); # NPC: a_swarming_beetle
	quest::spawn2(123132,0,0,$x+1,$y+1,$z,$h); # NPC: a_swarming_beetle
	quest::depop_withtimer();
}
