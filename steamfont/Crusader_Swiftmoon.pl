#Crusader_Swiftmoon.pl
#Part of Innoruuk Regent
#Quickie to despawn him after an hour -Kilelen

sub EVENT_SPAWN{
	quest::settimer("depop", 3600);
}
sub EVENT_TIMER{
	quest::stoptimer("depop");
	quest::depop();
}