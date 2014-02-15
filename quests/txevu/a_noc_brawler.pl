# Arena Mob
my @hate_list;

sub EVENT_SIGNAL {
	#aggro runt assist
	@hate_list = $entity_list->GetMobByID(297209)->GetHateList();
}