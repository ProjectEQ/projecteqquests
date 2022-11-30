my %class_abilities = (1  => 30196,
                       2  => 30197,
                       3  => 30198,
                       4  => 30199,
                       5  => 30200,
                       6  => 30201,
                       7  => 30202,
                       8  => 30203,
                       9  => 30204,
                       10 => 30205,
                       11 => 30206,
                       12 => 30207,
                       13 => 30208,
                       14 => 30209,
                       15 => 30210,
                       16 => 30211);


sub EVENT_SAY {

    my $unlocksAvailable = $client->GetBucket("ClassUnlocksAvailable");
    my $unlockProgress = $client->GetBucket("ClassUnlockProgress");

    if ($text=~/hail/i) {
        if ($unlocksAvailable >= 1) {
            quest::message(15, "You have ". $unlocksAvailable . " class unlock points available.");
        }
        if (!$client->GetBucket("CadricMet")) {
            plugin::NPCTell("Hail, ". $client->GetCleanName() ."! You look like an adventurer to me. If I'm [". quest::saylink("cad1a",1,"right") ."], we can be of great help to each other.");
        } else {
             plugin::NPCTell("Hail, ". $client->GetCleanName() .", good to see you again. Are you ready to do another [". quest::saylink("cad1c",1,"favor") ."] for me?");
        }
    } elsif ($text=~/cad1a/i) { #right
        plugin::NPCTell("Perfect! I have a unique talent - I can grant you the ability to shift your spirit, allowing you to pick up a different set of skills. You'll be as weak as 
                        newborn kitten at first, but only at first. Better yet, as you flex your new skills and regain experience, you'll find that many of your new abilities will carry
                        over to different aspects of your spirit. I can open up new [". quest::saylink("cad1b",1,"classes") ."] for you to explore, but you'll need to do some [". 
                        quest::saylink("cad1c",1,"favors") ."] for me, first.");
    } elsif ($text=~/cad1b/i) { #Classes
        if ($unlocksAvailable < 1) {
            plugin::NPCTell("You'll need to accrue some [". quest::saylink("cad1c",1,"favors") ."] with me, if you want to open up a new class.");            
        } else {            
            my @i = (1..16);
            my $out = "Which class would you like to unlock? It looks like I could open up any one of";
            for (@i) {
                if (!$client->GetBucket("class-".$_."-unlocked") && $client->GetClass() != $_) {
                    $out = $out . " [". quest::saylink("unlock-".$_,1,quest::getclassname($_))."],";
                }
            } 
            plugin::NPCTell(chop($out) . " for you." );
        }
    } elsif ($text=~/cad1c/i) { #Favors        
        if ($unlockProgress < 1) {
            plugin::NPCTell("There are a number of minor artifacts that I've been keeping an eye out for. Bring me any one of these, and I will expand your soul's capabilities.");
            #TODO - Implement task
            # Manastone (Custom, Augment)
            # Glowing Black Stone (Customized, Augment)
            #$client->SetBucket("ClassUnlocksAvailable", ++$unlocksAvailable);
            #quest::message(15, "You have gained a class unlock point!");
            #quest::message(15, "You have ". $unlocksAvailable . " class unlock points available.");
            #quest::ding();            
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
    } elsif ($text=~/unlock-1/i) {
        if ($client->GetClass() != 1 && $unlocksAvailable > 0) {
            plugin::NPCTell("Ah, yes. The Warrior class. Expert front-line combatant, able to both absorb and deal devastating melee blows. Are you sure that you want to become a ["
                            . quest::saylink("confirm-warrior",1,"Warrior") . "]?");
        }
    } elsif ($text=~/confirm-warrior/i) {
        if ($client->GetClass() != 1 && $unlocksAvailable > 0) {

            #Check for existing class unlock
            if (!$client->GetBucket("class-".$client->GetClass()."-unlocked")) {
                $client->SetBucket("class-".$client->GetClass()."-unlocked",1);
                $client->GrantAlternateAdvancementAbility($class_abilities{$client->GetClass()}, 1);
            }

            $client->SetBucket("class-1-unlocked",1);
            $client->SetBucket("ClassUnlocksAvailable", --$unlocksAvailable);
            $client->GrantAlternateAdvancementAbility($class_abilities{1}, 1);
        }
    }
} 