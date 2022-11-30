sub EVENT_SAY {

  my $charKey = $client->CharacterID() . "-TL";
  my $MAOcharKey = $client->CharacterID() . "-MAO-Progress";
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
    if (quest::get_data($MAOcharKey) <= 0) {
      plugin::NPCTell("Hail, traveler. You'll need to get permission to access the Nexus teleportation network. Speak to Magus Asorin on the central platform.");
    } else {
      plugin::NPCTell("Hail, traveler. I am Scion Dravis. I can transport you to the Great Spires of Toxxulia Forest, or any other location on Odus that you've discovered and become attuned to.");
      $client->Message(257, " ------- Select a Destination ------- ");    
      foreach my $t (sort keys %teleport_zones) {
        $client->Message(257, "-> ".quest::saylink($teleport_zones{$t}[1],0,$t));
      }
    }
  } elsif (exists($teleport_zones{$text}[1])) {
    $client->MovePC(quest::GetZoneID($teleport_zones{$text}[0]),$teleport_zones{$text}[2],$teleport_zones{$text}[3],$teleport_zones{$text}[4],$teleport_zones{$text}[5]);
  }
}
