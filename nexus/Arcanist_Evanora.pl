sub EVENT_SAY {

  my $mischief_visited = 0;
  my $fear_visited = 0;
  my $growth_visited = 0;

  if ($client->GetLevel() < 46) {
        plugin::NPCTell("Hail, ". $client->GetCleanName() .". You are not yet strong enough to survive the rigors of interplanar travel. Return to me when your soul has grown more experienced.");
  } elsif ($text=~/hail/i) {
    # This will need to be reworked for POP eventually.
    plugin::NPCTell("Hail, ". $client->GetCleanName() .". I can assist you in operating the main teleportation spires in order to [".quest::saylink("ae1",1,"reach other planes")."]. How can I help you?");
  } elsif ($text=~/ae1/i) {
    plugin::NPCTell("I'm capable of sending you to either [".quest::saylink("ae_hateplaneb",1,"The Plane of Hate")."] or [".quest::saylink("ae_airplane",1,"The Plane of Sky")."]. If you've already visited them using their permanent portals elsewhere in Norrath, I can also transport you to [".quest::saylink("ae_mischiefplane",1,"The Plane of Mischief")."], [".quest::saylink("ae_growth",1,"The Plane of Growth")."], or [".quest::saylink("ae_fearplane",1,"The Plane of Fear")."]. This transportation is not free, though; I require a fee of 5,000 platinum pieces for my time.");
  } elsif ($text=~/ae_hateplaneb/i) {
    plugin::NPCTell("Are you sure that you wish to be transported to [".quest::saylink("ae_transport",1,"The Plane of Hate")."]?");
    $client->SetBucket("evanora_target", "hateplaneb", 60);
  } elsif ($text=~/ae_fearplane/i) {
    plugin::NPCTell("Are you sure that you wish to be transported to [".quest::saylink("ae_transport",1,"The Plane of Fear")."]?");
    $client->SetBucket("evanora_target", "fearplane", 60);
  } elsif ($text=~/ae_airplane/i) {
    plugin::NPCTell("Are you sure that you wish to be transported to [".quest::saylink("ae_transport",1,"The Plane of Sky")."]?");
    $client->SetBucket("evanora_target", "airplane", 60);
  } elsif ($text=~/ae_growthplane/i) {
    plugin::NPCTell("Are you sure that you wish to be transported to [".quest::saylink("ae_transport",1,"The Plane of Growth")."]?");
    $client->SetBucket("evanora_target", "growthplane", 60);
  } elsif ($text=~/ae_mischiefplane/i) {
    plugin::NPCTell("Are you sure that you wish to be transported to [".quest::saylink("ae_transport",1,"The Plane of Mischief")."]?");
    $client->SetBucket("evanora_target", "mischiefplane", 60);
  } elsif ($text=~/ae_transport/i) { 
    if ($client->TakeMoneyFromPP(5000000, 1)) {
        my $target = $client->GetBucket("evanora_target");
        if ($target eq 'hateplaneb') {
            $client->MovePC(186, -393, 656, 4, 0);
        }
    } else {
        plugin::NPCTell("I'm sorry. You don't have enough money to pay my fee. Please return when you have 5,000 platinum pieces");
    }
  }
}