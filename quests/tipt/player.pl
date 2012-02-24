
sub EVENT_CLICKDOOR {
  #update zone status
  my $instid = quest::GetInstanceID("tipt",0);
  if($doorid == 3) {
    if($qglobals{$instid.'_tipt_status'} == 9) {
	  if(plugin::check_hasitem($client, 54083)) {
	    #if the zone has to boot from empty, this will let us now to unlock this door (in case the corpse is on the other side).
        quest::setglobal($instid.'_tipt_status',10,7,"H6");
	  }
	}
  }
}

sub EVENT_COMBINE_SUCCESS {
  my $x = $client->GetX();
  my $y = $client->GetY();
  my $z = $client->GetZ();
  my $h = $client->GetHeading();

  if ($recipe_id == 10344) {
    $client->Message(1,"With the final piece in place, the clockwork scout's eyes light up as it comes to life.");
    quest::spawn2(290059,0,0,$x,$y,$z,$h); #Clockwork Scout Model XIII
  }
  if (($recipe_id == 10904) || ($recipe_id == 10905) || ($recipe_id == 10906) || ($recipe_id == 10907)) {
    $client->Message(15,"The gem resonates with power as the shards placed within glow unlocking some of the stone's power. You were successful in assembling most of the stone but there are four slots left to fill, where could those four pieces be?");
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