sub EVENT_KILLED_MERIT {
    if ($instanceversion = 1 and $instanceid) {
        if ($client->GetBucket("FOS-Vox")) {
            $client->Message(15,"You have completed this Feat of Strength! You have already been awarded for this achivement.");
        } else {
            $client->SetBucket("FOS-Vox", 1);
            $client->Message(15,"You have completed this Feat of Strength!");
            $client->AddAAPoints(5);
            quest::worldwidemessage(15, "The brave adventurer " . $client->GetCleanName() . " has completed the Feat of Strength - Slay Lady Vox.");
            $client->UpdateTaskActivity(38, 1, 1);
        }
    }
}