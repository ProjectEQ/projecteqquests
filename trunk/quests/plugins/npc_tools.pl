#
# plugins\npc_tools.pl
# 
# NPC-related Helper Functions
#

# Change names like 'a_skeleton005' into 'a skeleton'
sub fixNPCName
{
  $_ = shift;
  
  s/\d+$//; # Strip trailing numeric digits
  s/\_/ /g; # Change underscores to spaces
  
  return $_;
}

# Returns 1 if the mob's race is humanoid, 0 if not. Race number argument optional, will use current NPC if omitted.
# So far mainly used to identify races that can be expected to speak to the player.
sub humanoid
{
  my $race = shift;
  
  if (!defined($race))
  {
    my $mob = plugin::var('$mob');
    
    $race = $mob->GetRace();
  }
  
  # If there's a cleaner, more efficient method of doing this, by all means...
  foreach (0..12, 15..16, 18, 23, 25, 26, 44, 55, 56, 62, 64, 67, 71, 77..79, 81, 88, 90, 92..94,
           101, 106, 110, 112, 128, 130, 131, 139, 140, 150, 151, 153, 188, 189, 236, 238, 239,
           242..244, 251, 278, 296, 299, 330..347, 385, 386, 403, 406..408, 411, 417, 433, 453,
           454, 455, 457, 458, 461, 464, 466, 467, 473, 475..478, 487..490, 495, 496..499, 520..524,
           527, 529, 532, 562..566, 568, 575, 576, 579)
  {
    return 1 if ($race == $_);
  }
  
  return 0;
}

# Associative name an NPC can use when talking to the player (friend, stranger, Dark Elf, etc.)
# Note to self: Need to implement raceid to racename sub for this
sub assocName
{
  my $faction = plugin::val('$faction');
  
  return (plugin::val('$status') > 20) ? 'boss' :
         ($faction < 3) ? plugin::val('$name') :
         ($faction < 5) ? 'friend' :
         ($faction < 7) ? 'stranger' : plugin::val('$race');
}