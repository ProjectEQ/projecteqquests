# Rogue Epic NPC -- Yendar_Starpyre

sub EVENT_SAY {
  if($text=~/hail/i) {
<<<<<<< HEAD
    quest::say("Hail, traveler! I sense you did not simply chance upon my isolation here, but are instead seeking me for something.");
=======
	  if ($client->GetGlobal("Fatestealer_forge") ==1) { #Rogue 1.5  
		quest::say("Well, if it isn't $name. I trust you don't have any unsavory women tailing you again. There's nothing more unnerving than a humie lass armed with poisoned blades. He shivers involuntarily. Still gives me nightmares to this day. But enough about that. I'm certain you didn't seek me out again for small talk. What can I help you with? Recovered any unusual artifacts lately?");
		
		quest::emote("Actually, I've been meaning to speak with you about that. When I had time alone to study the Book of Souls, I discovered that there was a section with details on how to utilize the tainted souls. In particular, how to merge them with inanimate objects. Quite interesting light reading. Unfortunately, some of the most important pages had been torn out. I can't imagine who would do such a thing. If you ever come upon these pages, which wouldn't be unusual considering your talent for acquiring unusual artifacts, please allow me to translate them for you. I'd be most interested to find out how this story ends. Oh, and this time, watch your back and don't let any strangers follow you. My heart can't take another surprise from your admirers.");
		}
	  else {
		quest::say("Hail, traveler! I sense you did not simply chance upon my isolation here, but are instead seeking me for something.");
	   }
  }
  if($text=~/blue orb/i) {
	quest::say("Ah yes, a blue orb composed of strange metal. My studies referred to an artifact such as that. I believe it was once in the hands of a gentleman called Laarthik K'Shin. And Laarthik, he was in the employ of someone or other, hmm. Forgive my poor memory.' His eyes widen suddenly, 'Oh! I do recall that the metal orb could be reforged over extreme heat if you were able to recover every missing piece. That by itself wouldn't be enough though, you'd need a binding element with the same aura. Furthermore, if you don't have all the pieces, melding a piece with several diamonds of bluish hue inside a forge may indicate where the remaining fragments are hidden. The orb wants to be whole again.");
>>>>>>> f835478835597030526c9cc9e1d0fbb45f74dfb1
  }
  if($text=~/translate/i) {
    quest::say("Oh, if it is written in Eder Teir'Dal, most likely I can translate it. I will be happy to try, in any case. Let me see it, please.");
  }
  if($text=~/key/i) {
    quest::say("In the Plane of Hate, where dwell Innoruuk and his minions, there is a tome. This tome is called the Book of Souls.");
  }
  if($text=~/book of souls/i) {
<<<<<<< HEAD
    quest::say("The Book of Souls chronicles all the lives Innoruuk has tainted over the years. It is in the care of the Maestro of Rancor. I can use this tome as a basis for my translation, if you return it and the note to me. An experienced practitioner in the art of non-detection should be able to snatch it from its resting place, don't you think, $race?");
=======
    quest::say("The Book of Souls chronicles all the lives Innoruuk has tainted over the years. It is in the care of the Maestro of Rancor. I can use this tome as a basis for my translation, if you return it and the note to me. An experienced practitioner in the art of non-detection should be able to snatch it from its resting place, don't you think, $race?'");
>>>>>>> f835478835597030526c9cc9e1d0fbb45f74dfb1
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28053 => 1)) {
    quest::say("I say, this is indeed a challenge. This is written in what I'm sure is the language of the High Priesthood of Innoruuk. I've often wished I could read this, but I have never had the key to unlock the language. Take this for now.");
    quest::ding();
    quest::exp(500);
    quest::summonitem(28055);
  }
<<<<<<< HEAD
  elsif(plugin::check_handin(\%itemcount, 28055 => 1, 28016 => 1)) {
=======
  elsif(plugin::check_handin(\%itemcount, 28055 => 1, 28016=> 1)) {
>>>>>>> f835478835597030526c9cc9e1d0fbb45f74dfb1
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::say("My, this is quite a large list! Yes, I can use the names and dates recorded here to help me understand the script. It should be a simple matter now. A moment, please. Aha, yes, there we go. Translated as best I can! I do hope you're not involved in what is described here, as it is quite fiendish. Oi! You, woman! Give that back! $name, that woman there took your letter! I think I should leave you to discuss it with her. Best of luck!");
    quest::spawn2(56172, 0, 0, $x - 10, $y + 10, $z, $h);
    quest::depop_withtimer();
  }
  elsif(plugin::check_handin(\%itemcount, 52335 => 1)) {
	quest::say("Splendid! The missing pages I had been looking for! Allow me a moment to sift through them.' He scans the texts line by line, flipping quickly from one sheet of parchment to another. Withdrawing a quill he quickly makes notes in the margins, then snatches your journal and copies the notes there. 'Yes, it is exactly as I had predicted. These texts detail the process by which an object can be imbued with a tortured soul. Unfortunately the focus is mostly on weaponry, which doesn't interest me in the slightest. Ah well. Appreciate the effort, $name. Perhaps it will come in handy for you. Farewell and good luck.");
	quest::setglobal('Fatestealer_page',1, 5, 'F' );
	$client->message(15,"You have learned how to imbue a blade with dark energy. ");
  }
  plugin::return_items(\%itemcount);
}

<<<<<<< HEAD
#END of FILE  Quest by: Solid11  Zone:steamfont  ID:56012 -- Yendar_Starpyre
=======
#END of FILE  Zone:steamfontmts  ID:448035 -- Yendar_Starpyre
>>>>>>> f835478835597030526c9cc9e1d0fbb45f74dfb1
