sub EVENT_SAY {

    my $charKey = $client->CharacterID();
    my $charUnlockKey = $charKey . "-ClassUnlocksAvailable";
    my $unlocksAvailable = quest::get_data($charUnlockKey);

    if ($text=~/hail/i) {
        if ($unlocksAvailable >= 1) {
            quest::message(15, "You have ". $unlocksAvailable . " class unlock points available.");
        }
        if (quest::get_data($charKey . "-CadricMet") >= 0) {
            plugin::NPCTell("Hail, ". $client->GetCleanName() ."! You look like an adventurer to me. If I'm [". quest::saylink("cad1a",1," right") ."], we can be of great help to each other.");
        } else {
             plugin::NPCTell("Hail, ". $client->GetCleanName() .", good to see you again. Are you ready to do another [". quest::saylink("cad1c",1,"favor") ."] for me?");
        }
    } elsif ($text=~/cad1a/i) { #right
        plugin::NPCTell("Perfect! I have a unique talent - I can grant you the ability to shift your spirit, allowing you to pick up a different set of skills. You'll be as weak as 
                        newborn kitten at first, but only at first. Better yet, as you flex your new skills and regain experience, you'll find that many of your new abilities will carry
                        over to different aspects of your spirit. I can open up new [". quest::saylink("cad2b",1,"Classes") ."] for you to explore, but you'll need to do some [". 
                        quest::saylink("cad1c",1,"favors") ."] for me, first.");
    } elsif ($text=~/cad1b/i) { #Classes

    } elsif ($text=~/cad1c/i) { #Favors
        my $donatorCredits = quest::get_data($charKey . "-DonatorCreditAvailable");
        if ($donatorCredits) {
            plugin::NPCTell("I feel like you've done me a favor, but I can't quite remember what. No matter, I'm willing to attune your soul to a new class");
            quest::set_data($charUnlockKey , ++$unlocksAvailable);
            quest::set_data(--$donatorCredits);
            quest::message(15, "You have gained a class unlock point!");
            quest::message(15, "You have ". $unlocksAvailable . " class unlock points available.");
            quest::ding();
        } 
        plugin::NPCTell("");
    } 
}