#Befallen script to spawn Sir Arium Arcanum after the skeletal foreman's death

sub EVENT_DEATH_COMPLETE {
  quest::unique_spawn(36091,0,0,-43.5,-339.8,-10.9); ##Sir Ariam Arcanum
}