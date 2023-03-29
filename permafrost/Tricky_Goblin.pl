sub EVENT_SAY {

    my @Data = ("permafrost", 73, -204, 723, -38, 161);
    my $instance_zone = $client->GetBucket("active-instance-zone");
    my $instance_id = $client->GetBucket("active-instance-id");
    my $instance_cooldown = $client->GetBucket($Data[0] . "-cooldown");

    my $instance_duration = 72000;

    if ($text=~/hail/i) {
        plugin::NPCTell("Oooo. Big-strong-adventurer. [".quest::saylink("fs_1", 1, "Stronger")."] ahead. You kill?");
    } elsif ($text=~/fs_1/i) {
        if ($instance_cooldown) {
            $client->Message(15,"Lockout Remaining:" . quest::secondstotime($client->GetBucketRemaining($Data[0] . "-cooldown")));
            plugin::NPCTell("No-no. Stronger not here yet. Wait.");
        } else {
            plugin::NPCTell("Strong-strong. Must kill alone. [".quest::saylink("fs_2", 1, "go")."]?");
        }        
    } elsif ($text=~/fs_2/i) {
        if ($instance_cooldown) {
            plugin::NPCTell("No-no. Stronger not here yet. Wait."); 
        } else {
            my $instance_id = quest::CreateInstance($Data[0], 1, $instance_duration);
            $client->SetBucket($Data[0] . "-cooldown", 1, ($instance_duration/10));
            $client->SetBucket("active-instance-zone", $Data[0], $instance_duration);
            $client->SetBucket("active-instance-id", $instance_id, $instance_duration);

            $client->Message(15,"You have embarked upon a Feat of Strength! Defeat your enemies without assistance to recieve a reward!");

            $client->AssignToInstance($instance_id);
            $client->MovePCInstance($Data[1], $instance_id, $Data[2], $Data[3], $Data[4], $Data[5]);
        }

    }
}