sub EVENT_SAY {

  my $charKey = $client->CharacterID() . "-TL";
  my $charTargetsString = quest::get_data($charKey . "-O");
  my %teleport_zones = ();
  
  my @zones = split /:/, $charTargetsString;
  foreach $z (@zones) {      
    my @tokens = split /,/, $z;
    if ($tokens[1] ne '') {
      $teleport_zones{$tokens[1]} = [ @tokens ];
    }
  }
  $teleport_zones{"Toxxulia Forest (Great Combine Spires)"} = [ "tox", "Toxxulia Forest (Great Combine Spires)", -910,-1522,-38,8 ];

  if ($text=~/hail/i) {
    if (quest::get_data($charKey . "-RecievedInitialSoulAnchor")) {
      plugin::NPCTell("Hail, traveler. I can transport you to the Great Spires of Toxxulia, or any of the locations that on the continent to which your soul has become attuned.");
    } else {
      plugin::NPCTell("Hail, traveler. I can transport you to the Great Spires of Toxxulia. Speak to Magus Obine on the central spire if you would like to travel to other locations.");
    }
    $client->Message(257, " ------- Select a Destination ------- ");
    
    foreach my $t (sort keys %teleport_zones) {
      $client->Message(257, "-> ".quest::saylink($teleport_zones{$t}[1],0,$t));
    }   
  } elsif (exists($teleport_zones{$text}[1])) {
    $client->MovePC(quest::GetZoneID($teleport_zones{$text}[0]),$teleport_zones{$text}[2],$teleport_zones{$text}[3],$teleport_zones{$text}[4],$teleport_zones{$text}[5]);
  }
}
