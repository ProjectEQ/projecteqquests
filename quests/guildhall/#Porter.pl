sub EVENT_SPAWN {
  	$x = $npc->GetX();
   	$y = $npc->GetY();
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
}

sub EVENT_ENTER {
	if(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 10092) { #hateplane
		quest::selfcast(666);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 10094) { #airplane
		quest::selfcast(674);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 64191) { #dragonscale
		#quest::selfcast(15891);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76000) { #karana
		quest::selfcast(2708);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76001) { #commons
		quest::selfcast(4176);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76002) { #lavastorm
		quest::selfcast(534);
		
	} 
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76003) { #toxxulia
		quest::selfcast(2707);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76004) { #faydark
		quest::selfcast(2706);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76005) { #dreadlands
		quest::selfcast(2709);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76006) { #iceclad
		quest::selfcast(2284);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76007) { #cobalt
		quest::selfcast(2031);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76009) { #twilight
		quest::selfcast(3615);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76010) { #stonebrunt
		quest::selfcast(3794);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76011) { #slaughter
		#quest::selfcast(6180);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76012) { #barindu
		#quest::selfcast(5733);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 76070) { #undershore
		#quest::selfcast(8237);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88735) { #arcstone
		#quest::selfcast(8967);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88736) { #goru
		#quest::selfcast();
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88737) { #guild banner
		#quest::selfcast();
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88738) { #katta
		quest::movepc(160,-545,645,1,0);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88739) { #time
		#quest::selfcast(20543);
		
	}
	elsif(defined $qglobals{"ghport$uguild_id"} && $qglobals{"ghport$uguild_id"} == 88740) { #brell
		#quest::selfcast(21986);
		
	}
}