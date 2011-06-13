#BeginFile: qvic\player.pl

sub EVENT_ENTERZONE {
  if (defined $qglobals{god_qvic_access} && $qglobals{god_qvic_access} == 1 && quest::has_zone_flag(295) == 1) {
    quest::setglobal("god_qvic_access",2,5,"F");
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
#EndFile: qvic\player.pl