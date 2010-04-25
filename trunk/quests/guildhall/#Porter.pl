sub EVENT_SPAWN {
  	$x = $npc->GetX();
   	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
}

sub EVENT_ENTER {
	if(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 10092) { #hateplane
		quest::popup('Teleport', 'Teleport to the Plane of Hate?', 666, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 10094) { #airplane
		quest::popup('Teleport', 'Teleport to the Plane of Sky', 674, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 64191) { #dragonscale
		quest::popup('Teleport', 'Teleport to Dragonscale?', 15891, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76000) { #karana
		quest::popup('Teleport', 'Teleport to Karana?', 2708, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76001) { #commons
		quest::popup('Teleport', 'Teleport to Commonlands?', 4176, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76002) { #lavastorm
		quest::popup('Teleport', 'Teleport to Lavastorm?', 534, 1, 0);
		
	} 
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76003) { #toxxulia
		quest::popup('Teleport', 'Teleport to Toxxulia?', 2707, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76004) { #faydark
		quest::popup('Teleport', 'Teleport to Greater Faydark?', 2706, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76005) { #dreadlands
		quest::popup('Teleport', 'Teleport to the Dreadlands?', 2709, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76006) { #iceclad
		quest::popup('Teleport', 'Teleport to Iceclad?', 2284, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76007) { #cobalt
		quest::popup('Teleport', 'Teleport to Cobalt Scar?', 2031, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76009) { #twilight
		quest::popup('Teleport', 'Teleport to Twilight Sea?', 3615, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76010) { #stonebrunt
		quest::popup('Teleport', 'Teleport to Stonebrunt?', 3794, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76011) { #slaughter
		quest::popup('Teleport', 'Teleport to the Wall of Slaughter?', 6180, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76012) { #barindu
		quest::popup('Teleport', 'Teleport to Barindu?', 5733, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76070) { #undershore
		quest::popup('Teleport', 'Teleport to Undershore', 8237, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88735) { #arcstone
		quest::popup('Teleport', 'Teleport to Arcstone?', 8967, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88736) { #goru
		quest::popup('Teleport', 'Teleport to Goru?', 999, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88737) { #guild banner
		quest::popup('Teleport', 'Teleport to your guild banner?', 1000, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88738) { #katta
		quest::popup('Teleport', 'Teleport to Katta?', 160, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88739) { #time
		quest::popup('Teleport', 'Teleport to the Plane of Time?', 20543, 1, 0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88740) { #brell
		quest::popup('Teleport', 'Teleport to Brell?', 21986, 1, 0);
		
	}
}