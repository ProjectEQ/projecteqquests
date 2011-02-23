sub EVENT_CLICKDOOR {
  my $d_id = ($doorid % 256);

  if($d_id == 3) {
    if((defined $qglobals{ikkydoor}) && ($qglobals{ikkydoor} >= 1)) {
       quest::forcedooropen(515);
	}
     }
  if($d_id == 4) {
    if((defined $qglobals{ikkydoor}) && ($qglobals{ikkydoor} >= 1)) {
       quest::forcedooropen(516);
	}
     }
  if($d_id == 254) {
    if((defined $qglobals{ikkydoor}) && ($qglobals{ikkydoor} >= 1)) {
       quest::forcedooropen(510);
	}
     }
  if($d_id == 0) {
    if((defined $qglobals{ikkydoor}) && ($qglobals{ikkydoor} >= 1)) {
       quest::forcedooropen(512);
	}
     }
  if($d_id == 252) {
    if((defined $qglobals{ikkydoor}) && ($qglobals{ikkydoor} == 3)) {
       quest::forcedooropen(508);
	}
     }
  if($d_id == 253) {
    if((defined $qglobals{ikkydoor}) && ($qglobals{ikkydoor} == 3)) {
       quest::forcedooropen(509);
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