#BeginFile lakerathe\Kazen_Fecae.pl
#Quest for Lake Rathetear - Kazen Fecae: Necromancer Epics (1.0, Pre & 1.5)

sub EVENT_SAY {
  if($text=~/hail/i) {
    if((plugin::check_hasitem($client, 20544)) && ($Soulwhisper < 1)) { #Scythe of the Shadowed Soul
      quest::say("It has been a while since we have talked. You have done well in obtaining your Scythe. The time has come however for you to perform another task for me. I do not wish to waste time, so in short, I want you to collect a most powerful staff for me. I only have a piece of it as the rest has mysteriously disappeared.");
      quest::setglobal("Soulwhisper",1,0,"F");
    }
    if($Soulwhisper==1) {
      quest::say("I wish to research this staff piece but first I need some special research tools. Take this note and travel to Steamfont. Find a gnome named Biddliss Sperandu and give him the note. When you obtain the research tools hand them to me.");
      quest::summonitem(9831); #Note to Biddliss
    }
    else {
      quest::emote("'s eyes seem to glow as he turns to you and says, 'Leave me be if you have no reason to be here, mortal!'");
    }
  }
  if($text=~/dark arts/i) {
    if($class == "necromancer" && $ulevel >= 50) {
      quest::emote("looks you up and down, his eyes glowing with a soft red light. After a moment he begins to speak though his lips do not move. 'You wish to study under me? Perhaps, if you prove yourself to follow the twisted path. If you prove to be as coldhearted as I then I will let you become my servant.'");
    }
    else {
      quest::say("Ha! You call yourself a Necromancer? Come back when you have tortured a few more souls!");
    }
  }
  if($text=~/prove/i) {
    quest::say("The wandering knight, Sir Edwin Motte, recently slew one of my lesser servants. This foolish knave travels from town to town pretending to be good. Separate his head from his body and return it to me so I may work my magics upon it. This fool will become another plaything for me, even in death.");
  }
  if($text=~/advance/i) {
    quest::say("I share great secrets with my more powerful servants who show me they are willing to server without question. Tell my servant the name of any symbol he gives you and he will instruct you. If I give you a symbol, speak its name to me so I may instruct you.");
  }
  if($text=~/symbol of apprentice/i) {
    quest::say("You have a long way to go before I teach you the true secrets of life and death. Visit Venenzi Oberendi in the Nektulos Forest and show her the symbol. She is collecting reagents for one of my experiments and is taking far too long. I do not wish her dead, yet, I simply need the reagents soon. Retrieve the reagents and give them to my assistant Emkel Kabae. I do not wish to handle them myself.");
  }
  if($text=~/reagents/i) {
    quest::say("'The reagents are the same types the great sorcerer Miragul used to cheat death and become a lich. I do not wish to become a lich as Miragul did, I have greater aspirations than to simply live forever as a hollow shell. I will rise up a being of pirit only, with a will off my own.' Kazen's eyes glow sickly red as he stared off toward the horizon.");
  }
  if($text=~/symbol of testing/i) {
    quest::say("Show me that you can overcome larger obstacles and manipulate servants. Gather a force for of mercenaries if you like, or so-called friends, if you desire, and prepare for battle, my promising young student. Return to me with the symbol of testing when you are prepared for battle with my creations. Have no fear, I will not slay you myself. If you do live, tell me the name of the symbol you receive.");
  }
  if($text=~/symbol of insanity/i) {
    quest::say("It is time for you to meet my partner, so to speak. Drendico Metalbones is his name and I assure you he is quite mad. His mind has been rended by fright, dread, and terror in his trips to the planes and his heart is full of hatred now. He has a tome which I wish you to use. Show him your symbol slowly and listen to his rantings well, they hide great knowledge.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20641 => 1)) { #Head of Sir Edwin Motte
    quest::say("'Excellent!' You watch Kazen hold the head by the hair and begin to cast a spell. A flash of darkness centers around the head, and the eyes of the dead knight open, a terrible scream emanating from its lips. 'This poor fool here - I think I will keep him in my bag from now on. You have done well, my new apprentice. Take this symbol and know that you can do other tasks to advance within my apprentice ranks.'");
    quest::exp(5000);
    quest::summonitem(20642); #Symbol of the Apprentice
  }
  elsif(plugin::check_handin(\%itemcount, 20647 => 1)) { #Symbol of Testing
    quest::say("As you hand Kazen the symbol, you hear him speak directly into your mind. 'Good luck, my student!' Kazen finishes an incantation and suddenly hands begin to reach up from the ground, as if they were pulling themselves from the grave all around you. A piercing scream fills the air as the creatures advance upon you!");
    quest::spawn2(51153,0,0,-1498.9,283.8,58.4,57.6); #a bone golem
  }
  elsif(plugin::check_handin(\%itemcount, 20653 => 1)) { #Prepared Reagent Box
    quest::emote("stares through you at the horizon, pausing as he reaches into his robes. Kazen pulls out a scythe with a shimmering black blade that seems too large to have been hidden there. As quickly and gracefully as it was displayed to you, it is returned to the void inside Kazen's robes. 'It is a creation of Miragul which was looted from his lair under the ice. Take this tome, it will be your final task for me as an apprentice.'");
    quest::exp(10000);
    quest::summonitem(18087); #Tome of Instruction
  }
  elsif(plugin::check_handin(\%itemcount, 20652 => 1)) { #Gkzzallk in a Box
    quest::emote("grins wildly and his eyes flare a deep red. The scythe he promised you flies through the air and into your hand. 'Enjoy your toy, I have no more need of you as a servant.'");
    quest::exp(10000);
    quest::summonitem(20544); #Scythe of the Shadowed Soul
  }
  elsif(plugin::check_handin(\%itemcount, 20612 => 1)) { #Piece of the Staff
    if($NecroPre==2) {
      quest::say("Geboron has told me that you would be giving this piece of the staff to me. Do not fear. While I am not angry with you for failing to bring me the staff, I am not thoroughly pleased either. However, this piece could hold the key to discovering the staff's whereabouts. I wish to research this staff piece but first I need some special research tools. Take this note and travel to Steamfont. Find a gnome named Biddliss Sperandu and give him the note. When you obtain the research tools hand them to me.");
      quest::summonitem(9831); #Note to Biddliss
      quest::delglobal("NecroPre");
      quest::setglobal("Soulwhisper",1,0,"F");
    }
    else {
      quest::say("What is this? Why do you waste my time giving me junk? Take it back and begone!"); #Still need real text
      quest::summonitem(20612); #Piece of the Staff
    }
  }
  elsif(plugin::check_handin(\%itemcount, 21799 => 1)) { #Biddliss's Research Tools
    quest::emote(" takes the tools from you. He opens the case and pulls out a small magnifying glass. It seems to faintly glow as he passes it over the surface of the staff piece.");
    quest::say("There appears to be a small rune etched in the wood.");
    quest::emote(" takes out a piece of parchment and draws a picture of the rune.");
    quest::say("I am not familiar with this rune. Take this drawing of the rune to Ruandia in the Plane of Knowledge. She is an expert on runes and should know what it means. From here on out I will want you to handle the research of this staff through my assistant Tebarin in the Plane of Knowledge. I am busy and do not wish to be disturbed further. Tebarin will communicate to me any progress you have made with helping to recover the staff.'");
    quest::summonitem(22691); #Drawing of Rune
  }
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}

#EndFile lakerathe\Kazen_Fecae.pl (51048)