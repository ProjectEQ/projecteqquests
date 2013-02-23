sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18737)) { 
		$client->Message(15,"As you bask in the majesty of the Temple of Marr, an important looking individual, clad in shining metal armor turns to greet you. 'I can spot a new recruit a mile away. Welcome to the Temple of Marr. I am Valeron Dushire. Read the note in your inventory and hand it to me to begin your training. I wish you the best of luck.'");
  }
}

sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("I am Sir Valeron Dushire, leader of the order of the Knights of Truth. If your soul shines with purity and strength, I urge you to join our order. The might of Mithaniel Marr stands behind all who join. Soon that might will help us free this city from the tyranny of the [Freeport Militia].");
	}
	if($text=~/freeport militia/i) {
		quest::say("The Freeport Militia took control of this city long ago. They are nothing more than a group of thugs not worthy of respect. They follow the words of [Sir Lucan] D'Lere. He has been a thorn in this city's side for too long. If you wish to aid us in the fight against tyranny, go speak with Jemoz or Sir Theron. May the Truthbringer shine upon your soul.");
	}
	if($text=~/sir lucan/i) {
		quest::say("Lucan is a bad seed. You see, I trained Sir Lucan. He was nothing more than a street rat who was taken in by the Temple of Marr. The priests taught him and found him to be very agile and strong. They requested either the Priests of Marr or the Knights of Truth take him on as a squire. Gygus could not spare the trainers at the time and so we took the boy. The boy became a man, and a very formidable knight. Then something [went awry].");
	}
	if($text=~/went awry/i) {
		quest::say("During one of our crusades into the lands of Norrath, we left Sir Lucan in charge of the remaining knights. He did much good and the people respected him. He was overtaken by power. He soon began to hire mercenaries to guard the city, calling them the Freeport Militia. His true downfall began when he killed Sentry Dillius, a paladin of the Priests of Marr. His divine powers were stripped from his soul. He was a paladin no longer. He and his militia now control the city. They treat it as their playground and bully the populace. Someone must [stop Sir Lucan].");
	}
	if($text=~/stop sir lucan/i) {
		quest::say("That would be good, but I doubt you can. We have been trying for years and are unable to get him apart from the militia. If you do the impossible and destroy Sir Lucan, bring me his testimony. Every knight of the Hall of Truth carries a signed testimony. Sir Lucan still holds his.");
	}
	if($text=~/hero/i) {
		quest::say("His name has been long lost but his legend lives on in every young knight who aspires to continue his fight. He attempted to quell an evil that resided within Kithicor, perverting nature itself. Much to his relief, it was an earthly foe he fought against and not a denizen summoned from the planes of evil. Then, suddenly, he was surrounded by dozens of dark elves. He was captured and taken to the Dead to be experimented upon and had his soul twisted by vile necromantic magics. Then the Tier'Dal cast his remains to the winds. Where they landed, no one knew, until now. You have found one of his bones. I hereby charge you with a Holy Quest to bring this Hero's bones back for a burial with honors. Do you [accept], knight?");
	}
	if($text=~/i accept/i) {
		quest::say("Good! I knew you would. It is one of the highest honors one can receive. Your quest will not be easy for I know not where his other bones lay. A spy of ours within Neriak was able to surmise that six of his bones along with his sword and shield were scattered throughout Norrath. You must search far and wide to find the remaining pieces, as you already have one.. Do not give up. It is now your sacred duty. Once you have retrieved all eight pieces, come back to me and inform me that you [have all the bones].");
	}
	if($text=~/have all the bones/i) {
		quest::say("Excellent! You are indeed worthy to bear the title of Holy Knight! Now, about the coffin. I have spoken with Ping Fuzzlecutter, outside the western gates. Ask him about the coffin and once it is made, bring it to Simon Aldicott of Marr. I shall have Simon meet you by the lake in the Commonlands after Ping gives you the coffin.");
	}
	if($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121);
	}
	if($text=~/second book/i)	{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18737 => 1)) { #Tattered Note
		quest::say("Welcome to the Guild, here's your guild tunic. Once you are ready to begin your training please make sure that yo see Edwardian Holyblade, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13554); #Faded Purple Tunic*
		quest::ding();
		quest::faction(184,10); #Knight of Truth
		quest::faction(86,-15); #Dimal Rage
		quest::faction(105,-15); #The Freeport Militia
		quest::faction(258,10); #Priests of Marr
		quest::faction(311,10); #Steel Warriors
		quest::exp(100);
	}
	elsif(plugin::check_handin(\%itemcount, 6701 => 1)) { #a dusty old leg bone
		quest::say("According to this crest on the tunic, you have recovered one of the bones of a lost Paladin [Hero].");
		quest::summonitem(6701);
	}
	elsif(plugin::check_handin(\%itemcount, 18827 => 1)) { #a testimony of truth
		quest::say("Praise be to Marr!! You have done the impossible!! Sir Lucan is finally sent to the higher courts of the Tribunal. The city now has a chance to prosper. The Hall of Truth has been redeemed and gives you thanks. Take this, it is the Sword of Faith. May you wield it with righteousness. Beware of the remainder of the militia. They will be hunting for your head.");
		quest::summonitem(13947); # Brilliant Sword of Faith
	}
	else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
	}
  plugin::return_items(\%itemcount);
}

# EOF zone: freportn ID: 8077 NPC: Valeron_Dushire