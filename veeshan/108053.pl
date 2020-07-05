#Xygoz
# items: 69333, 69335, 69385, 69386

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("Well, I must say it is refreshing to find a new being in my lair after so many years. I have lived a long and fruitful life, yet I yearn for the past and a time when some of us were still whelps, where we learned everything we knew from our masters. My mentor was of the first brood, an ancient dragon, older than any of the other dragons save Veeshan herself. She was and still is a very powerful dragon and I yearn to speak with her. Her name is Lendiniara the Keeper and was the best teacher any dragon could ever have. How would you like to connect me with her great mind? You could perhaps [" . quest::saylink("deliver") . "] a message for me, since I cannot travel these days.");
	} elsif ($text=~/deliver/i && $faction == 1) {
		quest::say("This is indeed a fortunate day for me. Take this letter to Lendiniara for me. It is no ordinary letter. My message is scribed with a magic only she can see. She will be proud I have used a magic she taught to me to greet her again. Thank you for the assistance mortal.");
		quest::summonitem(69333); # Item: Note from Xygoz
	}
}

sub EVENT_ITEM {
	if ($faction == 1) {
		if (plugin::check_handin(\%itemcount, 69335 => 1)) {
			quest::say("Is this trinket truly meant for me? Lendiniara was not one for giving gifts. Oh, how I miss her. I must thank you again. Once again I'm brimming with pride because of my mentor. Here is your reward. If it doesn't suit you, please give it back and I will find something that does. Farewell.");
			quest::summonitem(69385); # Item: Necklace of the Melodic Dragon
			quest::exp(1000);
		} elsif (plugin::check_handin(\%itemcount, 69385 => 1)) {
			quest::say("How utterly obtuse and arrogant. How about this one then?");
			quest::summonitem(69386); # Item: Flame-Tempered Girdle
		} elsif (plugin::check_handin(\%itemcount, 69386 => 1)) {
			quest::say("How utterly obtuse and arrogant. How about this one then?");
			quest::summonitem(69385); # Item: Necklace of the Melodic Dragon
		}
	}
	plugin::return_items(\%itemcount);
}

# Quest by mystic414