#Emporer Ssraeshza Event Startup and Reset

sub EVENT_SPAWN {
	if($entity_list->GetMobByNpcTypeID(162064)) {
		quest::signalwith(162064, 98, 0);
	}
        if (!defined $qglobals{emperor}) {
	quest::spawn2(162189, 0, 0, 877.0, -327.0, 410.75, 193.0);
	quest::spawn2(162065, 0, 0, 993.3, -325.0, 415.0, 192.5);
        quest::depop();
 }
       elsif ($qglobals{emperor} == 1) {
        quest::settimer("empcheck",1200);
 }
 $qglobals{emperor} = undef;
}

sub EVENT_TIMER {
         if ($timer eq "empcheck" && !defined $qglobals{emperor}) {
         quest::spawn2(162189, 0, 0, 877.0, -327.0, 410.75, 193.0);
	 quest::spawn2(162065, 0, 0, 993.3, -325.0, 415.0, 192.5);
         quest::depop();
         quest::stoptimer("empcheck");
 }
$qglobals{emperor} = undef;
}
#zone: ssratemple ID: 162208 NPC: #Blood_Startup
