sub EVENT_SPAWN
{
	quest::settimer("depop", 120);
}

sub EVENT_TIMER
{
	quest::depop();
}

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount, 29281 => 1))
	{
		quest::summonitem(29281);
		quest::summonitem(29292);
	}
	plugin::return_items(\%itemcount);
}