#Captain_Rohand.pl
#Rohand's Brandy

sub EVENT_SAY {
	if($text=~/Hail/i)   {
		quest::say("Greetings, friend, and welcome to the Mermaid's Lure. Here, we sell fishing supplies and some imported goods from far-off lands. And, if you've got a few minutes, I could even tell you a [story] or two.");
	}
   
	if($text=~/story/i)   {
		quest::say("Stories? Stories? I saw more adventure before I was ten years tall than you'll see in your whole miserable existence. I've been everywhere, [Odus], [Faydwer], [Kunark]. . . You name it, and I can tell ya a little something 'bout it. . . If you buy me a sip of brandy, of course!");
	}
	
	if($text=~/Odus/i)   {
		quest::say("You haven't lived until you've seen Odus. Erud was the first human to cross the sea, and he founded the great city of Erudin. The trade routes from here to Odus are busy and prosperous, but can also be very dangerous.");
	}
	
	if($text=~/Faydwer/i)   {
		quest::say("I call Faydwer the home of the little people. They say the continent was named by the high elves when they landed on its shores long ago. I've even heard tales of an ancient elven vampire who lives there. . . Just another Felwithe legend, I'll bet!");
	}
	
	if($text=~/Kunark/i)   {
		quest::say("Even I can't tell you much about that continent. Kunark is a tough place, populated by even tougher creatures. I hear the high elves of Faydwer have been trying for years to establish a small port on Kunark's hostile shores.");
	}
}

sub EVENT_ITEM {	
	if (plugin::check_handin(\%itemcount, 13034 => 1)) {#Brandy
		quest::say("Yeah, this is just what I've been craving!");
		quest::faction(217, 10);#Merchants of Qeynos
		quest::faction(33, -20);#Circle Of Unseen Hands
		quest::faction(9, 10);#Antonius Bayle
		quest::faction(369, 10);#Coalition of Tradefolk III
		quest::faction(135, 10);#Guards of Qeynos
		quest::exp(8000);
	}
	plugin::return_items(\%itemcount);
}

#End of File zone:qeynos ID: 1101 -- Captain_Rohand.pl