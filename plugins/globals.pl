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
sub givenItems {
    my $itemcount = plugin::var('itemcount');
    my %required = @_;
    my $npc = plugin::val('npc');
    my $client = plugin::val('client');
    my @item_insts = (plugin::val('item1_inst'), plugin::val('item2_inst'), plugin::val('item3_inst'), plugin::val('item4_inst'));
    return $npc->CheckHandin($client, $itemcount, \%required, @item_insts);
}

# Like givenItems(), only removes the items from the %itemcount collection for an appropriate returnUnusedItems() call later
# This works just like the old check_handin() function, only again, don't pass \%itemcount.
sub takeItems {
    my $itemcount = plugin::var('itemcount');
    my %required = @_;
    my $npc = plugin::val('npc');
    my $client = plugin::val('client');
    my @item_insts = (plugin::val('item1_inst'), plugin::val('item2_inst'), plugin::val('item3_inst'), plugin::val('item4_inst'));
    return $npc->CheckHandin($client, $itemcount, \%required, @item_insts);
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
  
  my ($c, $s, $g, $p) = (shift, shift, shift, shift);
  my $itemcount = plugin::var('itemcount');
	my %required = @_;
	my $client = plugin::val('client');
	my $npc = plugin::val('npc');

  $required->{"copper"} = $c;
  $required->{"silver"} = $s;
  $required->{"gold"} = $g;
  $required->{"platinum"} = $p;

  my @currencies = ("platinum", "gold", "silver", "copper");

	foreach my $currency (@currencies) {
		my $value = plugin::val("\$$currency");
		if ($value > 0) {
			$itemcount->{$currency} = $value;
		}
	}

  my @item_insts = (plugin::val('item1_inst'), plugin::val('item2_inst'), plugin::val('item3_inst'), plugin::val('item4_inst'));
  return $npc->CheckHandin($client, $itemcount, \%required, @item_insts);
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

    my $itemcount = plugin::var('itemcount');
    my %required = ();

    if ($c2) {
      $itemcount->{"copper"} = plugin::val('$copper');
      $required{"copper"} = $c2;
    }
    if ($s2) {
      $itemcount->{"silver"} = plugin::val('$silver');
      $required{"silver"} = $s2;
    }
    if ($g2) {
      $itemcount->{"gold"} = plugin::val('$gold');
      $required{"gold"} = $g2;
    }
    if ($p2) {
      $itemcount->{"platinum"} = plugin::val('$platinum');
      $required{"platinum"} = $p2;
    }

    plugin::setval('$copper'  , $c2);
    plugin::setval('$silver'  , $s2);
    plugin::setval('$gold'    , $g2);
    plugin::setval('$platinum', $p2);
    
    my @item_insts = (plugin::val('item1_inst'), plugin::val('item2_inst'), plugin::val('item3_inst'), plugin::val('item4_inst'));
    return plugin::val("npc")->CheckHandin(plugin::val("client"), $itemcount, \%required, @item_insts);
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
  my $itemcount = plugin::var('itemcount');
	my %required = @_;
	my $client = plugin::val('client');
	my $npc = plugin::val('npc');

  $required->{"copper"} = $c;
  $required->{"silver"} = $s;
  $required->{"gold"} = $g;
  $required->{"platinum"} = $p;

  my @currencies = ("platinum", "gold", "silver", "copper");

	foreach my $currency (@currencies) {
		my $value = plugin::val("\$$currency");
		if ($value > 0) {
			$itemcount->{$currency} = $value;
		}
	}

  my @item_insts = (plugin::val('item1_inst'), plugin::val('item2_inst'), plugin::val('item3_inst'), plugin::val('item4_inst'));
  return $npc->CheckHandin($client, $itemcount, \%required, @item_insts);
}

# Checks to see whether the player gave the NPC a requested number of platinum
sub givenPlatinum
{
  my $p = shift;
  my $itemcount = plugin::var('itemcount');
  $itemcount->{"platinum"} = plugin::val('$platinum');
  my %required = ();
  $required{"platinum"} = $p;
  my @item_insts = (plugin::val('item1_inst'), plugin::val('item2_inst'), plugin::val('item3_inst'), plugin::val('item4_inst'));
  return plugin::val("npc")->CheckHandin(plugin::val("client"), $itemcount, \%required, @item_insts);
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
  my $p = shift;
  my $itemcount = plugin::var('itemcount');
  $itemcount->{"gold"} = plugin::val('$gold');
  my %required = ();
  $required{"gold"} = $p;
  my @item_insts = (plugin::val('item1_inst'), plugin::val('item2_inst'), plugin::val('item3_inst'), plugin::val('item4_inst'));
  return plugin::val("npc")->CheckHandin(plugin::val("client"), $itemcount, \%required, @item_insts);
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
  my $p = shift;
  my $itemcount = plugin::var('itemcount');
  $itemcount->{"silver"} = plugin::val('$silver');
  my %required = ();
  $required{"silver"} = $p;
  my @item_insts = (plugin::val('item1_inst'), plugin::val('item2_inst'), plugin::val('item3_inst'), plugin::val('item4_inst'));
  return plugin::val("npc")->CheckHandin(plugin::val("client"), $itemcount, \%required, @item_insts);
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
  my $p = shift;
  my $itemcount = plugin::var('itemcount');
  $itemcount->{"copper"} = plugin::val('$copper');
  my %required = ();
  $required{"copper"} = $p;
  my @item_insts = (plugin::val('item1_inst'), plugin::val('item2_inst'), plugin::val('item3_inst'), plugin::val('item4_inst'));
  return plugin::val("npc")->CheckHandin(plugin::val("client"), $itemcount, \%required, @item_insts);
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
  #returnUnusedItems-no-op - This is now handled by the source entirely
}