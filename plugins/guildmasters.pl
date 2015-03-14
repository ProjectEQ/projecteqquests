#looks through the items haded in for discipline tomes,
#processing them as we find them.
sub try_tome_handins {
	my $itemcount = shift;
	my $isclass = shift;
	my $expectclass = shift;
	
	my @tomes = ();
	foreach my $i(keys %{$itemcount}) {
		if(quest::isdisctome($i)) {
			push(@tomes, $i);
			delete $itemcount->{$i};
		}
	}
	if(@tomes > 0) {
		if($isclass eq $expectclass) {
			foreach my $i(@tomes) {
				quest::traindisc($i);
			}
		} else {
			quest::say('You are not a member of my guild. I will not train you!');
			foreach my $i(@tomes) {
				$itemcount->{$i} = 1;
			}
		}
	}
}

1;

