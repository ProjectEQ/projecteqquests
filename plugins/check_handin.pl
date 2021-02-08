# plugin::check_handin($item1 => #required_amount,...);
# Automatically returns unused items on success
sub check_handin {
	my $itemcount = shift;
	my %required_items = @_;
	foreach $item_id (keys %required_items) {
		if (!defined $itemcount->{$item_id} || $itemcount->{$item_id} != $required_items{$item_id}) {
			return 0;
		}
		
		if ($required_items{$item_id} < $itemcount->{$item_id}) {
			$itemcount->{$item_id} -= $required_items{$item_id};
		} else {
			delete $itemcount->{$item_id};
		}
    }
	return 1;
}

# plugin::return_items();
# Returns unused items in your itemcount hash
sub return_items {    
	my $itemcount = plugin::var('itemcount');
	my $client = plugin::val('client');
	my $name = plugin::val('name');
	my $items_returned = 0;
	my %items_hash = (
		0 => [ plugin::val('item1'), plugin::val('item1_charges'), plugin::val('item1_attuned') ],
		1 => [ plugin::val('item2'), plugin::val('item2_charges'), plugin::val('item2_attuned') ],
		2 => [ plugin::val('item3'), plugin::val('item3_charges'), plugin::val('item3_attuned') ],
		3 => [ plugin::val('item4'), plugin::val('item4_charges'), plugin::val('item4_attuned') ],
	);
	
	foreach $handin_item (keys %{$itemcount}) {
		next if ($handin_item == 0);
		$required_count = $itemcount->{$handin_item};
		foreach $required_slot (0..3) {
			if (
				$required_count > 0 &&
				$items_hash{$required_slot}[0] &&
				$items_hash{$required_slot}[0] == $handin_item
			) {
				if ($client) {
					$client->SummonItem(
						$handin_item,
						$items_hash{$required_slot}[1],
						$items_hash{$required_slot}[2]
					);
					$items_returned = 1;
				} else {
					quest::summonitem($handin_item);
					$items_returned = 1;
				}
				$required_count--;
			}
			$required_slot++;
		}
		delete $itemcount->{$handin_item};
	}
	
	if ($items_returned) {
		quest::whisper("I have no need for this $name, you can have it back.");
	}
	return $items_returned;
}

sub mq_process_items {
	my $hashref = shift;
	my $npc = plugin::val('$npc');
	my $trade = undef;
	
	if($npc->EntityVariableExists("_mq_trade")) {
		$trade = decode_eqemu_item_hash($npc->GetEntityVariable("_mq_trade")); 
	} else {
		$trade = {};
	}
	
	foreach my $k (keys(%{$hashref})) {
		next if($k == 0);
		
		if(defined $trade->{$k}) {
			$trade->{$k} = $trade->{$k} + $hashref->{$k};
		} else {
			$trade->{$k} = $hashref->{$k};
		}
	}
	
	my $str = encode_eqemu_item_hash($trade);
	$npc->SetEntityVariable("_mq_trade", $str);
}

sub check_mq_handin {
	my %required = @_;
	my $npc = plugin::val('$npc');
	my $trade = undef;
	
	if($npc->EntityVariableExists("_mq_trade")) {
		$trade = decode_eqemu_item_hash($npc->GetEntityVariable("_mq_trade"));
	} else {
		return 0;
	}
	
	foreach my $req (keys %required) {
		if((!defined $trade->{$req}) || ($trade->{$req} < $required{$req})) {
				return 0;
		}
	}
	
	foreach my $req (keys %required) {
		if ($required{$req} < $trade->{$req}) {
			$trade->{$req} -= $required{$req};
		} else {
			delete $trade->{$req};
		}
	}
	
	$npc->SetEntityVariable("_mq_trade", encode_eqemu_item_hash($trade));
	return 1;
}

sub clear_mq_handin {
	my $npc = plugin::val('$npc');
	$npc->SetEntityVariable("_mq_trade", "");
}

sub encode_eqemu_item_hash {
	my $hashref = shift;
	my $str = "";
	my $i = 0;
	
	foreach my $k (keys(%{$hashref})) {
		if($i != 0) {
			$str .= ",";
		} else {
			$i = 1;
		}
		
		$str .= $k;
		$str .= "=";
		$str .= $hashref->{$k};
	}
	
	return $str;
}

sub decode_eqemu_item_hash {
	my $str = shift;
	my $hashref = { };
	
	my @vals = split(/,/, $str);
	my $val_len = @vals;
	for(my $i = 0; $i < $val_len; $i++) {
		my @subval = split(/=/, $vals[$i]);
		my $subval_len = @subval;
		if($subval_len == 2) {
			my $key = $subval[0];
			my $value = $subval[1];
			
			$hashref->{$key} = $value;
		}
	}
	
	return $hashref;
}
