# Default-actions.pl
#
# Default actions to perform if the user performs particular actions on an NPC.

sub defaultSay
{
  my $handled = plugin::nullzero(shift);
  my $name = plugin::assocName();
  my $text = plugin::val('$text');
  my $mname = plugin::fixNPCName();
  my $faction = plugin::val('$faction');
  my $zonesn = plugin::val('$zonesn');
  my $npc = plugin::val('$npc');
  my $zoneln = plugin::cityName();
  
  if (!$handled)
  {
    if ($mname=~/^Soulbinder\w/)
    {
      if($text=~/^hail/i)
      {
        quest::say("Greetings, ${name}. When a hero of our world is slain, their soul returns to the place it was last bound and the body is reincarnated. As a member of the Order of Eternity, it is my duty to [bind your soul] to this location if that is your wish.");
        quest::doanim(29);

        $handled = 1;
      }
      elsif (($text=~/bind my soul/i) || ($text=~/bind your soul/i))
      {
        quest::say("Binding your soul. You will return here when you die.");
        quest::doanim(42);
        quest::selfcast(2049);

        $handled = 1;
      }
    }
    elsif ($mname=~/^Guard\w/)
    {
      if ($faction > 5)
      {
        quest::me("$mname glowers at you dubiously.");

        $handled = 1;
      }
      else
      {
        quest::say("Hail, $name! Pardon me. I am on duty, keeping $zoneln safe.");

        $handled = 1;
      }
    }
    elsif (($mname=~/^Merchant\w/) || ($mname=~/^Innkeep/) || ($mname=~/^Barkeep/))
    {
      if($text=~/^Hail/i)
      {
        quest::say("Welcome, $name! Why don't you browse through my selection of fine goods and pick out some things you like?");

        $handled = 1;
      }
    }
  }
  
  if (($text=~/test money/i) && (plugin::val('$status') > 20))
  {
    quest::givecash(99, 99, 99, 99);
  }
}

sub defaultItem
{
  plugin::returnUnusedItems();
}

sub defaultDeath
{
  my $handled = plugin::nullzero(shift);
  my $mname = plugin::val('$mname');
  my $zonesn = plugin::val('$zonesn');
  
  if (!$handled)
  {
    if ($mname =~ /^(an\_)?orc(\_.+|)$/i) # Everything from 'orc' to 'an_orc_flibberty_gibbet', but not 'orchard_master', etc.
    {
      # Orc death
      
      quest::say(
        (($zonesn =~ /(g|l)faydark/) || ($zonesn eq 'crushbone')) ? plugin::random('You shall have all the Crushbone Orcs on your tail for my death!!') :
        "DEBUG: $zonesn orc death!");

      $handled = 1;
    }
    elsif ($mname =~ /^(a\_)?gnoll(\_.+|)$/i) # Everything from 'gnoll' to 'a_gnoll_flibberty_gibbet', but not 'gnollish', etc.
    {
      # Gnoll death
      
      quest::say(
        ($zonesn =~ /^qey/i) ? plugin::random('DEBUG: Blackburrow gnoll death!!') :
        "DEBUG: $zonesn (Non-Blackburrow) gnoll death!");
      $handled = 1;
    }
    elsif ($mname =~ /^Guard/i)
    {
      # Guard death
      
      my $city = plugin::cityName();
      
      quest::say( ($city eq 'Kelethin') ? 'Kelethin guard death!' :
                  ($city eq 'Felwithe') ? 'Felwithe guard death!' :
                  "DEBUG: $city guard death!" );

      $handled = 1;
    }
  }
}

sub defaultSlay
{
  my $handled = plugin::nullzero(shift);
  my $mname = plugin::val('$mname');
  my $zonesn = plugin::val('$zonesn');
  
  if (!$handled)
  {
    if ($mname =~ /^Guard/i)
    {
      # Guard kills
      
      # 25% chance for flavor text
      if (int(rand(4)) == 0)
      {
        my $city = plugin::cityName();
      
        quest::say(
          ($city eq 'Kelethin') ? 'For the protection of all Feir\'dal, there shall be no mercy for your kind.' :
          ($city eq 'Felwithe') ? 'Another one bites the dust.' :
          "$city is a little bit safer now." );
      }

      $handled = 1;
    }
  }
}

sub defaultCombat()
{
  my $combat_state = plugin::val('$combat_state');
  my $zonesn = plugin::val('$zonesn');
  my $mname = plugin::val('$mname');
  
  if ($combat_state == 1)
  {
    if ($zonesn =~ /^((l|g)faydark|crushbone)$/)
    {
      if ($mname =~ /^(an\_)?orc(\_.+|)$/i) # Everything from 'orc' to 'an_orc_flibberty_gibbet', but not 'orchard_master', etc.
      {
      }
    }
   }
  }
  
  return;

  # Sample code to work from
  my $random_result = int(rand(100));
    if(($combat_state == 1) &&($random_result<=50)){
    quest::say("Death!!  Death to all who oppose the Crushbone orcs!!");
   }else{
   quest::say("You've ruined your lands. You'll not ruin mine!");
 }