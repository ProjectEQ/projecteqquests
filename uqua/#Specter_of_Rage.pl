# items: 67705
my $instid = 0;

sub EVENT_ITEM {
	$instid = quest::GetInstanceID('uqua',0);
	if (plugin::check_handin(\%itemcount, 67705 => 1)) {
		quest::signalwith(292008,$instid); # NPC: a_spirit_guardian
	}
	plugin::return_items(\%itemcount); #return items if not the ones required
}
