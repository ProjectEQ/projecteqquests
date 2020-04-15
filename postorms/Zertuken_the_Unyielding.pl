#Notifies Neffiken Lord of Kelek`Vor  that npc was killed in the camp.
sub EVENT_AGGRO {
  quest::settimer("tumadds",55);
}

sub EVENT_DEATH_COMPLETE {
  quest::signal(210176,0); # NPC: Neffiken_Lord_of_Kelek`Vor
  quest::stoptimer("tumadds");
}

sub EVENT_TIMER {
  if($timer eq "tumadds") {
    if($npc->IsEngaged()) {
      quest::spawn2(210247,0,0,($x + 10),$y,$z,$h); # NPC: A_tumultuous_storm
      quest::spawn2(210247,0,0,($x + 10),$y,$z,$h); # NPC: A_tumultuous_storm
      quest::spawn2(210247,0,0,($x + 10),$y,$z,$h); # NPC: A_tumultuous_storm
      quest::spawn2(210247,0,0,($x + 10),$y,$z,$h); # NPC: A_tumultuous_storm
      quest::spawn2(210247,0,0,($x + 10),$y,$z,$h); # NPC: A_tumultuous_storm
      quest::spawn2(210247,0,0,($x + 10),$y,$z,$h); # NPC: A_tumultuous_storm
      quest::spawn2(210247,0,0,($x + 10),$y,$z,$h); # NPC: A_tumultuous_storm
      quest::spawn2(210247,0,0,($x + 10),$y,$z,$h); # NPC: A_tumultuous_storm
      quest::spawn2(210247,0,0,($x + 10),$y,$z,$h); # NPC: A_tumultuous_storm
     } else {
      quest::stoptimer("tumadds");
     }
   }
}
