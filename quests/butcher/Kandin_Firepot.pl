sub EVENT_SAY {
  if($text =~ /hail/i) {
	quest::say("Hello, there! Don't have time to talk. I'm workin', workin', workin'! Careful! Don't slip in the oil!");
  }
 if(defined $qglobals{wizepicK}) {
  if($text =~ /what oil/i) {
	quest::say("Ah the oil! I recently sent a specially crafted golem to explore through a huge portal to another plane. It's instructions were to collect special oil that I suspect existed in the plane. What I think is the golem broke down. This looks like a good task for one like you. Go see what's wrong with the golem. Here is spare gears of mine incase it's broken. Be careful though, if you put it in wrong it could explode or worse!");
	quest::summonitem(14319);

  }
 }
}

sub EVENT_ITEM {
	#Note handin:
	if(plugin::check_handin(\%itemcount,18169 => 1)) {
		quest::say("Brother! I have one of those. He's great, but he's dead. His name was Gabstik and he was a really powerful wizard. I still have one of his greatest possesions! You look like you could use it. I've added another thing to my shopping list. I require a dry brittle skin that I can mold or a rare oil found in the planes that I can soak the fuse in. Get me one of these things and I'll trade it for my bother's stick.");
		quest::faction(342, 30); #Truespirit
		quest::setglobal("wizepicK",1,0,"F");
	}
	#oil Handin
	if(defined $qglobals{wizepicK} && plugin::check_handin(\%itemcount,14349 => 1)) {
		quest::say("Oh wow! You found the oil! Where is the golem? You didn't hurt him did you? I am very fond of him. Anyways, here is your reward a note and staff to give to that guy you were asking me about.");
		quest::summonitem(14339); #Staff of Gabstik 
		quest::summonitem(18168); #note
		quest::faction(342, 30); #Truespirit
		quest::delglobal("wizepicK");
	}
	#Cazic's Skin + Mistletoe Powder
	if(defined $qglobals{wizepicK} && plugin::check_handin(\%itemcount,14333 => 1, 14332 => 1)) {
		quest::summonitem(14339); #Staff of Gabstik 
		quest::summonitem(14336); #note
		quest::say("Great! Give this to Arantir so he knows you've helped me! Hey! Have you seen my lantern anywhere?");
		quest::delglobal("wizepicK");
		quest::faction(342, 30); #Truespirit
	#just Cazic's Skin
	} elsif(defined $qglobals{wizepicK} && plugin::check_handin(\%itemcount,14332 => 1)) {
		quest::say("Great! This is? What is this for again? Oh yeah, the casing for my firework. Here, you can have this then, oh no, wait. You can't yet. I forgot I needed another part to my firework, and you are exactly the person to get it for me! I need some mistletoe powder. Now, go find some for me! Go, go, go, go! Shoo! Oh, wait! Hold on to my bag for me, please. You can give it back after you've given me what I want.");
		#hack because we do not have this bag in the DB
		quest::say("**hack** Hand this skin back in when you turn in the mistletoe powder");
		quest::summonitem(14332);
	}
}