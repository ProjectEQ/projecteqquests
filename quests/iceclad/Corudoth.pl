sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::emote("seems to completely ignore you. After close examination you begin to wonder if this creature is actually alive.");
	}
	if($text=~/owes helssen/i) {
		quest::say("What?! I owe him nothing! Nothing at all! I didn't ask him to.., err. What proof do you have? How do I know he sent you? Bah, leave me, $race.");
	}
	if($text=~/great foes/i) {
		quest::say("Yes. One of note was the vile and evil sorcerer Rosh. A better example of depravtity and anti-morality I cannot think of. He researched magics destined to end all life on this cold chunk of rock and snow. We made it our mission to destroy him. In the end we defeated him, but alas our friend and comrade was slain. Poor Abrams was left cursed forever to wander that spire of ultimate loathing, the Tower of Frozen Shadow.");
	}
	if($text=~/abrams/i) {
		quest::say("Abrams was a brave warrior and a good friend. His great maul could always be counted on to strike true as he used his body to shield others from grievous wounds. He sacrificed himself to save us from the eternal suffering he now endures up in that dark tower. The book you now seek, is in his possesion. You must first destroy his tormented form to free him from his madness. Tell him you seek the Arcanum and then give him the lock of hair I just gave you. You also will need the key?");
	}
	if($text=~/key/i) {
		quest::say("We ambushed Rosh on an expedition into the cursed Tower.  When we faced him, Abrams ran forward and grabbed the Arcanum. He held it to his chest as lightning and flame rained down upon him. With Rosh busy trying to save his book it gave Halldor and I enough time to strike Rosh down. We went to Abrams and found our friend left a smoking pile of Coldain ruin. He underwent a strange transformation in which the Arcanum was lost. We decided Halldor should keep the key.");
	}
	if($text=~/halldor/i) {  #NOTE# info on allakhazam stated Petcas drops the key.  Petcas no longer drops the key with this one --  This might of changed with the warrior 1.5 epic prequest which involves Petcas.
		quest::say("Halldor has retired from the life of an adventurer as I have. I would not tell you where he is as he is a good friend, but what I owe Helssen is stronger than comraderie or even friendship so I must comply; it is the word of Veeshan. Halldor now defends the halls in the great city of Thurgadin. To get the key you must fight your way into the city and kill Halldor. I wish you a most horrendous death, $race. Now leave me to my sleep.");
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 1710 => 1)) { # inscribed velium tablet
		quest::ding();
		quest::exp(1000);
		quest::emote("curses and goes into a fit of frustration before finally giving in. The ancient sea turtle finally says, 'Fine. I don't know what Helssen wants with that but I know where you can find it. Years and years back I traveled with a group was called the Icy Mugs. We were a mercenary company out for fun and profit, and there was plenty of that. During our adventures we ran across a great many foes.'");			
		quest::summonitem(1711); # Lock of Dwarven Hair
	}
	plugin::return_items(\%itemcount);
}

