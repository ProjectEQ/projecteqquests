# #noqufiel_trigger NPCID 296075


my $true_image_hp = 2054874;
my $random_name;

sub EVENT_SPAWN {
	SPAWN_NOQUFIELS();
}

sub EVENT_SIGNAL {
	if ($signal == 1) { ##Any noqufiel is aggro'd
		quest::say("got aggro signal");
		quest::settimer("change_names",20);
		quest::settimer("spawn_cursebearer",30);
		quest::settimer("spawn_noqufiel",120);
	} elsif ($signal == 2) { #True Image asking for HP
		quest::say("Image asked for HP");
		quest::signalwith(296065,$true_image_hp);
	} else { #no defined trigger means I'm receiving HP
		quest::say("received HP");
		$true_image_hp = $signal;
	}
}
		
		
sub EVENT_TIMER {
	if ($timer eq "change_names") {
		$random_name = quest::ChooseRandom(1,2); #random chance to swap True/Mirror
		if ($random_name == 1) { #tell True/Mirror to switch
			if ($entity_list->GetMobByNpcTypeID(296074)) { ##Noqufiel
				quest::signalwith(296074,5); ##depop ##Noqufiels
				quest::spawn2(296066,0,0,20,-706, -126,121); #Mirror Image
				quest::spawn2(296065,0,0,20,-633, -126,125); #True Image
			} else {
				quest::signalwith(296066,3); 
				quest::signalwith(296065,3);
			}
		}
	} elsif ($timer eq "spawn_noqufiel") {
		SPAWN_NOQUFIELS();
	} elsif ($timer eq "spawn_cursebearer") {
		if (!$entity_list->GetMobByNpcTypeID(296074)) {
			quest::spawn2(quest::ChooseRandom(296059,296060,296061,296062,296063,296064),0,0,-238,-657,-126,121);
		}
	}
}
		
		
		
sub SPAWN_NOQUFIELS {
	quest::signalwith(296074,5); #depop ##Noqufiel
	quest::signalwith(296066,5); #depop #Mirror Image
	quest::signalwith(296065,5); #depop #True Image
	quest::spawn2(296074,0,0, 20, -706,  -126, 200); ##Noqufiel
	quest::spawn2(296074,0,0, 20, -633, -126, 200); ##Noqufiel
}