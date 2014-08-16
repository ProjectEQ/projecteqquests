#BeginFile: qvic\player.pl

sub EVENT_ENTERZONE {
	if (defined $qglobals{god_qvic_access} && $qglobals{god_qvic_access} == 1 && quest::has_zone_flag(295) == 1) {
		quest::setglobal("god_qvic_access",2,5,"F");
	}
}

sub EVENT_CLICKDOOR {
	if ($doorid == 2) { #Txevu
#		if (plugin::check_hasitem($client, 60254)) { #Cipher of Txevu
#			if(!quest::has_zone_flag(297)) {
#				quest::set_zone_flag(297);
#			}
#		}
	} elsif ($doorid == 3) { #Inktu`Ta
		my $InstanceID = quest::GetInstanceID("inktuta",0);
		if($InstanceID > 0){
			quest::MovePCInstance(296,$InstanceID,0,65,-1);
		} else {
			$client->Message(13, "You are not a part of an instance!");
		}
	}
}

#EndFile: qvic\player.pl
