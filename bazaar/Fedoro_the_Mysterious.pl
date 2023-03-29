my %class_abilities = (1  => 20001,
                       2  => 20002,
                       3  => 20003,
                       4  => 20004,
                       5  => 20005,
                       6  => 20006,
                       7  => 20007,
                       8  => 20008,
                       9  => 20009,
                       10 => 20010,
                       11 => 20011,
                       12 => 20012,
                       13 => 20013,
                       14 => 20014,
                       15 => 20015,
                       16 => 20016);

#List of Tasks. TaskID -> Completion Stage
#need to add it here and handle it inside cad1c
my %tasks = (38 => 3);

sub EVENT_SAY {

    my $unlocksAvailable = $client->GetBucket("ClassUnlocksAvailable");
    my $unlockProgress = $client->GetBucket("ClassUnlockProgress");

    if ($client->GetBucket("allClassesUnlocked") && $text=~/hail/i) {
            plugin::NPCTell("Hail, ". $client->GetCleanName() .", good to see you again. I've already opened your soul to the maximum extent, unlocking 
                             all of your classes. Feel free to buy me a drink, though!"); #TODO - ReInit all titles here
    } else {
        if ($text=~/hail/i) {
            while (my($k,$v) = each %tasks) {
                if ($client->IsTaskActivityActive($k, $v)) {
                    plugin::NPCTell("You've done a wonderful job. Consider your favor completed. Let me know when you'd like to [".quest::saylink("cad1b",1,"unlock a new class") ."].");
                    $client->UpdateTaskActivity($k, $v, 1);
                    $client->SetBucket("ClassUnlocksAvailable", ++$unlocksAvailable);
                    quest::message(335, "You have earned 1 class unlock point.");
                    quest::message(335, "You have ". $unlocksAvailable . " class unlock points available.");
                    $client->SetBucket("ClassUnlockProgress", $unlockProgress+1);
                    
                    return;
                }
            }
            if (true) {
                if ($unlocksAvailable) { } else {
                    $unlocksAvailable = 0;
                }
                quest::message(335, "You have ". $unlocksAvailable . " class unlock points available.");
                quest::message(335, "You have a permanent ".sprintf("%.2f", (100 - ($client->GetEXPModifier(0) * 100)))."%% XP penalty due to class unlocks.");
            }
            if (!$client->GetBucket("CadricMet")) {
                plugin::NPCTell("Hail, ". $client->GetCleanName() ."! You look like an adventurer to me. If I'm [". quest::saylink("cad1a",1,"right") ."], we can be of great help to each other.");
            } elsif ($unlocksAvailable < 1) {
                plugin::NPCTell("Hail, ". $client->GetCleanName() .", good to see you again. Are you ready to do another [". quest::saylink("cad1c",1,"favor") ."] for me?");
            } else {
                plugin::NPCTell("Hail, ". $client->GetCleanName() .", good to see you again. Do you need a new [". quest::saylink("cad1b",1,"class unlocked"). "], or are you ready to do another [". quest::saylink("cad1c",1,"favor") ."] for me?")
            }
        } elsif ($text=~/cad1a/i) { #right
            plugin::NPCTell("Perfect! I have a unique talent - I can grant you the ability to shift your spirit, allowing you to pick up a different set of skills. You'll be as weak as 
                            newborn kitten at first, but only at first. Better yet, as you flex your new skills and regain experience, you'll find that many of your new abilities will carry
                            over to different aspects of your spirit. Be warned, though - as you gain more potential in this way, you will begin to find it harder to earn new abilities.
                            I can open up new [". quest::saylink("cad1b",1,"classes") ."] for you to explore, but you'll need to do some [".quest::saylink("cad1c",1,"favors") ."] for me, first.");
            $client->SetBucket("CadricMet",1);
        } elsif ($text=~/cad1b/i) { #Classes
            if ($unlocksAvailable < 1) {
                plugin::NPCTell("You'll need to accrue some [". quest::saylink("cad1c",1,"favors") ."] with me, if you want to open up a new class.");            
            } else {            
                my @i = (1..16);
                my $unlockable_count = 0;
                my $out = "Which class would you like to unlock? It looks like I could open up any one of";
                for (@i) {
                    if (!$client->GetBucket("class-".$_."-unlocked") && $client->GetClass() != $_ && $_ != 1 && $_ != 7 && $_ != 8 && $_ != 9 && $_ != 12 && $_ != 16 ) {
                        $out = $out . " [". quest::saylink("unlock-".$_,1,quest::getclassname($_))."],";
                        $unlockable_count++;
                    }
                }
                if ($unlockable_count == 0) {
                    plugin::NPCTell("It looks like you've already unlocked all of the classes. Congrats!");
                    $client->SetBucket("allClassesUnlocked", 1);
                    return;
                } 
                chop($out);
                plugin::NPCTell( $out . " for you." );
            }
        } elsif ($text=~/cad1c/i) { #Favors
            my $unlockTaskProgress = $client->GetBucket("ClassUnlockTaskProgress");
            #Feats of Strength - Antonica
            if ($client->GetLevel() < 52) {
                plugin::NPCTell("Return to me when you have grown more powerful, then we can talk about such things.");
            } elsif ($unlockProgress < 1 and $client->GetLevel() > 52) {
                plugin::NPCTell("First things first; I need you to prove to me that you have what it takes to walk this path. Complete three Feats of Strength - Slay Lord Nagafen, Lady Vox, and Phinigel Autropos in single combat, then return to me.");
                $client->AssignTask(38);
                if ($client->GetBucket("FOS-Nagafen")) {
                    $client->UpdateTaskActivity(38, 0, 1);
                }
                if ($client->GetBucket("FOS-Vox")) {
                    $client->UpdateTaskActivity(38, 1, 1);
                }
                if ($client->GetBucket("FOS-Phinigel")) {
                    $client->UpdateTaskActivity(38, 2, 1);
                }
            } else {
                plugin::NPCTell("I have no further tasks for you at the moment.");
            }
            
        } elsif ($text=~/unlock-/i) {
            if (length($text) > 7) {
                my $cid = substr($text,7);            
                if ($cid <= 16 && $client->GetClass() != $cid && $unlocksAvailable > 0) {
                    my $class_name = quest::getclassname($cid);
                    plugin::NPCTell("Are you sure that you want to become a [". quest::saylink("confirm-".$cid,1,$class_name) ."]? You will recieve a permanent experience penalty.");
                }
            }        
        } elsif ($text=~/confirm-/i) {
            if (length($text) > 8) {
                my $cid = substr($text,8);
                if ($cid <= 16 && $client->GetClass() != $cid && $unlocksAvailable > 0 && !$client->GetBucket("class-".$cid."-unlocked")) {
                    quest::message(335, "You spent 1 class unlock point.");
                    
                    #Check for existing class unlock
                    if (!$client->GetBucket("class-".$client->GetClass()."-unlocked")) {
                        $client->SetBucket("class-".$client->GetClass()."-unlocked",1);
                        quest::debug("unlocking ".$client->GetClass());
                        quest::debug("granting ".$class_abilities{$client->GetClass()});
                        $client->GrantAlternateAdvancementAbility($class_abilities{$client->GetClass()}, 1);
                    }
                    $client->SetBucket("class-".$cid."-unlocked",1);
                    $client->SetBucket("ClassUnlocksAvailable", --$unlocksAvailable);
                    $client->GrantAlternateAdvancementAbility($class_abilities{$cid}, 1);
                    $client->SetEXPModifier(0, ($client->GetEXPModifier(0) * 0.90));

                    quest::message(335, "You have gained a permanent experience penalty. You will now earn ".sprintf("%.2f", ($client->GetEXPModifier(0) * 100))."%% as much experience as normal.");
                    
                    #This section for recording server-first bragging rights\leaderboard.
                    my $most_unlocks = quest::get_data("world-class-unlock-leader");
                    my $most_unlocks_count = quest::get_data("world-class-unlock-leader-count");

                    if (!$most_unlocks || !$most_unlocks_count) {
                        quest::worldwidemessage(335, $client->GetCleanName() . " is the first player to unlock an additional class (" . $client->GetClassName()."->".quest::getclassname($cid).")!");
                        quest::set_data("world-class-unlock-leader", $client->GetCleanName());
                        quest::set_data("world-class-unlock-leader-count", 14);
                    } else {
                        my @i = (1..16);
                        my $unlockable_count = 0;
                        for (@i) {
                            if (!$client->GetBucket("class-".$_."-unlocked") && $client->GetClass() != $_) {                    
                                $unlockable_count++;
                            }                 
                        }                    
                        if ($unlockable_count == $most_unlocks_count) {
                            quest::worldwidemessage(335, $client->GetCleanName() . " has tied with " . $most_unlocks . " for class-unlock leader!");
                        } elsif ($unlockable_count <= $most_unlocks_count) {
                            if ($most_unlocks ne $client->GetCleanName()) {
                                quest::worldwidemessage(335, $client->GetCleanName() . " has defeated with " . $most_unlocks . " for class-unlock leader!");                            
                            } else {
                                quest::worldwidemessage(335, $client->GetCleanName() . " has beaten their own record for class-unlock leader!");
                            }
                            quest::set_data("world-class-unlock-leader", $client->GetCleanName());
                            quest::set_data("world-class-unlock-leader-count", $unlockable_count);                  
                        }
                        if ($unlockable_count == 0) {
                            
                            if (!quest::get_data("world-class-unlock-all")) {
                                quest::worldwidemessage(335, $client->GetCleanName() . " is the first player to unlock all classes!");
                                quest::set_data("world-class-unlock-all", $client->GetCleanName());
                                #TODO - SERVER FIRST TITLE
                            } else {
                                quest::worldwidemessage(335, $client->GetCleanName() . " has successfully unlocked all classes.");                                
                            }
                            $client->SetBucket("allClassesUnlocked", 1);
                        }
                    }
                }
            }
        }
    }

    #Titles
    my @i = (1..16);
    my $unlockable_count = 0;
    for (@i) {
        if (!$client->GetBucket("class-".$_."-unlocked") && $client->GetClass() != $_) {                    
            $unlockable_count++;
        }                 
    }
    my $unlockable_count = 16 - $unlockable_count;
    quest::debug($unlockable_count);

    if ($unlockable_count >= 3) {
        quest::enabletitle(396);
    }
    if ($unlockable_count >= 8) {
        quest::enabletitle(397);
    }
    if ($unlockable_count >= 12) {
        quest::enabletitle(398);
    }
    if ($unlockable_count >= 16) {
        quest::enabletitle(399);
    }
    if ($client->GetBucket("class-11-unlocked") &&
        $client->GetBucket("class-12-unlocked") &&
        $client->GetBucket("class-13-unlocked") &&
        $client->GetBucket("class-14-unlocked")) {
        quest::enabletitle(400);
    }
    if ($client->GetBucket("class-1-unlocked") &&
        $client->GetBucket("class-3-unlocked") &&
        $client->GetBucket("class-4-unlocked") &&
        $client->GetBucket("class-5-unlocked") &&
        $client->GetBucket("class-8-unlocked") &&
        $client->GetBucket("class-9-unlocked") &&
        $client->GetBucket("class-16-unlocked")) {
        quest::enabletitle(401);
    }
} 