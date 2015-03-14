#This is the event controller for spawning Chamberlain Escalardian. Killing a Castellan of Air on the first island provides a 15% chance for spawning one of the three Constables. More than one constable can't be spawned at a time. After the first constable is spawned, the event trigger despawns within 90 minutes. After all three constables have been killed within the 90 minute time frame, the trigger despawns and pops either the Chamberlain or his apprentice with a 40% chance of the Chamberlain.

sub EVENT_SPAWN {
 $ConstableA = 0;
 $ConstableB = 0;
 $ConstableF = 0;
 $ConstableADead = 0;
 $ConstableBDead = 0;
 $ConstableFDead = 0;
 $Chance = 0;
 $State = 0;
 quest::settimer("ChamberlainCheck",5);
}

sub EVENT_SIGNAL {
if($signal == 0) {
 my $Chance = quest::ChooseRandom(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20);
 if($Chance == 1 && $ConstableA == 0 && $State == 0) {
  quest::spawn2(215010,0,0,461,498,-85.8,2.5);
  $State = 1;
  $ConstableA = 1;
 }
 elsif($Chance == 1 && $ConstableA == 1 && $ConstableB == 0 && $ConstableF == 0 && $State == 0) {
  my $Next = quest::ChooseRandom(1,2);
   if($Next == 1) {
    quest::spawn2(215482,0,0,461,498,-85.8,2.5);
    $State = 1;
    $ConstableB = 1;
   }
   if($Next == 2) {
    quest::spawn2(215009,0,0,461,498,-85.8,2.5);
    $State = 1;
    $ConstableF = 1;
   }
 }
 elsif($Chance == 1 && $ConstableA == 1 && $ConstableB == 1 && $ConstableF == 0 && $State == 0) {
  quest::spawn2(215009,0,0,461,498,-85.8,2.5);
  $State = 1;
  $ConstableF = 1;
 }
 elsif($Chance == 1 && $ConstableA == 1 && $ConstableB == 0 && $ConstableF == 1 && $State == 0) {
  quest::spawn2(215482,0,0,461,498,-85.8,2.5);
  $State = 1;
  $ConstableB = 1;
 }
 elsif($Chance == 2 && $ConstableB == 0 && $State == 0) {
  quest::spawn2(215482,0,0,461,498,-85.8,2.5);
  $State = 1;
  $ConstableB = 1;
 }
 elsif($Chance == 2 && $ConstableA == 0 && $ConstableB == 1 && $ConstableF == 0 && $State == 0) {
  my $Next = quest::ChooseRandom(1,2);
   if($Next == 1) {
    quest::spawn2(215010,0,0,461,498,-85.8,2.5);
    $State = 1;
    $ConstableA = 1;
   }
   if($Next == 2) {
    quest::spawn2(215009,0,0,461,498,-85.8,2.5);
    $State = 1;
    $ConstableF = 1;
   }
 }
 elsif($Chance == 2 && $ConstableA == 1 && $ConstableB == 1 && $ConstableF == 0 && $State == 0) {
  quest::spawn2(215009,0,0,461,498,-85.8,2.5);
  $State = 1;
  $ConstableF = 1;
 }
 elsif($Chance == 2 && $ConstableA == 0 && $ConstableB == 1 && $ConstableF == 1 && $State == 0) {
  quest::spawn2(215010,0,0,461,498,-85.8,2.5);
  $State = 1;
  $ConstableA = 1;
 }
 elsif($Chance == 3 && $ConstableF == 0 && $State == 0) {
  quest::spawn2(215009,0,0,461,498,-85.8,2.5);
  $State = 1;
  $ConstableF = 1;
 }
 elsif($Chance == 3 && $ConstableA == 0 && $ConstableB == 0 && $ConstableF == 1 && $State == 0) {
  my $Next = quest::ChooseRandom(1,2);
   if($Next == 1) {
    quest::spawn2(215010,0,0,461,498,-85.8,2.5);
    $State = 1;
    $ConstableA = 1;
   }
   if($Next == 2) {
    quest::spawn2(215482,0,0,461,498,-85.8,2.5);
    $State = 1;
    $ConstableB = 1;
   }
 }
 elsif($Chance == 3 && $ConstableA == 1 && $ConstableB == 0 && $ConstableF == 1 && $State == 0) {
  quest::spawn2(215482,0,0,461,498,-85.8,2.5);
  $State = 1;
  $ConstableB = 1;
 }
 elsif($Chance == 3 && $ConstableA == 0 && $ConstableB == 1 && $ConstableF == 1 && $State == 0) {
  quest::spawn2(215010,0,0,461,498,-85.8,2.5);
  $State = 1;
  $ConstableA = 1;
  }
 }
 elsif($signal == 1) {
$ConstableADead = 1;
$State = 0;
  if($DepopTimerState == 0) {
   quest::settimer("DepopTrigger",5400);
   $DepopTimerState = 1;
  }
 }
 elsif($signal == 2) {
$ConstableBDead = 1;
$State = 0;
  if($DepopTimerState == 0) {
   quest::settimer("DepopTrigger",5400);
   $DepopTimerState = 1;
  }
 }
 elsif($signal == 3) {
$ConstableFDead = 1;
$State = 0;
  if($DepopTimerState == 0) {
   quest::settimer("DepopTrigger",5400);
   $DepopTimerState = 1;
  }
 }
}

sub EVENT_TIMER {
if($timer eq "ChamberlainCheck") {
 if($ConstableADead == 1 && $ConstableBDead == 1 && $ConstableFDead == 1) {
  my $Spawn = quest::ChooseRandom(215480,215480,215480,215476,215476);
  quest::spawn2($Spawn,0,0,461,498,-85.8,2.5);
  quest::stoptimer("ChamberlainCheck");
  quest::depop_withtimer();
 }
}
elsif($timer eq "DepopTrigger") {
 quest::stoptimer("DepopTrigger");
 quest::stoptimer("ChamberlainCheck");
 quest::depop_withtimer();
 }
}

#Submitted by Jim Mills