#Scripted by Jaekob, PEQ Quest Team
#altar number door id 17-22
#17 left/counterclockwise
#statue number door id 23-34
#each temple is left to right numbers starting on left
#except temple two which is r to l

my $question = 0;
my $theme_question = 0;

sub EVENT_ENTERZONE {
  if (!defined $qglobals{primaldoor}) {
    #lock the primal door if it is unlocked and the quest global has expired.
    if ($entity_list->FindDoor(16)->GetLockPick() == 0) {
      $entity_list->FindDoor(16)->SetLockPick(-1);
    }
  } else {
    #unlock the primal door if it is locked and the global has not expired yet
    if ($entity_list->FindDoor(16)->GetLockPick() == -1) {
      $entity_list->FindDoor(16)->SetLockPick(0);
    }
  }
}

sub EVENT_CLICKDOOR {
  if ($doorid == 35 || $doorid == 36) { #uqua zone in
    my $InInstanceUqua = quest::GetInstanceID("uqua",0);
    if(!defined $qglobals{uqualockout}) {
      if($InInstanceUqua > 0){
        quest::MovePCInstance(292,$InInstanceUqua,-17,-7,-24);
      } else {
        $client->Message(13, "You are not a part of an instance!");
      }
    } else {
      $client->Message(13, "You have recently completed this raid, please come back at a later point");
    }
  } elsif(($doorid == 17) && ($yxtta_door == 0)) {
    $yxtta_door = 1;
    ASK_QUESTION();
  } elsif(($doorid == 18) && ($yxtta_door == 0)) {
    $yxtta_door = 1;
    ASK_QUESTION();
  } elsif(($doorid == 19) && ($yxtta_door == 0)) {
    $yxtta_door = 1;
     ASK_QUESTION();
  } elsif(($doorid == 20) && ($yxtta_door == 0)) {
    $yxtta_door = 1;
    ASK_QUESTION();
  } elsif(($doorid == 21) && ($yxtta_door == 0)) {
    $yxtta_door = 1;
    ASK_QUESTION();
  } elsif(($doorid == 22) && ($yxtta_door == 0)) {
    $yxtta_door = 1;
    ASK_QUESTION();
  } elsif(($doorid == 24) && ($yxtta_door == 1)) {
    if($question == 1) {
      $door += 1;   #door trigger
      ASK_QUESTION();
    } else {
      $attack += 1;   #trigger attack squad
      if($attack == 3) {
        STONE_ATTACK();
      }
    }
  } elsif(($doorid == 23) && ($yxtta_door == 1)) {
    if($question == 2) {
      $door += 1;  #door trigger
      ASK_QUESTION();
    } else {
      $attack += 1;   #trigger attack squad
      if($attack == 3) {
        STONE_ATTACK();
      }
    }
  } elsif(($doorid == 25) && ($yxtta_door == 1)) {
    if($question == 3) {
      $door += 1;   #door trigger
      ASK_QUESTION();
    } else {
      $attack += 1;   #trigger attack squad
      if($attack == 3) {
        STONE_ATTACK();
      }
    }
  } elsif(($doorid == 26) && ($yxtta_door == 1)) {
    if($question == 4) {
      $door += 1;   #door trigger
      ASK_QUESTION();
    } else {
      $attack += 1;   #trigger attack squad
      if($attack == 3) {
        STONE_ATTACK();
      }
    }
  } elsif(($doorid == 28) && ($yxtta_door == 1)) {
    if($question == 5) {
      $door += 1;   #door trigger
      ASK_QUESTION();
    } else {
      $attack += 1;   #trigger attack squad
      if($attack == 3) {
        STONE_ATTACK();
      }
    }
  } elsif(($doorid == 27) && ($yxtta_door == 1)) {
    if($question == 6) {
      $door += 1;   #door trigger
      ASK_QUESTION();
    } else {
      $attack += 1;   #trigger attack squad
      if($attack == 3) {
        STONE_ATTACK();
      }
    }
  } elsif(($doorid == 30) && ($yxtta_door == 1)) {
    if($question == 7) {
      $door += 1;   #door trigger
      ASK_QUESTION();
    } else {
      $attack += 1;   #trigger attack squad
      if($attack == 3) {
        STONE_ATTACK();
      }
    }
  } elsif(($doorid == 29) && ($yxtta_door == 1)) {
    if($question == 8) {
      $door += 1;   #door trigger
      ASK_QUESTION();
    } else {
      $attack += 1;   #trigger attack squad
      if($attack == 3) {
        STONE_ATTACK();
      }
    }
  } elsif(($doorid == 32) && ($yxtta_door == 1)) {
    if($question == 9) {
      $door += 1;   #door trigger
      ASK_QUESTION();
    } else {
      $attack += 1;   #trigger attack squad
      if($attack == 3) {
        STONE_ATTACK();
      }
    }
  } elsif(($doorid == 31) && ($yxtta_door == 1)) {
    if($question == 10) {
      $door += 1;   #door trigger
      ASK_QUESTION();
    } else {
      $attack += 1;   #trigger attack squad
      if($attack == 3) {
        STONE_ATTACK();
      }
    }
  } elsif(($doorid == 34) && ($yxtta_door == 1)) {
    if($question == 11) {
      $door += 1;   #door trigger
      ASK_QUESTION();
    } else {
      $attack += 1;   #trigger attack squad
      if($attack == 3) {
        STONE_ATTACK();
      }
    }
  } elsif(($doorid == 33) && ($yxtta_door == 1)) {
    if($question == 12) {
      $door += 1;   #door trigger
      ASK_QUESTION();
    } else {
      $attack += 1;   #trigger attack squad
      if($attack == 3) {
        STONE_ATTACK();
      }
    }
  }
}

sub STONE_ATTACK {
  my $silent_monolith = $entity_list->GetMobByNpcTypeID(291005);
  if ($silent_monolith) {
    my $hate_silent_monolith = $silent_monolith->CastToNPC();
    $hate_silent_monolith->AddToHateList($client, 1, 0, true);
  }
}

sub ASK_QUESTION {
  if($door == 12) {
    quest::targlobal("primaldoor",0,"M210",0,0,291);
    $entity_list->FindDoor(16)->SetLockPick(0);
    $client->Message(15,"The pathway is now clear, but your time is limited.");
  }
  $theme_question = int(rand(3)) + 1;
  if(($theme_question == 1) && ($door <=11)) {
    $question = int(rand(12)) +1;
    if($question == 1) {
      $client->Message(15,"Beginning new, the months refreshed, they youngest of us, I am but a babe.");
    } elsif($question == 2) {
      $client->Message(15,"I am second of us, but not the least, it is time that tells all, i hear it next.");
    } elsif($question == 3) {
      $client->Message(15,"I am 6 under noon."); 
    } elsif($question == 4) {
      $client->Message(15,"If time flies, add are to thee then move on to me."); 
    } elsif($question == 5) {
      $client->Message(15,"If my clock had your digits, I would be this.");
    } elsif($question == 6) {
      $client->Message(15,"You may find yourself in a pinch, should you fail to sea my sign.");
    } elsif($question == 7) {
      $client->Message(15,"Half past six, there are no tricks");
    } elsif($question == 8) {
      $client->Message(15,"My time is at the end of light and the edge of night");
    } elsif($question == 9) {
      $client->Message(15,"The river flows to be cradled in the sea. Time flows, but is lost. when is it devoured.");
    } elsif($question == 10) {
      $client->Message(15,"I am the hour that exists betwixt twice two primes.");
    } elsif($question == 11) {
      $client->Message(15,"It is your style and your gnomon that will help you find me. I am the hour of the sum of the constituents of relative term of terms.");
    } elsif($question == 12) {
      $client->Message(15,"I come last and in number am the greatest, yet when I have passed and all of my kind haven ended, I return in part in the number that follows me.");
    }
  }
  if(($theme_question == 2) && ($door <=11)) {
    $question = int(rand(12)) +1;
    if($question == 1) {
      $client->Message(15,"As far as needle is concerned. I am indeed in the right, and only just.");
    } elsif($question == 2) {
      $client->Message(15,"The lodestone seeks me not, but always drifts near, as near as the sunrise.");
    } elsif($question == 3) {
      $client->Message(15,"Read your lodestone and you will find that I am sinister of the sunrise, but only just.");
    } elsif($question == 4) {
      $client->Message(15,"Where your magnet points I will not be found. Seek me just beyond the sunrise.");
    } elsif($question == 5) {
      $client->Message(15,"I can bear a load of any stone, but have only one eye to see. Remove the of the majority of the eye from what you see.");
    } elsif($question == 6) {
      $client->Message(15,"You lay arrow straight, your face to face, find me at your right foot.");
    } elsif($question == 7) {
      $client->Message(15,"Spin you compass as you will, I shall be the rear still.");
    } elsif($question == 8) {
      $client->Message(15,"Be certain of your heading and make for the place twixt the sunset and the tail of the lodestone.");
    } elsif($question == 9) {
      $client->Message(15,"Face the setting sun and you will feel the heat of my presence. You grow colder as you follow guidance of the lodestone.");
    } elsif($question == 10) {
      $client->Message(15,"My aged father is the sun, my least cousin the lodestone.");
    } elsif($question == 11) {
      $client->Message(15,"When the needle is lessened by a triple net of degrees you shall find me.");
    } elsif($question == 12) {
      $client->Message(15,"If you are disarmed, watch your blade fall. Where it leads will answer all.");
    }
  }
  if(($theme_question == 3) && ($door <=11)) {
    $question = int(rand(12)) +1;
    if($question == 1) {
      $client->Message(15,"With the sun at its highest, everyone takes refuge. I am the first to come out after the time of rest.");
    } elsif($question == 2) {
      $client->Message(15,"Of thrushar I am the loved the most. To find me, you must understand the element and know the signs.");
    } elsif($question == 3) {
      $client->Message(15,"Trushor's servant of tail and fin, I am their sign. Seek me within.");
    } elsif($question == 4) {
      $client->Message(15,"Peril I am not, Remove the second in me and give me the first in aid, and with but little confusion I can be found");
    } elsif($question == 5) {
      $client->Message(15,"As each month passes, so I may");
    } elsif($question == 6) {
      $client->Message(15,"Seeking news of me, up and down. Tradition has me down, but the rising sun uplifts my spirits ever so slightly.");
    } elsif($question == 7) {
      $client->Message(15,"I am the month of a pair and hand.");
    } elsif($question == 8) {
      $client->Message(15,"If our schedules match, you shall find me in the most dignified company.");
    } elsif($question == 9) {
      $client->Message(15,"Creatures of Trushar are often protected by those that are my symbol.");
    } elsif($question == 10) {
      $client->Message(15,"I am eight in name, but not in sequence");
    } elsif($question == 11) {
      $client->Message(15,"I am the month that brings most of somthing new and a large portion of reminiscences.");
    } elsif($question == 12) {
      $client->Message(15,"When brightest day and darkest night are indistinguishable.");
    }
  }
}