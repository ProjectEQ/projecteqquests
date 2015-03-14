####LOC 888184
#This generates and saves locations for copy and paste.
#Yes = save
#No = Depop
#Break = Line break in .txt

sub EVENT_SAY {
if ($text=~/hail/i) {
quest::say("[Yes] or [No]. [Break]");
}

if ($text=~/Yes/i) {
my $LocX = $npc->GetX();
my $LocY = $npc->GetY();
my $LocZ = $npc->GetZ();
my $LocH = $npc->GetHeading();
quest::say( "quest::spawn2(ReplaceID,0,0, $LocX, $LocY, $LocZ , $LocH);") ;
quest::write("text_files/LocGen.txt","quest::spawn2(298203,0,0, $LocX, $LocY, $LocZ , $LocH);");
quest::depop();
}

if ($text=~/No/i) {
quest::depop();
}

if ($text=~/Break/i) {
quest::write("text_files/LocGen.txt"," ");
}

}

### Disable this if you want more detailed control ###
sub EVENT_SPAWN {
my $LocX = $npc->GetX();
my $LocY = $npc->GetY();
my $LocZ = $npc->GetZ();
my $LocH = $npc->GetHeading();
$rndadd = $rndadd + 1;
#quest::say( "quest::spawn2(ReplaceID,0,0, $LocX, $LocY, $LocZ , $LocH);") ;
quest::say( "if (rand == $rndadd){quest::spawn2(298200,0,0, $LocX, $LocY, $LocZ , $LocH); }") ;
quest::write("text_files/LocGen.txt","if (rand == $rndadd){quest::spawn2(298208,0,0, $LocX, $LocY, $LocZ , $LocH); }");
#quest::settimer("depop",1);
}

sub EVENT_TIMER {
if ($timer eq "depop") {
quest::stoptimer("depop");
quest::depop()
  }
}
