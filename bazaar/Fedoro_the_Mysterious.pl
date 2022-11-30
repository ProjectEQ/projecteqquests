sub EVENT_SAY {

    my $charKey = $client->CharacterID();
    my $charUnlockKey = $charKey . "-ClassUnlocksAvailable";
    my $unlocksAvailable = quest::get_data($charUnlockKey);
    my $unlockProgress = quest::get_data($charKey . "-ClassUnlockProgress");

    if ($text=~/hail/i) {
        if ($unlocksAvailable >= 1) {
            quest::message(15, "You have ". $unlocksAvailable . " class unlock points available.");
        }
        if (quest::get_data($charKey . "-CadricMet") >= 0) {
            plugin::NPCTell("Hail, ". $client->GetCleanName() ."! You look like an adventurer to me. If I'm [". quest::saylink("cad1a",1,"right") ."], we can be of great help to each other.");
        } else {
             plugin::NPCTell("Hail, ". $client->GetCleanName() .", good to see you again. Are you ready to do another [". quest::saylink("cad1c",1,"favor") ."] for me?");
        }
    } elsif ($text=~/cad1a/i) { #right
        plugin::NPCTell("Perfect! I have a unique talent - I can grant you the ability to shift your spirit, allowing you to pick up a different set of skills. You'll be as weak as 
                        newborn kitten at first, but only at first. Better yet, as you flex your new skills and regain experience, you'll find that many of your new abilities will carry
                        over to different aspects of your spirit. I can open up new [". quest::saylink("cad2b",1,"Classes") ."] for you to explore, but you'll need to do some [". 
                        quest::saylink("cad1c",1,"favors") ."] for me, first.");
    } elsif ($text=~/cad1b/i) { #Classes
        if ($unlocksAvailable < 1) {
            plugin::NPCTell("You'll need to accrue some [". quest::saylink("cad1c",1,"favors") ."] with me, if you want to open up a new class.");
        } else {
            plugin::NPCTell("Which class would you like to unlock?");

            if (!quest::get_data($charKey . "-Unlocked1")) {
                $client->Message(257,"[" . quest::saylink("Warrior",1) . "]");
            } else {
                quest::debug("how tho?");
            }
            
        }
    } elsif ($text=~/cad1c/i) { #Favors
        my $donatorCredits = quest::get_data($charKey . "-DonatorCreditAvailable");
        if ($donatorCredits > 0) {
            plugin::NPCTell("I feel like you've done me a favor, but I can't quite remember what. No matter, I'm willing to attune your soul to a new class");            
            quest::set_data($charKey . "-DonatorCreditAvailable", --$donatorCredits);

        } else {
            if ($unlockProgress < 1) {
                plugin::NPCTell("There are a number of minor artifacts that I've been keeping an eye out for. Bring me any one of these, and I will expand your soul's capabilities.");
                #TODO - Implement task
                # Manastone (Custom, Augment)
                # Glowing Black Stone (Customized, Augment)            
            } elsif ($unlockProgress < 2) {
                plugin::NPCTell("I ordered a particularly fine sushi from the tavernkeeper here in the Bazaar, but the man is missing a particular rare ingredient. Bring me the tentacle of a Kedge, and I'll be more than happy to open up your soul to new experiences.");
                #TODO - Implement task
                # Will need to kill Phinny, Naggy, Vox
            } elsif ($unlockProgress < 3) {
                plugin::NPCTell("I require the bones of a lich. Don't ask what for. Bring them to me.");
                #TODO - Implement task
                # Venril Sathir
                # Trakanon
                # Velious Kings in sequence
            } elsif ($unlockProgress < 4) {
                #TODO
                # Clear NTOV
                # Clear VP
            } elsif ($unlockProgress < 5) {
                #Glowing Orb of Luclinite
                #Complete VT key                
            } elsif ($unlockProgress < 6) {
                
            } elsif ($unlockProgress < 7) {
                
            } elsif ($unlockProgress < 8) {
                
            } elsif ($unlockProgress < 9) {
                
            } elsif ($unlockProgress < 10) {
                
            } elsif ($unlockProgress < 11) {
                
            } elsif ($unlockProgress < 12) {
                
            } elsif ($unlockProgress < 13) {
                
            } elsif ($unlockProgress < 14) {
                
            } elsif ($unlockProgress < 15) {
                
            } elsif ($unlockProgress < 16) {
                
            }
        }        
    }
} 


sub ADD_FAVOR_POINT {

    my $charKey = $client->CharacterID();
    my $charUnlockKey = $charKey . "-ClassUnlocksAvailable";
    my $unlocksAvailable = quest::get_data($charUnlockKey);
    my $unlockProgress = quest::get_data($charKey . "-ClassUnlockProgress");

    quest::set_data($charUnlockKey , ++$unlocksAvailable);
    quest::message(15, "You have gained a class unlock point!");
    quest::message(15, "You have ". $unlocksAvailable . " class unlock points available.");
    quest::ding();

}