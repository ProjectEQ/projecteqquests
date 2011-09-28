#
# plugins\npc_tools.pl
# 
# NPC-related Helper Functions
#

# 1 = Humanoid
%raceFlags = (
  1=>1, 2=>1, 3=>1, 4=>1, 5=>1, 6=>1, 7=>1, 8=>1, 9=>1, 10=>1, 11=>1, 12=>1, 15=>1, 16=>1, 18=>1, 23=>1, 25=>1, 26=>1, 44=>1,
  55=>1, 56=>1, 62=>1, 64=>1, 67=>1, 71=>1, 77=>1, 78=>1, 79=>1, 81=>1, 88=>1, 90=>1, 92=>1, 93=>1, 94=>1,
  101=>1, 106=>1, 110=>1, 112=>1, 128=>1, 130=>1, 131=>1, 139=>1, 140=>1,
  150=>1, 151=>1, 153=>1, 188=>1, 189=>1,
  236=>1, 238=>1, 239=>1, 242=>1, 243=>1, 244=>1,
  251=>1, 278=>1, 296=>1, 299=>1,
  330=>1, 331=>1, 332=>1, 333=>1, 334=>1, 335=>1, 336=>1, 337=>1, 338=>1, 339=>1, 340=>1, 341=>1, 342=>1, 343=>1, 344=>1, 345=>1, 346=>1, 347=>1,
  385=>1, 386=>1, 
  403=>1, 406=>1, 407=>1, 408=>1, 411=>1, 417=>1, 433=>1,
  453=>1, 454=>1, 455=>1, 457=>1, 458=>1, 461=>1, 464=>1, 466=>1, 467=>1, 473=>1, 475=>1, 476=>1, 478=>1, 487=>1, 488=>1, 489=>1, 490=>1, 495=>1, 496=>1, 497=>1, 498=>1, 499=>1,
  520=>1, 521=>1, 522=>1, 523=>1, 524=>1, 527=>1, 529=>1, 532=>1,
  562=>1, 563=>1, 564=>1, 565=>1, 566=>1, 568=>1, 575=>1, 576=>1, 579=>1
);
  
# Change names like 'a_skeleton005' into 'a skeleton'
sub fixNPCName
{
  $_ = shift;
  
  if (!defined($_))
  {
    $_ = plugin::val('$mname');
  }
  
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

  return (plugin::nullzero($raceFlags{$race}) & 1) ? 1 : 0;
}

# Associative name an NPC can use when talking to the player (friend, stranger, Dark Elf, etc.)
sub assocName
{
  my $faction = plugin::val('$faction');
  
  return (plugin::val('$status') > 20) ? 'boss' :
         ($faction < 3) ? plugin::val('$name') :
         ($faction < 5) ? 'friend' :
         ($faction < 7) ? 'stranger' : plugin::val('$race');
}