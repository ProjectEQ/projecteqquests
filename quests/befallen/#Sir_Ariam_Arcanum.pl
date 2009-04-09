#Sir Arium Arcanum in Befallen. QUEST: Sir Arium's Bridal
#Edited by Sarepean to include Ariam's Medallion Quest

sub EVENT_SAY {
	if($text=~/hail/i){
		quest::say("My thanks for destroying these minions of Befallen's masters.This accursed place rends my soul trying to twist me to its purposes. My time here is short, so i must get this [task] done quikly.");
	}
	if($text=~/task/i){
		quest::say("I have this parchment that must be delivered to either the Knights of Truth in Freeport or to the Queen of Neriak. The contents of the note concern them both and I am desperate to have this matter addressed so ask that you take it to which ever of the cities will accept your presence. Will you take the note to the [Knights of Truth] or to [The Dead]?");
	}
	if($text=~/truth/i){
		quest::say("It must be delivered to Sir Artanis in the city of Freeport. It details a terrible plan of the masters of this place to restore life to a foul necromancer named Marnek. The Burning Dead must not be allowed to achieve this goal. So that you may ride swiftly with news of this nefarious scheme, take this as well, the bridle to the noble steed that was entombed alive with me here. He has strength enough for one final ride.");
        
		quest::summonitem(31492);
		quest::summonitem(18474);
		quest::depop();
	}
	if($text=~/dead/i){
		quest::say("Then take this parchment to the Queens assistant, the necromancer Xon, enemy of my enemy. I have no love for her, but Queen Thex's interests too are at risk. This details a terrible plan of the masters of this place to restore life to a foul necromancer named Marnek. The Burning Dead must not be allowed to achieve this goal. So that you may ride swiftly with news of this nefarious scheme, take this as well, the bridle to the noble steed that was entombed alive with me here.");
		
		quest::summonitem(31492);
		quest::summonitem(18474);
		quest::depop();
	}

	if($text=~/who or what/i){
	  quest::say("I am Sir Ariam Arcanum, a paladin of Tunare. There is no time for my own story, which is of little account. But if you wish to know more of me, and wish also to do me a personal favor then you could seek out my family in Felwithe, provided you are welcome there. Will you travel to Felwithe?");
	  }

	if($text=~/travel to felwithe/i){
	  quest::say("Then deliver this to my family. I have my sisters token to thank for my survival in this form. Something in the magic of this persisted even as I truly wasted away buried alive near here.");
	  quest::summonitem(31493);
	  }
}
