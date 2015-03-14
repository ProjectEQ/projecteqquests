sub EVENT_COMBAT {

  if ($combat_state == 1) {
quest::settimer("Rampage", 8);
}

if ($combat_state == 0) {
$npc->WipeHateList();
quest::stoptimer("Rampage");
quest::stoptimer("getclients");
#$npc->SetHP($npc->GetMaxHP() * 1);
}
}

sub EVENT_TIMER {
if ($timer eq "Rampage") {
quest::stoptimer("Rampage");
my $TimeRA = quest::ChooseRandom(8);
quest::settimer("getclientsRAMPAGE", $TimeRA);
  }

####################################
##########AE RAMPAGE##################
#####################################
	if ($timer eq "getclientsRAMPAGE")
	{
		$cmname = $npc->GetCleanName();
		my $MaxDam = $npc->GetMaxDMG();
		my $ShieldMaxDam = ($MaxDam * .65);
		my $ShieldMinDam = $ShieldMaxDam / 2;
		my $DamageVar = ($ShieldMaxDam - $ShieldMinDam);
	  
		$entity_list->MessageClose($npc, 1, 200, 13, "$cmname  goes on a RAMPAGE");
	   
		my $list_check = 0;
	
		for ($list_check = 0; $list_check < 1502; $list_check++)
		{
		
			$client_search = $entity_list->GetClientByID($list_check);
		     
		    if ($client_search)
		    {
			    my $distanceCHK = $client_search->CalculateDistance($x, $y, $z);
			    my $PLTarget = $npc->GetTarget();
			    if ($PLTarget)
			    {
				    my $TargID = $PLTarget->GetID();
				    my $ClID = $client_search->GetID();
				    my $RampDamageVar = (int(rand($DamageVar ))) + $ShieldMinDam;
				  
			        if (($distanceCHK <= 31) && ($TargID != $ClID))
			        {
				        $client_search->Damage($npc, $RampDamageVar, 7477, 1, 1, -1, 0);
				        $client_search->Message(13, "$cmname hits YOU for $RampDamageVar points of damage" );
					}
				}
			}
		}
	}
############################################################    
############################################################    
############################################################ 
}



