sub EVENT_SAY {

  my $charKey = $client->CharacterID() . "-TL";
  my $MAOcharKey = $client->CharacterID() . "-MAO-Progress";
  my $charTargetsString = quest::get_data($charKey . "-V");
  my %teleport_zones = ();
  
  my @zones = split /:/, $charTargetsString;
  foreach $z (@zones) {      
    my @tokens = split /,/, $z;
    if ($tokens[1] ne '') {
      $teleport_zones{$tokens[1]} = [ @tokens ];
    }
  }

  $teleport_zones{"The Great Divide (Great Combine Spires)"} = [ "greatdivide", "The Great Divide (Great Combine Spires)", -2700, -1860, -44, 253 ];

  if ($text=~/hail/i) {
    if (quest::get_data($MAOcharKey) <= 0) {
      plugin::NPCTell("Hail, traveler. You'll need to get permission to access the Nexus teleportation network. Speak to Magus Asorin on the central platform.");
    } else {
      plugin::NPCTell("Hail, traveler. I can transport you to the Great Spires of Velious, or any other location on that frozen wasteland that you've previously visited.");
      $client->Message(257, " ------- Select a Destination ------- ");    
      foreach my $t (sort keys %teleport_zones) {
        $client->Message(257, "-> ".quest::saylink($teleport_zones{$t}[1],0,$t));
      }
    }
  } elsif (exists($teleport_zones{$text}[1])) {
    $client->MovePC(quest::GetZoneID($teleport_zones{$text}[0]),$teleport_zones{$text}[2],$teleport_zones{$text}[3],$teleport_zones{$text}[4],$teleport_zones{$text}[5]);
  }
}
