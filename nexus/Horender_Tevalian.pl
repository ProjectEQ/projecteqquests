sub EVENT_SAY {

  my $charKey = $client->CharacterID() . "-TL";
  my $MAOcharKey = $client->CharacterID() . "-MAO-Progress";
  my $charTargetsString = quest::get_data($charKey . "-A");
  my %teleport_zones = ();
  
  my @zones = split /:/, $charTargetsString;
  foreach $z (@zones) {      
    my @tokens = split /,/, $z;
    if ($tokens[1] ne '') {
      $teleport_zones{$tokens[1]} = [ @tokens ];
    }
  }

  $teleport_zones{"The Northern Plains of Karana (Great Combine Spires)"} = ["northkarana", "The Northern Plains of Karana (Great Combine Spires)", 1215, -3690, -9, 0];
	$teleport_zones{"Neriak (Blind)"} = ["neriaka", "Neriak (Blind)", 18, 178, 5, 250];
  $teleport_zones{"Innothule Swamp (Blind)"} = ["innothule", "Innothule Swamp (Blind)", 620, -2370, -17, 35];
  $teleport_zones{"Freeport Sewers (Blind)"} = ["freportw", "Freeport Sewers (Blind)", 40, -660, -32, 115];
	

  if ($text=~/hail/i) {
    if (quest::get_data($MAOcharKey) <= 0) {
      plugin::NPCTell("Hail, traveler. You'll need to get permission to access the Nexus teleportation network. Speak to Magus Asorin on the central platform.");
    } else {
      plugin::NPCTell("Hail, traveler. I can transport you to the Great Spires on Antonica, or to any other location on the continent that you've become attuned to.");
      $client->Message(257, " ------- Select a Destination ------- ");
      foreach my $t (sort keys %teleport_zones) {
        $client->Message(257, "-> ".quest::saylink($teleport_zones{$t}[1],0,$t));
      }    
    }
  } elsif (exists($teleport_zones{$text}[1])) {
    $client->MovePC(quest::GetZoneID($teleport_zones{$text}[0]),$teleport_zones{$text}[2],$teleport_zones{$text}[3],$teleport_zones{$text}[4],$teleport_zones{$text}[5]);
  }
}
