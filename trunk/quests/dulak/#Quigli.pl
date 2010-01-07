#Quest file for Dulak's Harbor - #Quigli (225378)

#This is the attackable version spawned by the non-attackable version. He spawns a "crew" upon aggro.

sub EVENT_ATTACK {
  quest::say("You sorry sacks of vermin come aid me now!");
  #quest::spawn2(000000,0,0,$x+5,$y+5,$z,$h);
  #quest::spawn2(000000,0,0,$x-5,$y+5,$z,$h);
  #quest::spawn2(000000,0,0,$x+5,$y-5,$z,$h);
  #quest::spawn2(000000,0,0,$x-5,$y-5,$z,$h);
}