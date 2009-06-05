my $mob1;
my $mobnpc1;

sub EVENT_SPAWN {
	quest::settimer(2,7200);	# 2 hours to kill him
        quest::settimer(5,2410);
        quest::depopall(214000);
        quest::depopall(214001);
        quest::depopall(214002);
        quest::depopall(214003);
        quest::depopall(214006);
        quest::depopall(214008);
        quest::depopall(214012);
        quest::depopall(214015);
        quest::depopall(214016);
        quest::depopall(214017);
        quest::depopall(214018);
        quest::depopall(214019);
        quest::depopall(214020);
        quest::depopall(214021);
        quest::depopall(214022);
        quest::depopall(214023);
        quest::depopall(214024);
        quest::depopall(214025);
        quest::depopall(214027);
        quest::depopall(214028);
        quest::depopall(214029);
        quest::depopall(214030);
        quest::depopall(214038);
        quest::depopall(214040);
        quest::depopall(214043);
        quest::depopall(214045);
        quest::depopall(214046);
        quest::depopall(214047);
        quest::depopall(214048);
        quest::depopall(214059);
        quest::depopall(214070);
        quest::depopall(214077);
        quest::depopall(214078);
        quest::depopall(214079);
        quest::depopall(214080);
        quest::depopall(214081);
        quest::depopall(214085);
        quest::depopall(214087);
        quest::depopall(214088);
        quest::depopall(214089);
        quest::depopall(214090);
        quest::depopall(214091);
        quest::depopall(214093);
        quest::depopall(214094);
        quest::depopall(214095);
        quest::depopall(214097);
        quest::depopall(214098);
        quest::depopall(214099);
        quest::depopall(214100);
        quest::depopall(214102);
        quest::depopall(214106);
        quest::depopall(214122);
        quest::depopall(214114);
    }

sub EVENT_AGGRO {
        quest::settimer(1,60);
}


sub EVENT_DEATH {
	quest::spawn2(214105,0,0,699,8,-294,64);	# spawn a_planar_projection
    quest::stoptimer(2);
    quest::stoptimer(1);
    quest::stoptimer(5);
    quest::signalwith(214112, 214113);			# let the trigger know RZtW died
}

sub EVENT_TIMER {
	if($timer == 2) {
        quest::stoptimer(2);
        quest::stoptimer(1);
        quest::stoptimer(5);
        quest::depopall(214114);
		quest::depop;
    }

	if($timer == 1) {
        quest::spawn2(214114,0,0,565,-95,-293,66);
        quest::spawn2(214114,0,0,815,-100,-293,255);
        quest::spawn2(214114,0,0,815,-295,-293,68);
        quest::spawn2(214114,0,0,565,185,-293,0);
        $mob1 = $entity_list->GetMobID(214114);
        $mobnpc1 = $mob1->CastToNPC();
        $mobnpc1->AddToHateList($npc->GetHateTop());
     }

	if($timer == 5) {
        quest::depopall(214000);
        quest::depopall(214001);
        quest::depopall(214002);
        quest::depopall(214003);
        quest::depopall(214006);
        quest::depopall(214008);
        quest::depopall(214012);
        quest::depopall(214015);
        quest::depopall(214016);
        quest::depopall(214017);
        quest::depopall(214018);
        quest::depopall(214019);
        quest::depopall(214020);
        quest::depopall(214021);
        quest::depopall(214022);
        quest::depopall(214023);
        quest::depopall(214024);
        quest::depopall(214025);
        quest::depopall(214027);
        quest::depopall(214028);
        quest::depopall(214029);
        quest::depopall(214030);
        quest::depopall(214038);
        quest::depopall(214040);
        quest::depopall(214043);
        quest::depopall(214045);
        quest::depopall(214046);
        quest::depopall(214047);
        quest::depopall(214048);
        quest::depopall(214059);
        quest::depopall(214070);
        quest::depopall(214077);
        quest::depopall(214078);
        quest::depopall(214079);
        quest::depopall(214080);
        quest::depopall(214081);
        quest::depopall(214085);
        quest::depopall(214087);
        quest::depopall(214088);
        quest::depopall(214089);
        quest::depopall(214090);
        quest::depopall(214091);
        quest::depopall(214093);
        quest::depopall(214094);
        quest::depopall(214095);
        quest::depopall(214097);
        quest::depopall(214098);
        quest::depopall(214099);
        quest::depopall(214100);
        quest::depopall(214102);
        quest::depopall(214106);
        quest::depopall(214122);
    }
 }

# End of file	Zone: PoTactics	 ID: 214113 -- #Rallos_Zek_the_Warlord
