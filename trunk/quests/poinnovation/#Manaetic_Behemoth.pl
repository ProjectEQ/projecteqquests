sub EVENT_SPAWN {

	quest::settimer(9,1200);
        quest::settimer(4,10);
	}

sub EVENT_DEATH
	{
	quest::signalwith(206038,1,1);
	}

sub EVENT_TIMER {

if($timer == 9)
	{
	quest::depop();
	}
if($timer == 4 && ($x < 1010 || $x > 1240))
        {
        $npc->GMMove(1125,0,12.5,0);
        quest::signalwith(206038,2,1);
        }

}