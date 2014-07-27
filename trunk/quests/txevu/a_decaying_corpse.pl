sub EVENT_SIGNAL {
	if ($signal == 1) { #from bloodfeaster saying spawn my stonemite adds
		quest::spawn2(297207,0,0,plugin::RandomRange(215,280), plugin::RandomRange(405,445), -419, 0);
		quest::spawn2(297207,0,0,plugin::RandomRange(215,280), plugin::RandomRange(405,445), -419, 0);
	}
}