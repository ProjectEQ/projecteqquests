my $instid = 0;

sub EVENT_ITEM {
	$instid = quest::GetInstanceID('uqua',0);
	if (plugin::check_handin(\%itemcount, 67705 => 1)) {
		quest::signalwith(292008,$instid);
	}
}