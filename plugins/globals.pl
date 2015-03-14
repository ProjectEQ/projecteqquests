sub nullzero
{
  my $value = shift;
  
  return (defined($value)) ? $value : 0;
}

sub nulltrim
{
  my $value = shift;
  
  if (!defined($value))
  {
    return '';
  }
  else
  {
    $value =~ s/^\s+|\s+$//g;
    
    return $value;
  }
}

sub random
{
  return $_[int(rand(0+@_))];
}

# var - Access a quest-related game variable from within any context
# Parameter: varName
sub var
{
  my $varName = shift;
  
  # Strip leading $, @, or % symbol from variable name
  $varName =~ s/^(\$|@|%)//g;

  if ($varName eq 'mob')
  {
    # Shortcut: Requesting $mob steps into EntityList to get $mob reference for the current NPC.
    
    my $entity_list = plugin::val('entity_list');
  
    return $entity_list->GetMobID(plugin::val('mobid'));
  }
  else
  {
    my(@context, $level, $fullname);
    
    # Step back through the call stack until we get access to the main (non-plugin) variables
    for ($level = 1; $level < 10; $level++)
    {
      @context = caller($level);
      last if (($fullname = substr($context[3], 0, index($context[3], ':') + 2)) ne 'plugin::');
    }
    
    # Sanity check. If something goes horribly wrong and we can't step out of the plugin:: namespace, just return an empty string.
    return '' if ($level >= 10);
    
    $fullname .= $varName;
    
    if ($varName eq 'itemcount' || $varName eq 'qglobals')
    {
      # Hash reference
      return \%$fullname;
    }
    elsif (0) #($varName eq 'ArrayVariable')
    {
      # Array reference
      return \@$fullname;
    }
    else
    {
      # Scalar reference
      return \$$fullname;
    }
  }
}

# val - Shortcut that returns the read-only -value- of a quest-related game variable instead of a reference to it
# Parameter: varName
sub val
{
  return ${plugin::var($_[0])};
}

# setVal - Shortcut that sets a scalar quest-related game variable from within any context... works well with val()
# Parameters: varName, newValue
sub setval
{
  ${plugin::var($_[0])} = $_[1] if (@_ > 1);
}

# Returns 1 if the NPC has been given a particular item or set of items. Otherwise, returns 0.
# Parameters: Hash consisting of ItemID => RequiredCount pairs
# NOTE: \%itemcount parameter from older "check_handin" function is NOT necessary and should not be passed!
sub givenItems
{
  my $itemcount = plugin::var('itemcount');
  my %required = @_;
  
  foreach my $req (keys %required)
  {
    if ((!defined($itemcount->{$req})) || ($itemcount->{$req} < $required{$req}))
    {
      return 0;
    }
  }

  return 1;
}

# Like givenItems(), only removes the items from the %itemcount collection for an appropriate returnUnusedItems() call later
# This works just like the old check_handin() function, only again, don't pass \%itemcount.
sub takeItems
{
  my $itemcount = plugin::var('itemcount');
  my %required = @_;
  
  foreach my $req (keys %required)
  {
    if ((!defined($itemcount->{$req})) || ($itemcount->{$req} < $required{$req}))
    {
      return 0;
    }
  }

  foreach my $req (keys %required)
  {
    if ($required{$req} < $itemcount->{$req})
    {
      $itemcount->{$req} -= $required{$req};
    }
    else
    {
      delete $itemcount->{$req};
    }
  }

  return 1;
}

# Checks to see whether the player gave the NPC a requested amount of currency, regardless of actual denominations given.
sub givenCoin
{
  my($c1, $s1, $g1, $p1) = @_;
  my($c2, $s2, $g2, $p2) = (plugin::val('$copper'), plugin::val('$silver'), plugin::val('$gold'), plugin::val('$platinum'));
  
  $c1 = 0 if (!defined($c1));
  $s1 = 0 if (!defined($s1));
  $g1 = 0 if (!defined($g1));
  $p1 = 0 if (!defined($p1));
  
  my $coin1 = $c1 + (10 * $s1) + (100 * $g1) + (1000 * $p1);
  my $coin2 = $c2 + (10 * $s2) + (100 * $g2) + (1000 * $p2);

  return ($coin1 <= $coin2);
}

# Like givenCoin(), only takes the required coins if given enough by the player, also leaving change to be returned with returnUnusedItems().
sub takeCoin
{
  my($c1, $s1, $g1, $p1) = @_;
  my($c2, $s2, $g2, $p2) = (plugin::val('$copper'), plugin::val('$silver'), plugin::val('$gold'), plugin::val('$platinum'));
  
  $c1 = 0 if (!defined($c1));
  $s1 = 0 if (!defined($s1));
  $g1 = 0 if (!defined($g1));
  $p1 = 0 if (!defined($p1));
  
  my $coin1 = $c1 + (10 * $s1) + (100 * $g1) + (1000 * $p1);
  my $coin2 = $c2 + (10 * $s2) + (100 * $g2) + (1000 * $p2);

  if ($coin1 <= $coin2)
  {
    $coin2 -= $coin1;
  
    $c2 = ($coin2 % 10);
    $s2 = (int($coin2 / 10) % 10);
    $g2 = (int($coin2 / 100) % 10);
    $p2 = int($coin2 / 1000);

    plugin::setval('$copper'  , $c2);
    plugin::setval('$silver'  , $s2);
    plugin::setval('$gold'    , $g2);
    plugin::setval('$platinum', $p2);
    
    return 1; # 1 = Successfully took coins
  }
  
  return 0; # 0 = Insufficient funds
}

# Checks for both coin and items in one call.
# Returns 1 if enough items and coin were given to satisfy the provided requirements, otherwise 0.
sub givenItemsCoin
{
  if (@_ < 6)
  {
    return 0;
  }

  my ($c, $s, $g, $p) = (shift, shift, shift, shift);
  
  if (plugin::givenCoin($c, $s, $g, $p))
  {
    return plugin::givenItems(@_);
  }

  return 0;
}

# Like givenItemsCoin, only removes the items if successful, allowing for approprate returnUnusedItems() call later
sub takeItemsCoin
{
  if (@_ < 6)
  {
    return 0;
  }

  my ($c, $s, $g, $p) = (shift, shift, shift, shift);
  
  if (plugin::givenCoin($c, $s, $g, $p))
  {
    if (plugin::takeItems(@_))
    {
      plugin::takeCoin($c, $s, $g, $p);
      
      return 1;
    }
  }

  return 0;
}

# Checks to see whether the player gave the NPC a requested number of platinum
sub givenPlatinum
{
  my $p = shift;
  
  return plugin::givenCoin(0, 0, 0, defined($p) ? $p : 0);
}

# Takes provided coins given by the player
sub takePlatinum
{
  my $p = shift;
  
  return plugin::takeCoin(0, 0, 0, defined($p) ? $p : 0);
}

# Checks to see whether the player gave the NPC a requested number of gold
sub givenGold
{
  my $g = shift;
  
  return plugin::givenCoin(0, 0, defined($g) ? $g : 0, 0);
}

# Takes provided coins given by the player
sub takeGold
{
  my $g = shift;
  
  return plugin::takeCoin(0, 0, defined($g) ? $g : 0, 0);
}

# Checks to see whether the player gave the NPC a requested number of silver
sub givenSilver
{
  my $s = shift;
  
  return plugin::givenCoin(0, defined($s) ? $s : 0, 0, 0);
}

# Takes provided coins given by the player
sub takeSilver
{
  my $s = shift;
  
  return plugin::takeCoin(0, defined($s) ? $s : 0, 0, 0);
}

# Checks to see whether the player gave the NPC a requested number of copper
sub givenCopper
{
  my $c = shift;
  
  return plugin::givenCoin(defined($c) ? $c : 0, 0, 0, 0);
}

# Takes provided coins given by the player
sub takeCopper
{
  my $c = shift;
  
  return plugin::takeCoin(defined($c) ? $c : 0, 0, 0, 0);
}

# Returns any unwanted items and coins to the user with an appropriate message.
sub returnUnusedItems
{    
  my $name = plugin::assocName();

  my $itemcount = plugin::var('$itemcount');
  my $items = 0;
  
  foreach my $k (keys(%$itemcount))
  {
    next if($k == 0);
    my $r;
    
    for($r = 0; $r < $itemcount->{$k}; $r++)
    {
      $items++;
      
      quest::summonitem($k);
    }
    
    delete $itemcount->{$k};
  }
  
  if ($items > 0)
  {
    if (plugin::humanoid())
    {
      my $itemtext1 = ($items == 1) ? 'this item' : 'these items';
      my $itemtext2 = ($items == 1) ? 'it' : 'them';
      
      quest::say("I have no need for $itemtext1, $name. You can have $itemtext2 back.");
      quest::doanim(64); # Point
    }
    else
    {
      my $itemtext1 = ($items == 1) ? 'item' : 'items';
      
      quest::me("This creature has no need for the $itemtext1 you are offering.");
    }
  }
  
  my($platinum, $gold, $silver, $copper) = (plugin::val('$platinum'), plugin::val('$gold'), plugin::val('$silver'), plugin::val('$copper'));
  
  if ($platinum || $gold || $silver || $copper)
  {
    if ($items == 0) # NOTE: If $items > 0, already giving back items with message, just tack coin onto it
    {
      if ((plugin::val('$item1') == 0) && (plugin::val('$item2') == 0) && (plugin::val('$item3') == 0) && (plugin::val('$item4') == 0))
      {
        # No items, just money
        
        if (plugin::humanoid())
        {
          quest::say("I appreciate the offer, but I can't take this money, $name.");
        }
        else
        {
          quest::me('This creature has no need for your money.');
        }
      }
      else
      {
        # Items given and accepted
        
        if (plugin::humanoid())
        {
          quest::say("Here is your change, $name.");
        }
      }
    
      quest::doanim(64); # Point
    }
    
    quest::givecash($copper, $silver, $gold, $platinum);
  }
}