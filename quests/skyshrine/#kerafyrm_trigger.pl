sub EVENT_SPAWN {
$qglobals{kerafyrm} = undef;

 if((!defined $qglobals{kerafyrm}) || (defined $qglobals{kerafyrm} && $qglobals{kerafyrm} != 3)) {
  quest::settimer("kerafyrma",30);
}
 elsif(defined $qglobals{kerafyrm} && $qglobals{kerafyrm} == 3) {
  quest::settimer("depop",1);
 }
}

sub EVENT_TIMER {
 if($timer eq "kerafyrma" && defined $qglobals{kerafyrm} && $qglobals{kerafyrm} == 1) {
  quest::signalwith(114508,66,0);
  quest::signalwith(114435,66,1);
  quest::stoptimer("kerafyrma");
  quest::settimer("kerafyrmb",30);
  $qglobals{kerafyrm} = undef;
}
 elsif($timer eq "kerafyrma" && defined $qglobals{kerafyrm} && $qglobals{kerafyrm} == 2) {
  quest::spawn2(114583,20,0,1197.73,1257.63,3.752,0);
  quest::stoptimer("kerafyrma");
  quest::settimer("kerafyrmc",1);
  $qglobals{kerafyrm} = undef;
}

 if($timer eq "kerafyrmb" && defined $qglobals{kerafyrm} && $qglobals{kerafyrm} == 2) {
  quest::spawn2(114583,0,0,1,1,1,0);
  quest::stoptimer("kerafyrmb");
  quest::settimer("kerafyrmc",1);
  $qglobals{kerafyrm} = undef;
}

 if($timer eq "kerafyrmc" && defined $qglobals{kerafyrm} && $qglobals{kerafyrm} == 3) {
  quest::stoptimer("kerafyrmc");
  quest::depop();
  $qglobals{kerafyrm} = undef;
}
 if($timer eq "depop") {
  quest::stoptimer("depop");
  quest::depop();
 }
}

sub EVENT_DEATH {
  quest::stoptimer("kerafyrma");
  quest::stoptimer("kerafyrmb");
  quest::stoptimer("kerafyrmc");
  quest::stoptimer("depop");
}