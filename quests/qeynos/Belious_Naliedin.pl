sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  if(plugin::check_hasitem($client, 18717)) { 
		$client->Message(15,"As you get your bearings, you hear a beautiful song. It almost seems to draw you towards it. It's as if you can hear a voice in your head as the music surrounds you. 'Welcome to the Wind Spirit's Song. I am Belious Naliedin. Read the note in your inventory and hand it to me when you are ready to begin your training as a bard.' The music then fades as quickly as it had begun.");
  }
}

sub EVENT_SIGNAL {
    quest::say("Sure. Go Ahead and play it now, while the stage is clear.");
}

sub EVENT_SAY {
  if ($text=~/Hail/i){
    quest::say("Welcome, my name is Belious Naliedin of the League of Antonican Bards. A few years ago, I had finally saved up the money, and I bought this place. I settled in, and have been [working] here ever since.");
  }
  if ($text=~/working/i) {
    quest::say("Ah, this is my shop. I am a musician, well known for my ability both in tuning, and [building instruments.]");
  }
  if ($text=~/building/i) {
    quest::say("Young bards are often not the wealthiest people in Norrath, and oftentimes, they have nothing to accompany their beautiful voices when they sing. If young bards are able to locate, and bring to me the [various parts] to assemble a lute with, I provide the labor for free.");
  }
  if ($text=~/parts/i) {
    quest::say("If you are able to find an unfinished lute body, an unfinished lute neck, a box of lute strings, and a set of fine lute tuners I will be able to craft for you one of the best sounding lutes that you have ever heard in your young life, and it will be yours, free of charge. It has long been my desire to help out any young men and women who wish to explore the bardic arts.");
  }
  if ($text=~/i seek a famous bard/i) {
    quest::say("A famous bard, you say? Why you must be seeking none other than the great Baenar Swiftsong! He is not here as you can see. Mayhap you seek an audience with him? He is a busy man and has not the time to speak with everyone who wishes to preoccupy his time with useless prattle! You are many and he is but one! Leave him be, I beg of you, to continue his songwriting in peace.");
  }
  if ($text=~/i seek an audience with him/i) {
    quest::say("Ah! In order to gain an audience with him, you must have a letter of introduction from me, otherwise he will not give you the time of day.");
    quest::emote("laughs briefly.");
  }
  if ($text=~/give me a letter of introduction/i) {
    quest::emote("looks around.");
    quest::say("Well, you want a letter of introduction, eh? I think that fifty shiny platinum pieces sounds like a good introduction to me, my friend.");
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
	if(plugin::check_handin(\%itemcount, 18717 => 1)) { #Tattered Note
		quest::say("Good day friend, and welcome to the Wind Spirit's Song. Thank you for joining our cause. Go speak with Jusean Evanesque; I'm sure you'll fit in well. And once you are ready to test your hunting and gathering abilities please see Sollari Bekines, she will have some work for you. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::summonitem(13502); #Brown Tunic*
		quest::ding();
		quest::faction(192,10); #League of Antonican Bards
		quest::faction(184,10); #Knights of Truth
		quest::faction(135,10); #Guards of Qeynos
		quest::faction(273,-15); #Ring of Scale
		quest::faction(207,-15); #Mayong Mistmoore
		quest::exp(100);
	}
	elsif(plugin::check_handin(\%itemcount, 20374 => 1)) {
		quest::say("A famous bard, you say? Why you must be seeking none other than the great Baenar Swiftsong! He is not here as you can see. Mayhap you seek an audience with him? He is a busy man and has not the time to speak with everyone who wishes to preoccupy his time with useless prattle! You are many and he is but one! Leave him be, I beg of you, to continue his songwriting in peace.");
		quest::exp(100);
	}
	elsif($platinum >= 50) {
		quest::say("Ah! Here is that letter of introduction I was looking for! Baenar likes to frequent a serene fountain in the southern Karanas. He finds the peace there accommodating to his work. He may even sing a tale for you if the mood strikes him.");
		quest::summonitem(20373);
	}
	elsif(plugin::check_handin(\%itemcount, 13775 =>1, 13776 =>1, 13777 =>1, 13778 =>1 )) {
		quest::summonitem(13105); 
		quest::exp(1000);
		quest::say("Here is your custom lute, use it well $name.");
	}
	else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Bard');
	}
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:qeynos  ID:1133 -- Belious_Naliedin