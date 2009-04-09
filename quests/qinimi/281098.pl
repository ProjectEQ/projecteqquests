# Rarundel's Memory

# Created by Gonner

sub EVENT_SAY {
}

sub EVENT_ITEM {

if(plugin::check_handin(\%itemcount, 67404 => 1)) { # Rarundel's Open Memory Box (non Container) 
	quest::emote("being opens the stone chest and looks inside.");
	quest::say("I thank you for returning this to me. It is one of the last things I remember before that fateful day when Krixt executed me in front of my people. Now I long only for the keepsake that is missing. I know that tyrannical brute has done something with it. If only someone would make him suffer the way I suffered. Place the keepsake in this box and return to me what is rightfully mine.");
	quest::summonitem(67418); # Rarundel's Open Memory Box (Container)
	}

if(plugin::check_handin(\%itemcount, 67623 => 1)) { # Rarundel's Closed Memory Box
	quest::say("I cannot believe this! Your kindness knows no bounds, which is why I must ask that you give this to my love, Rasnil. We were destined to be together until the legion took him away from me. Now he is a slave to them in the gardens. Please show this to him so that he will know that I was thinking of him even as I died.");
	quest::summonitem(67408); # Rarundel's Memroy Stone
	}

if(plugin::check_handin(\%itemcount, 67409 => 1)) { # Rasnil's Tear
	quest::emote("takes something from $name.");
	quest::emote("stops and concentrates on the tear before looking up at you and saying");
	quest::say("His pain touches me deeply and your willingness to help means more than you know. If only my father had accepted our union in life, maybe the pain we both felt would have been lessened. Perhaps the years of suffering have helped my father see things differently. Show him this and maybe he will give us his blessing.");
	quest::summonitem(67410); # Rarundel's Sealed Memory Box
	}

if(plugin::check_handin(\%itemcount, 67411 => 1)) { # Narundel's Decision
	quest::emote("looks at the glyph and then into your eyes.");
	quest::say("Thank you, adventurer, for bringing closure to this part of my life. Please take this as a token of my gratitude and as a memory of the great thing you have done.");	
	
	 if ($class eq "Warrior"){quest::summonitem(67413);} # Rarundel's Mended Memories

      elsif ($class eq "Berserker"){quest::summonitem(67413);} # Rarundel's Mended Memories

      elsif ($class eq "Ranger"){quest::summonitem(67414);} # Rarundel's Forgotten Memories 

      elsif ($class eq "Bard"){quest::summonitem(67414);} # Rarundel's Forgotten Memories 

      elsif ($class eq "Rogue"){quest::summonitem(67413);} # Rarundel's Mended Memories

      elsif ($class eq "Paladin"){quest::summonitem(67414);} # Rarundel's Forgotten Memories 

      elsif ($class eq "Shadowknight"){quest::summonitem(67414);} # Rarundel's Forgotten Memories 

      elsif ($class eq "Monk"){quest::summonitem(67413);} # Rarundel's Mended Memories

      elsif ($class eq "Beastlord"){quest::summonitem(67414);} #  Rarundel's Forgotten Memories 

      elsif ($class eq "Cleric"){quest::summonitem(67412);} # Rarundel's Broken Memories

      elsif ($class eq "Druid"){quest::summonitem(67412);} # Rarundel's Broken Memories

      elsif ($class eq "Shaman"){quest::summonitem(67412);} # Rarundel's Broken Memories

      elsif ($class eq "Enchanter"){quest::summonitem(67416);} # Rarundel's Faded Memories

      elsif ($class eq "Magician"){quest::summonitem(67416);} # Rarundel's Faded Memories

      elsif ($class eq "Necromancer"){quest::summonitem(67416);} # Rarundel's Faded Memories

      elsif ($class eq "Wizard"){quest::summonitem(67416);} # Rarundel's Faded Memories

      quest::exp(25000);

    }
	
}


#END of FILE zone:Qinimi ID:281098 -- 281098.pl  # Rarundel`s Memory

