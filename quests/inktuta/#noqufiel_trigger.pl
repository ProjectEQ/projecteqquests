# #noqufiel_trigger NPCID 296075

my $true_noq;
my $mir_noq;
my $true_hp = 2054874;
my $random_name;
my $true_newX = 20;
my $true_newY = -706;
my $true_newZ = -126;
my $Mir_newX = 20;
my $Mir_newY = -633;
my $Mir_newZ = -126;


sub EVENT_SPAWN {
	SPAWN_NOQUFIELS();
	quest::settimer("banish_top",45);
}

sub EVENT_SIGNAL {
	if ($signal == 1) { ##Any noqufiel is aggro'd
		quest::settimer("change_names",20);
		quest::settimer("spawn_cursebearer",30);
		quest::settimer("spawn_noqufiel",120);
	}
}
		
		
sub EVENT_TIMER {
	if ($timer eq "change_names") {
		$random_name = quest::ChooseRandom(1,2); #random chance to swap True/Mirror
		if ($random_name == 1) { #tell True/Mirror to switch
			if ($entity_list->IsMobSpawnedByNpcTypeID(296074)) { ##Noqufiel			
				quest::depopall(296074); #depop ##Noqufiels
				quest::spawn2(296066,0,0,20,-706, -126,121); #Mirror Image
				quest::spawn2(296065,0,0,20,-633, -126,125); #True Image
				$true_noq = $entity_list->GetNPCByNPCTypeID(296065);
				$mir_noq = $entity_list->GetNPCByNPCTypeID(296066);
				$true_noq->SetHP($true_hp);
			} else {
				if ($entity_list->IsMobSpawnedByNpcTypeID(296066)) { #mirror
					$true_newX = $mir_noq->GetX();
					$true_newY = $mir_noq->GetY();
					$true_newZ = $mir_noq->GetZ();
					quest::depopall(296066);
				}
				if ($entity_list->IsMobSpawnedByNpcTypeID(296065)) { #true
					$Mir_newX = $true_noq->GetX();
					$Mir_newY = $true_noq->GetY();
					$Mir_newZ = $true_noq->GetZ();
					$true_noq = $entity_list->GetNPCByNPCTypeID(296065);
					$true_hp = $true_noq->GetHP();
					quest::depopall(296065);
				}
				quest::spawn2(296065,0,0,$true_newX,$true_newY,$true_newZ,0);
				$true_noq = $entity_list->GetNPCByNPCTypeID(296065);
				$true_noq->SetHP($true_hp);
				quest::spawn2(296066,0,0,$Mir_newX,$Mir_newY,$Mir_newZ,0);
				$mir_noq = $entity_list->GetNPCByNPCTypeID(296066);
			}
		}
	} elsif ($timer eq "spawn_noqufiel") {
		SPAWN_NOQUFIELS();
	} elsif ($timer eq "spawn_cursebearer") {
		if (!$entity_list->IsMobSpawnedByNpcTypeID(296074)) {
			quest::spawn2(quest::ChooseRandom(296059,296060,296061,296062,296063,296064),0,0,-238,-657,-126,121);
		}
	} elsif ($timer eq "banish_top") {
		if ($entity_list->IsMobSpawnedByNpcTypeID(296065)) {
			quest::signalwith(296065,4); #tell True_Image to banish
		}
	}
		
}
		
		
		
sub SPAWN_NOQUFIELS {
	if ($entity_list->IsMobSpawnedByNpcTypeID(296065)) { #true
		$true_hp = $true_noq->GetHP();
	}
	quest::depopall(296074); #depop ##Noqufiel
	quest::depopall(296066); #depop #Mirror Image
	quest::depopall(296065); #depop #True Image
	quest::spawn2(296074,0,0, 20, -706,  -126, 200); ##Noqufiel
	quest::spawn2(296074,0,0, 20, -633, -126, 200); ##Noqufiel
	quest::stoptimer("spawn_cursebearer");
}
