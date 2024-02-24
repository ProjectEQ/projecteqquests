#plugin::check_hasitem($client, $item_id);
sub check_hasitem {
	my $client = shift;
	my $item_id = shift;
	#my $body_count = $client->GetCorpseCount();
	my @augment_slots = (
		quest::getinventoryslotid("augsocket.begin")..quest::getinventoryslotid("augsocket.end")
	);
	#my @corpse_slots = (
	#	quest::getinventoryslotid("possessions.begin")..quest::getinventoryslotid("possessions.end"),
	#	quest::getinventoryslotid("generalbags.begin")..quest::getinventoryslotid("generalbags.end"),
	#);
	my @inventory_slots = (
		quest::getinventoryslotid("possessions.begin")..quest::getinventoryslotid("possessions.end"),
		quest::getinventoryslotid("generalbags.begin")..quest::getinventoryslotid("generalbags.end"),
		quest::getinventoryslotid("bank.begin")..quest::getinventoryslotid("bank.end"),
		quest::getinventoryslotid("bankbags.begin")..quest::getinventoryslotid("bankbags.end"),
		quest::getinventoryslotid("sharedbank.begin")..quest::getinventoryslotid("sharedbank.end"),
		quest::getinventoryslotid("sharedbankbags.begin")..quest::getinventoryslotid("sharedbankbags.end"),
	);
	foreach $slot_id (@inventory_slots) {
		if ($client->GetItemAt($slot_id)) {
			if ($client->GetItemIDAt($slot_id) == $item_id) {
				return 1;
			}

			foreach $augment_slot (@augment_slots) {
				if ($client->GetAugmentAt($slot_id, $augment_slot) && $client->GetAugmentIDAt($slot_id, $augment_slot) == $item_id) {
					return 1;
				}
			}
		}
	}

	if ($client->HasItemOnCorpse($item_id)) {
		return 1;
	}

  	return 0;
}

return 1;
