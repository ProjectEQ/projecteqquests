sub EVENT_SPAWN {
  	$x = $npc->GetX();
   	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
}

sub EVENT_ENTER {
	if(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 10092) { #hateplane
		quest::popup('Teleport', 'Teleport to The Plane of Hate?', 666, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 10094) { #airplane
		quest::popup('Teleport', 'Teleport to The Plane of Sky?', 674, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 64191) { #dragonscale
		quest::popup('Teleport', 'Teleport to Dragonscale Hills?', 15891, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76000) { #karana
		quest::popup('Teleport', 'Teleport to The Northern Plains of Karana?', 2708, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76001) { #ecommons
		quest::popup('Teleport', 'Teleport to East Commonlands?', 4176, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76002) { #lavastorm
		quest::popup('Teleport', 'Teleport to The Lavastorm Mountains?', 534, 1, 0);
		
	} 
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76003) { #toxxulia
		quest::popup('Teleport', 'Teleport to Toxxulia Forest?', 2707, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76004) { #faydark
		quest::popup('Teleport', 'Teleport to The Greater Faydark?', 2706, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76005) { #dreadlands
		quest::popup('Teleport', 'Teleport to The Dreadlands?', 2709, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76006) { #iceclad
		quest::popup('Teleport', 'Teleport to The Iceclad Ocean?', 2284, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76007) { #cobaltscar
		quest::popup('Teleport', 'Teleport to Cobalt Scar?', 2031, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76009) { #twilight
		quest::popup('Teleport', 'Teleport to The Twilight Sea?', 3615, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76010) { #stonebrunt
		quest::popup('Teleport', 'Teleport to The Stonebrunt Mountains?', 3794, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76011) { #slaughter
		quest::popup('Teleport', 'Teleport to Wall of Slaughter?', 6180, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76012) { #barindu
		quest::popup('Teleport', 'Teleport to Barindu, Hanging Gardens?', 5733, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76070) { #eastkorlach
		quest::popup('Teleport', 'Teleport to The Undershore?', 8237, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88735) { #arcstone
		quest::popup('Teleport', 'Teleport to Arcstone, Isle of Spirits?', 8967, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88736) { #goru
		quest::popup('Teleport', 'Teleport to Goru`kar Mesa?', 999, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88737) { #guild banner
		quest::popup('Teleport', 'Teleport to your guild banner?', 1000, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88738) { #kattacastrum
		quest::popup('Teleport', 'Teleport to Katta Castrum?', 416, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88739) { #potimea
		quest::popup('Teleport', 'Teleport to The Plane of Time?', 20543, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88740) { #brellsrest
		quest::popup('Teleport', 'Teleport to Brell\'s Rest?', 21986, 1, 0);
		
	}
}