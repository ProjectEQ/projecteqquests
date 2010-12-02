# plugin::check_handin($item1 => #required_amount,...);
# autoreturns extra unused items on success
sub check_handin {
    my $hashref = shift;
    my %required = @_;
    foreach my $req (keys %required) {
	if ((!defined $hashref->{$req}) || ($hashref->{$req} != $required{$req})) {
            return(0);
	}
    }
     foreach my $req (keys %required) {
         if ($required{$req} < $hashref->{$req}) {
             $hashref->{$req} -= $required{$req};
         } else {
             delete $hashref->{$req};
         }
     }
     return 1;
}

sub return_items {   
   my $hashref = shift;
   my $client = plugin::val('client');
   foreach my $k (keys(%{$hashref}))
   {
      next if($k == 0);
      my $r;
      for($r = 0; $r < $hashref->{$k}; $r++)
      {
         if ($client)
         {
            my $Attuneable = $client->GetItemStat($k, "attuneable");
            if ($Attuneable == 1)
            {
               # If the item is attuneable, return it as attuned
               $client->SummonItem($k, 0, 1);
            }
            else
            {
               quest::summonitem($k, 0);
            }
         }
         else
         {
            # This shouldn't be needed, but just in case
            quest::summonitem($k, 0);
         }
      }
      delete $hashref->{$k};
   }
} 

1;