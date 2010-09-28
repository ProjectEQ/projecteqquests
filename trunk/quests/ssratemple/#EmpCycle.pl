#BEGIN File: ssratemple\#EmpCycle.pl

my $BloodCoolDownTime = "M" . int(rand(60)) + 180; #Waiting time to reattempt Emp after failure (Current setting: 3-4 hours)
my $EmpRepopTime = "M" . int(rand(2880)) + 4320; #Respawn time for Emp after success (Current setting: 3-5 days)
my $EmpPrepTime = 30; #Seconds before Emp becomes targetable after killing Blood/Golem

my $EmpPrep = "0";

sub EVENT_SPAWN {
  quest::settimer("EmpCycle",10); #Cyclical Timer
}

sub EVENT_TIMER {
  if ($timer eq "EmpCycle") {
    if (!defined($qglobals{Emperor}) && !defined($qglobals{BloodCoolDown})) { #Emperor is ready to spawn
      quest::setglobal("Emperor",1,0,"F"); #Normal Cycle Start
    }
    if (($qglobals{Emperor} == 1) && !$entity_list->GetNPCByNPCTypeID(162065)) {
      quest::spawn2(162189,0,0,877.0,-325.0,400.5,192.0); ##Blood_of_Ssraeshza
      quest::spawn2(162065,0,0,990.0,-325.0,415.0,192.0); ##Emperor_Ssraeshza (No Target)
    }
    if (!defined($qglobals{BloodCoolDown}) && ($qglobals{Emperor} == 2) && !$entity_list->GetNPCByNPCTypeID(162065) && !$entity_list->GetNPCByNPCTypeID(162227) && ($EmpPrep == 0)) {
      quest::spawn2(162064,0,0,877.0,-325.0,400.5,192.0); #Ssraeshzian_Blood_Golem
      quest::spawn2(162065,0,0,990.0,-325.0,415.0,192.0); ##Emperor_Ssraeshza (No Target)
    }
  }
  if ($timer eq "EmpPrep") {
    quest::stoptimer("EmpPrep");
    quest::depop(162065); ##Emperor_Ssraeshza (No Target)
    quest::spawn2(162227,0,0,990.0,-325.0,415.0,192.0); ##Emperor_Ssraeshza_ (Real)
    quest::setglobal("Emperor",2,0,"F");
    quest::setglobal("BloodCoolDown",0,0,$BloodCoolDownTime); #Cooldown timer
    $EmpPrep = 0;
  }
}

sub EVENT_SIGNAL {
  if ($signal == 1) { #Blood or Blood Golem is dead
    quest::settimer("EmpPrep", $EmpPrepTime);
    $EmpPrep = 1;
  }
  if ($signal == 2) { #Emperor is dead
    quest::setglobal("Emperor",3,0,$EmpRepopTime); #Emp respawn timer
  }
  if ($signal == 3) { #Raid Failure
    quest::setglobal("BloodCoolDown",0,0,$BloodCoolDownTime); #Cooldown timer
  }
}

#END File: ssratemple\#EmpCycle.pl (162260)