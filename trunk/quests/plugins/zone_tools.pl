#
# plugins\zone_tools.pl
#
# Zone-related Helper Functions
#

# Returns the city name for the current zone (or location within the zone, in some cases)
sub cityName
{
  my $zonesn = plugin::val('$zonesn');
  
  if ($zonesn eq 'gfaydark')
  {
    if (plugin::val('$y') < -1200)
    {
      return 'Felwithe';
    }
    else
    {
      return 'Kelethin';
    }
  }
  else
  {
    return plugin::val('$zoneln');
  }
}

# Returns a quick zone-appropriate greeting ("Tunare's blessings", "Bristlebane's favor", etc.)
sub quickGreeting
{
  my $zonesn = plugin::val('$zonesn');
  
  if ($zonesn eq 'gfaydark')
  {
    return plugin::random('Tunare\'s blessings', 'Hello', 'Hail', 'Welcome');
  }
  
  return plugin::random('Hail', 'Hello', 'Welcome');
}