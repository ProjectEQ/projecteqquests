sub EVENT_AGGRO
{

if($spawn == undef) {
quest::settimer(1,1800);
quest::spawn2(200036,0,0,270,-47,-59,0); 
quest::spawn2(200037,0,0,319,-25,,-59,0); 
quest::spawn2(200038,0,0,319,-149,-59,0); 
$spawn=1
}

}

sub EVENT_TIMER
{
quest::signal(200036,1); #depop mob 1
quest::signal(200037,1); #depop mob 2
quest::signal(200038,1); #depop mob 3
}

sub EVENT_DEATH_COMPLETE
{
$spawn=undef;
quest::spawn2(200035,0,0,408,150,-61.5,135);
}