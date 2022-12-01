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

my %tasks = (37 => 2);
                       
sub EVENT_SAY {

    my $unlocksAvailable = $client->GetBucket("ClassUnlocksAvailable");
    my $unlockProgress = $client->GetBucket("ClassUnlockProgress");

    if ($text=~/hail/i) {
        while (my($k,$v) = each %tasks) {
            if ($client->IsTaskActivityActive($k, $v)) {
                plugin::NPCTell("You've done a wonderful job. Consider your favor completed. Let me know when you'd like to [".quest::saylink("cad1b",1,"unlock a new class") ."].");
                $client->UpdateTaskActivity($k, $v, 1);
                $client->SetBucket("ClassUnlocksAvailable", ++$unlocksAvailable);
                quest::message(315, "You have earned 1 class unlock point.");
                quest::message(315, "You have ". $unlocksAvailable . " class unlock points available.");
                return;
            }
        }
        if ($unlocksAvailable >= 1) {
            quest::message(315, "You have ". $unlocksAvailable . " class unlock points available.");
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
            chop($out);
            plugin::NPCTell( $out . " for you." );
        }
    } elsif ($text=~/cad1c/i) { #Favors
        my $activeTask = 0;
        foreach my $task (keys %tasks) {
            if ($client->IsTaskActive($task)) {
                $activeTask = 1;
            }
        }
        if ($activeTask) {
            plugin::NPCTell("I've already given you a task to perform for me. Return when you've completed it.");
        } else {
            if (!$client->IsTaskCompleted(37)) {
                plugin::NPCTell("There are a number of minor artifacts that I've been keeping an eye out for. Bring them to me, and I will expand your soul's capabilities.");
                $client->AssignTask(37);
            }
        }
    } elsif ($text=~/unlock-/i) {
        if (length($text) > 7) {
            my $cid = substr($text,7);            
            if ($cid <= 16 && $client->GetClass() != $cid && $unlocksAvailable > 0) {
                my $class_name = quest::getclassname($cid);
                plugin::NPCTell("Are you sure that you want to become a [". quest::saylink("confirm-".$cid,1,$class_name) ."]?");
            }
        }        
    } elsif ($text=~/confirm-/i) {
        if (length($text) > 8) {
            my $cid = substr($text,8);
            quest::debug($cid);
            if ($cid <= 16 && $client->GetClass() != $cid && $unlocksAvailable > 0) {
                quest::message(315, "You spent 1 class unlock point.");
                #Check for existing class unlock
                if (!$client->GetBucket("class-".$client->GetClass()."-unlocked")) {
                    $client->SetBucket("class-".$client->GetClass()."-unlocked",1);
                    $client->GrantAlternateAdvancementAbility($class_abilities{$client->GetClass()}, 1);
                }
                $client->SetBucket("class-".$cid."-unlocked",1);
                $client->SetBucket("ClassUnlocksAvailable", --$unlocksAvailable);
                $client->GrantAlternateAdvancementAbility($class_abilities{$cid}, 1);
            }
        }
    }
} 