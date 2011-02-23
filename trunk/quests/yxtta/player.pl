#Scripted by Jaekob, PEQ Quest Team
#altar number door id 17-22
#17 left/counterclockwise
#statue number door id 23-34
#each temple is left to right numbers starting on left
#except temple two which is r to l


my $question = 0;
my $theme_question = 0;

sub EVENT_CLICKDOOR {
if(($doorid == 17) && ($yxtta_door == 0)) {
  $yxtta_door = 1;
  ASK_QUESTION();
}
if(($doorid == 18) && ($yxtta_door == 0)) {
  $yxtta_door = 1;
   ASK_QUESTION();
}
if(($doorid == 19) && ($yxtta_door == 0)) {
  $yxtta_door = 1;
   ASK_QUESTION();
}
if(($doorid == 20) && ($yxtta_door == 0)) {
  $yxtta_door = 1;
   ASK_QUESTION();
}
if(($doorid == 21) && ($yxtta_door == 0)) {
  $yxtta_door = 1;
   ASK_QUESTION();
}
if(($doorid == 22) && ($yxtta_door == 0)) {
  $yxtta_door = 1;
   ASK_QUESTION();
}
if(($doorid == 24) && ($yxtta_door == 1)) {
    if($question == 1) {
      $door += 1;   #door trigger
       ASK_QUESTION();
    }
    else {
    $attack += 1;   #trigger attack squad
	if($attack == 3) {
	  STONE_ATTACK();
        }
    }
}
if(($doorid == 23) && ($yxtta_door == 1)) {
    if($question == 2) {
      $door += 1;  #door trigger
       ASK_QUESTION();
    }
    else {
    $attack += 1;   #trigger attack squad
	if($attack == 3) {
	  STONE_ATTACK();
        }
    }
}
if(($doorid == 25) && ($yxtta_door == 1)) {
    if($question == 3) {
      $door += 1;   #door trigger
       ASK_QUESTION();
    }
    else {
    $attack += 1;   #trigger attack squad
	if($attack == 3) {
	  STONE_ATTACK();
	}
    }
}
if(($doorid == 26) && ($yxtta_door == 1)) {
    if($question == 4) {
      $door += 1;   #door trigger
       ASK_QUESTION();
    }
    else {
    $attack += 1;   #trigger attack squad
	if($attack == 3) {
	  STONE_ATTACK();
	}
    }
}
if(($doorid == 28) && ($yxtta_door == 1)) {
    if($question == 5) {
      $door += 1;   #door trigger
       ASK_QUESTION();
    }
    else {
     $attack += 1;   #trigger attack squad
	if($attack == 3) {
	  STONE_ATTACK();
	}
    }
}
if(($doorid == 27) && ($yxtta_door == 1)) {
    if($question == 6) {
      $door += 1;   #door trigger
       ASK_QUESTION();
    }
    else {
    $attack += 1;   #trigger attack squad
	if($attack == 3) {
	  STONE_ATTACK();
	}
    }
}
if(($doorid == 30) && ($yxtta_door == 1)) {
    if($question == 7) {
      $door += 1;   #door trigger
       ASK_QUESTION();
    }
    else {
    $attack += 1;   #trigger attack squad
	if($attack == 3) {
	  STONE_ATTACK();
	}
    }
}
if(($doorid == 29) && ($yxtta_door == 1)) {
    if($question == 8) {
      $door += 1;   #door trigger
       ASK_QUESTION();
    }
    else {
    $attack += 1;   #trigger attack squad
	if($attack == 3) {
	  STONE_ATTACK();
	}
    }
}
if(($doorid == 32) && ($yxtta_door == 1)) {
    if($question == 9) {
      $door += 1;   #door trigger
       ASK_QUESTION();
    }
    else {
    $attack += 1;   #trigger attack squad
	if($attack == 3) {
	  STONE_ATTACK();
	}
    }
}
if(($doorid == 31) && ($yxtta_door == 1)) {
    if($question == 10) {
      $door += 1;   #door trigger
       ASK_QUESTION();
    }
    else {
     $attack += 1;   #trigger attack squad
	if($attack == 3) {
	  STONE_ATTACK();
	}
    }
}
if(($doorid == 34) && ($yxtta_door == 1)) {
    if($question == 11) {
      $door += 1;   #door trigger
       ASK_QUESTION();
    }
    else {
    $attack += 1;   #trigger attack squad
	if($attack == 3) {
	  STONE_ATTACK();
	}
    }
}
if(($doorid == 33) && ($yxtta_door == 1)) {
    if($question == 12) {
      $door += 1;   #door trigger
       ASK_QUESTION();
    }
    else {
    $attack += 1;   #trigger attack squad
	if($attack == 3) {
	  STONE_ATTACK();
	}
    }
}
if($doorid == 16) {
    if((defined $qglobals{primaldoor}) && ($qglobals{primaldoor} == 1)) {
       quest::forcedooropen(16);
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
  quest::setglobal("primaldoor",1,3,"M210");
  $client->Message(15,"The pathway is now clear, but your time is limited.");
}
    $theme_question = int(rand(3)) + 1;
    if(($theme_question == 1) && ($door <=11)) {
      $question = int(rand(12)) +1;
	if($question == 1) {
	  $client->Message(15,"Beginning new, the months refreshed, they youngest of us, I am but a babe.");
	}
	if($question == 2) {
	  $client->Message(15,"I am second of us, but not the least, it is time that tells all, i hear it next.");
	}
	if($question == 3) {
          $client->Message(15,"I am 6 under noon."); 
	}
	if($question == 4) {
          $client->Message(15,"If time flies, add are to thee then move on to me."); 
	}
	if($question == 5) {
          $client->Message(15,"If my clock had your digits, I would be this.");
	}
	if($question == 6) {
          $client->Message(15,"You may find yourself in a pinch, should you fail to sea my sign.");
	}
	if($question == 7) {
          $client->Message(15,"Half past six, there are no tricks");
	}
	if($question == 8) {
          $client->Message(15,"My time is at the end of light and the edge of night");
	}
	if($question == 9) {
          $client->Message(15,"The river flows to be cradled in the sea. Time flows, but is lost. when is it devoured.");
	}
	if($question == 10) {
          $client->Message(15,"I am the hour that exists betwixt twice two primes.");
	}
	if($question == 11) {
          $client->Message(15,"It is your style and your gnomon that will help you find me. I am the hour of the sum of the constituents of relative 
  term of terms.");
	}
	if($question == 12) {
          $client->Message(15,"I come last and in number am the greatest, yet when I have passed and all of my kind haven ended, I return in part in 
  the number that follows me.");
	}
    }
    if(($theme_question == 2) && ($door <=11)) {
      $question = int(rand(12)) +1;
	if($question == 1) {
          $client->Message(15,"As far as needle is concerned. I am indeed in the right, and only just.");
	}
	if($question == 2) {
          $client->Message(15,"The lodestone seeks me not, but always drifts near, as near as the sunrise.");
	}
	if($question == 3) {
          $client->Message(15,"Read your lodestone and you will find that I am sinister of the sunrise, but only just.");
	}
	if($question == 4) {
          $client->Message(15,"Where your magnet points I will not be found. Seek me just beyond the sunrise.");
	}
	if($question == 5) {
          $client->Message(15,"I can bear a load of any stone, but have only one eye to see. Remove the of the majority of the eye from what you see.");
	}
	if($question == 6) {
          $client->Message(15,"You lay arrow straight, your face to face, find me at your right foot.");
	}
	if($question == 7) {
          $client->Message(15,"Spin you compass as you will, I shall be the rear still.");
	}
	if($question == 8) {
          $client->Message(15,"Be certain of your heading and make for the place twixt the sunset and the tail of the lodestone.");
	}
	if($question == 9) {
          $client->Message(15,"Face the setting sun and you will feel the heat of my presence. You grow colder as you follow guidance of the lodestone.");
	}
	if($question == 10) {
          $client->Message(15,"My aged father is the sun, my least cousin the lodestone.");
	}
	if($question == 11) {
          $client->Message(15,"When the needle is lessened by a triple net of degrees you shall find me.");
	}
	if($question == 12) {
          $client->Message(15,"If you are disarmed, watch your blade fall. Where it leads will answer all.");
	}
    }
    if(($theme_question == 3) && ($door <=11)) {
      $question = int(rand(12)) +1;
	if($question == 1) {
        $client->Message(15,"With the sun at its highest, everyone takes refuge. I am the first to come out after the time of rest.");
	}
	if($question == 2) {
        $client->Message(15,"Of thrushar I am the loved the most. To find me, you must understand the element and know the signs.");
	}
	if($question == 3) {
        $client->Message(15,"Trushor's servant of tail and fin, I am their sign. Seek me within.");
	}
	if($question == 4) {
        $client->Message(15,"Peril I am not, Remove the second in me and give me the first in aid, and with but little confusion I can be found");
	}
	if($question == 5) {
        $client->Message(15,"As each month passes, so I may");
	}
	if($question == 6) {
        $client->Message(15,"Seeking news of me, up and down. Tradition has me down, but the rising sun uplifts my spirits ever so slightly.");
	}
	if($question == 7) {
        $client->Message(15,"I am the month of a pair and hand.");
	}
	if($question == 8) {
        $client->Message(15,"If our schedules match, you shall find me in the most dignified company.");
	}
	if($question == 9) {
        $client->Message(15,"Creatures of Trushar are often protected by those that are my symbol.");
	}
	if($question == 10) {
        $client->Message(15,"I am eight in name, but not in sequence");
	}
	if($question == 11) {
        $client->Message(15,"I am the month that brings most of somthing new and a large portion of reminiscences.");
	}
	if($question == 12) {
        $client->Message(15,"When brightest day and darkest night are indistinguishable.");
	}
    }
}
sub EVENT_COMBINE_SUCCESS {
 if (($recipe_id == 10904) || ($recipe_id == 10905) || ($recipe_id == 10906) || ($recipe_id == 10907)) {
   $client->Message("The gem resonates with power as the shards placed within glow unlocking some of the stone's power. You were successful in assembling most of the stone but there are four slots left to fill, where could those four pieces be?");
   }
  if ($recipe_id == 10903) {
      if (($class eq "Bard") || ($class eq "Beastlord") || ($class eq "Paladin") || ($class eq "Ranger") ||  ($class eq "Shadowknight")) {
    	   quest::summonitem(67666);
	   quest::summonitem(67704);
        }
        elsif (($class eq "Warrior") || ($class eq "Monk") || ($class eq "Berserker")  || ($class eq "Rogue"))  {
           quest::summonitem(67665);
	   quest::summonitem(67704);
        }
        elsif (($class eq "Cleric") || ($class eq "Shaman") || ($class eq "Druid")) {
           quest::summonitem(67667);  
	   quest::summonitem(67704);
        }
        elsif (($class eq "Necromancer") || ($class eq "Wizard") || ($class eq "Enchanter")  || ($class eq "Magician")) {
           quest::summonitem(67668);
	   quest::summonitem(67704);
        }
    $client->Message(1,"Success");
    }
  if ($recipe_id == 10346) {
     if (($class eq "Bard") || ($class eq "Beastlord") || ($class eq "Paladin") || ($class eq "Ranger") ||  ($class eq "Shadowknight")) {
    	   quest::summonitem(67661);
	   quest::summonitem(67704);
        }
        elsif (($class eq "Warrior") || ($class eq "Monk") || ($class eq "Berserker")  || ($class eq "Rogue"))  {
           quest::summonitem(67660);
	   quest::summonitem(67704);
        }
        elsif (($class eq "Cleric") || ($class eq "Shaman") || ($class eq "Druid")) {
           quest::summonitem(67662);  
	   quest::summonitem(67704);
        }
        elsif (($class eq "Necromancer") || ($class eq "Wizard") || ($class eq "Enchanter")  || ($class eq "Magician")) {
           quest::summonitem(67663);
	   quest::summonitem(67704);
        }
    $client->Message(1,"Success");
    }
  if ($recipe_id == 10334) {
     if (($class eq "Bard") || ($class eq "Beastlord") || ($class eq "Paladin") || ($class eq "Ranger") ||  ($class eq "Shadowknight")) {
    	   quest::summonitem(67654);
	   quest::summonitem(67704);
        }
        elsif (($class eq "Warrior") || ($class eq "Monk") || ($class eq "Berserker")  || ($class eq "Rogue"))  {
           quest::summonitem(67653);
	   quest::summonitem(67704);
        }
        elsif (($class eq "Cleric") || ($class eq "Shaman") || ($class eq "Druid")) {
           quest::summonitem(67655);  
	   quest::summonitem(67704);
        }
        elsif (($class eq "Necromancer") || ($class eq "Wizard") || ($class eq "Enchanter")  || ($class eq "Magician")) {
           quest::summonitem(67656);
	   quest::summonitem(67704);
        }
    $client->Message(1,"Success");
    }
} 