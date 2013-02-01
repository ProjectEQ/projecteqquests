############################################
# ZONE: East Freeport (freporte)
# QUEST: Boat Beacon, L.S Pooch, Journal Strongbox
# DEVELOPER: MWMDRAGON
# REVISED: robregen: added-(Journal Strongbox)
############################################

sub EVENT_SAY {
	if(($text=~/hail/i) && ($faction <= 5)) {
		quest::say("Hi, kid! You seem to be a stranger in these parts. Heed my words, this city is dangerous to new blood!");
		quest::signal(10135,10);
	}
	if(($text=~/hail/i) && ($faction > 5)) {
		quest::say("Run while ye still can!!  The Wolves o' the North will not tolerate yer presence!");
	}
	if($text=~/toala sent me/i) {
		quest::say("She does not even have the courtesy to come herself. Some old friend!! Listen, some rogue in this city broke into the [Beast] and stole a pouch containing a voucher ticket for a part I need to repair the Beast. I can't get the part back without the ticket. I did not see the rogue. I did not sleep on the Beast that night. Bronto was there. Ask him if he saw the rogue.");
	}
	if($text=~/what beast/i) {
		quest::say("You're joking, right? You have never heard of the Blue Beast?!! She is the fastest ship in Norrath. She made the [Kunark run] in under three weeks. She was designed by [Bronto].");
	}
	if($text=~/kunark run/i) {
		quest::say("The Kunark run is the most dangerous run between Freeport and [Firiona Vie], in Kunark. If the seas don't rip your hull to splinters and the pirates and sea wyrms don't kill you, you can make a quick run back and forth, avoiding any unwanted inspections.");
	}
	if($text=~/Firiona Vie/i) {
		quest::say("Firiona Vie is an elven outpost on the continent of Kunark. Every so often I run supplies to and from there. Do not even think about asking me to take you there. It will be months before I can make improvements on the Blue Beast to make it impervious to aerial attacks.");
	} 
	if($text=~/journal strongbox/i) {
		quest::say("You must be from the Academy of Arcane Science.  Well, kid, bad news.  I was docked at the isle in the Ocean of Tears when I was boarded by the Freeport Militia.  To say the least, I panicked and dropped all my cargo.  It is still there.  Mostly illegal alcohol, but the strongbox is still out there, too.  Directly out from the dock.");
		quest::setglobal("strongbox",1,7,"H1");
	}  
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 13818 => 1)) { # Boat Beakon ID- 13818
		quest::ding();
		quest::say("Oh!! You must work for that Erudite named Palatos. I guess he won't have to spend anymore money drinking in Freeport. Here. Here is the portrait I kept until he could get me a new boat beacon.");
		quest::exp("100");
		#quest::givecash("0","0","0","0");
		### Random Item choosing if needed
		# $random=int(rand itemid+itemid+itemid);
		# quest::summonitem($randon);
		quest::summonitem("12146"); # A'kanon's Portrait ID-12146
		quest::faction("361","1"); # Wolves of the North Faction ID - 361
		quest::faction("294","1"); # Shamen of Justice Faction ID - 294
		quest::faction("143","1"); # Heretics Faction ID - 143
		quest::faction("147","1"); #High Guard of Erudin Faction ID - 147
	}
    if(plugin::check_handin(\%itemcount, 13814 => 1)) { # L.S. Pouch ID-13814
		quest::ding();
		quest::say("You found my pouch! Thanks kid. Let me buy you A drink and this is for the good work. Hmmmm. It looks as though they took my voucher. Darn it! Hey... It looks like they were using my bag to hold items they were stealing. Here you go. You can have it. It looks like junk. ");
		quest::exp("200");
		$random=int(rand 13922+13923); # Snapped Pole ID-13922 or Moggok's Right Eye ID-13923
		quest::summonitem($random);
		quest::givecash("0","2","0","0");
		quest::faction("361","2"); # Faction Wolves of the North ID-361
		quest::faction("294","2"); # Faction Shamen of Justice ID-294
		quest::faction("213","2"); # Faction Merchants of Halas ID-213
		quest::faction("311","2"); # Faction Steel Warriors ID-311
		quest::faction("275","-2"); # Faction Rogues of the White Rose ID-275
	}
	plugin::return_items(\%itemcount);
}




