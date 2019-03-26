sub EVENT_AGGRO {

quest::stoptimer(1);
quest::settimer(1,3000);


}

sub EVENT_DEATH_COMPLETE {

quest::stoptimer(1);

}

sub EVENT_TIMER {

if($timer == 1 && $mob->IsEngaged()) {
quest::stoptimer(1);
quest::settimer(2,600);

}

else
{
quest::spawn2(159691,0,0,$x,$y,$z,$h); # NPC: #Lord_Inquisitor_Seru_
quest::depop();
quest::stoptimer(1);
}

if($timer == 2 && $mob->IsEngaged()) {



quest::stoptimer(1);
quest::settimer(2,600);
}

else
{
quest::spawn2(159691,0,0,$x,$y,$z,$h); # NPC: #Lord_Inquisitor_Seru_
quest::depop();
quest::stoptimer(1);
      }
   }
