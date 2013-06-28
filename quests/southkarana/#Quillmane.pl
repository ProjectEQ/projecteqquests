#Quillmane spawn
#npc - #Quillmane
#zone - SouthKarana
#Angelox
#Updated by Kilelen

sub EVENT_DEATH_COMPLETE{
	#quest::say("I'm dead");
	# If I was unspawnable and I died, make me spawnable again.
	if (defined $qglobals{quill} && $qglobals{quill} == 3) {
		quest::setglobal("quill",2,3,"F");
	}
}