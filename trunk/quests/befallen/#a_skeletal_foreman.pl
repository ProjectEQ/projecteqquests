#Befallen script to spawn Sir arium Arcanum after the skeletal excavator's death

sub EVENT_SPAWN
{
	
	quest::say("Dig! Dig faster, you fools! Our masters say this ghost is all that stands in the way of the great one's return. Uncover his hiding place so that the forces of the Burning Dead might destroy him and recover its legacy!");
}
sub EVENT_DEATH
{
	quest::unique_spawn(36091,0,0,-43.5,-339.8,-10.9);		
}
		