#Quillmane spawn
#npc - #an_elephant_calf - randomly spawns 1 of 3 Quilmane locs around the zone)
#zone - SouthKarana
#Angelox
# Updated by Kilelen

sub EVENT_DEATH{
	my $random_result = int(rand(100));
	my $a=14139; #npc - Quillmane
	# If Quillmane is spawnable, and we get the roll right, spawn him and make more copies unspawnable.
	if (defined $qglobals{quill} && $qglobals{quill} == 2) {
		if ($random_result < 5) {
			quest::spawn2($a,101,0,3210,-6821.6,38.3,193.3);
			quest::setglobal("quill",3,3,"F");
		} 
		
		elsif (($random_result>=5) && ($random_result<10)) {
			quest::spawn2($a,102,0,-2761.8,-6076,0.7,4.0);
			quest::setglobal("quill",3,3,"F");
		} 
		
		elsif (($random_result>=10) && ($random_result<15)) {
			quest::spawn2($a,103,0,-2333.8,1296.5,38.7,247.3);
			quest::setglobal("quill",3,3,"F");
		} 
		
		else {
			#quest::say("No spawn");
		}
	}
}