sub EVENT_SAY {
  $InIkkyV3 = quest::GetInstanceID("ikkinz",3);
  $InIkkyV4 = quest::GetInstanceID("ikkinz",4);
  $InIkkyV5 = quest::GetInstanceID("ikkinz",5);
  $raid = $client->GetRaid();

  if ($text=~/hail/i) {
    if (defined($qglobals{ikky}) && ($qglobals{ikky} == 7)) { 
      quest::say("Welcome back, $name. Have you found any clues from the [" . quest::saylink("Crumbled Sanctuary") . "] yet? Please find anything you can and return to me as soon as possible!");
    }
    if (defined($qglobals{ikky}) && ($qglobals{ikky} == 10)) { 
      quest::say("I wasn't expecting you back so soon, $name, but I'm glad you're here. I've been analyzing the glyphs on the last three artifacts you recovered and, the way I read them, it seems the trusik priests used the [" . quest::saylink("four temples") . "] around the Altar of Destruction to gain access to a temple to face some kind of final rite passage.");
    }
    if (defined($qglobals{ikkypit}) && ($qglobals{ikkypit} == 1)) { 
      quest::say("Welcome back, $name. I've been looking over those artifacts you returned to me in the sealed bag and I'm afraid I have some disturbing news. It seems the artifacts weren't artifacts at all, but objects of ghastly power held by the dark spirits you collected them from. What's worse is that since you've collocted these objects, the energy emanating from the pit has [" . quest::saylink("gotten stronger") . "]!");
    }
	if (defined($qglobals{ikky}) && ($qglobals{ikky} >= 2)) {
	  $client->Message(15, "Tublik Narwethar says, 'If you want to see what you've completed at any time, just ask me for a [" . quest::saylink("progress update") . "]!'");
	}
    else {
      quest::emote("glances at you suspiciously. 'Can I help you with something? Has someone sent you? Speak up!'");
    }
  }
  if (($text=~/progress update/i) && defined($qglobals{ikky})) {
   PROGRESS_UPDATE();
  }
  if (($text=~/stone tablet/i) && defined($qglobals{ikky}) && ($qglobals{ikky} == 6)) {
    quest::say("You need a stone tablet? What for? What have you got that's so special it requires the use of a stone tablet?");
  }
  if (($text=~/crumbled sanctuary/i) && defined($qglobals{ikky}) && ($qglobals{ikky} >= 7)) {
    quest::say("Oh yeah, I know all about that thing. It was a temple that was decimated by the Muramites during their initial invasion. We're unsure what caused them to destroy that temple, but not the other three. I need you to go to the temple and [" . quest::saylink("look for clues") . "] as to what the reason may have been for destroying the temple.");
  }
  if (($text=~/look for clue/i) && defined($qglobals{ikky}) && ($qglobals{ikky} >= 7)) {
    quest::say("I have no idea what the clues may look like, but I'm hoping they'll bring about some insight as to the reason behind the Muramites destroying the temple. Once you've recovered all the clues you can find, please come back to me so I can go over them. If we're lucky, I'll be able to decipher what the real cause was and we can relay that important news to the brotherhood. Off you go, $name, and good luck!");
  }
  if (($text=~/gather some materials/i) && defined($qglobals{ikky}) && ($qglobals{ikky} >= 8)) { 
    quest::emote("shakes his head. 'I know it's not very pleasant, but you've got to remember that these Muramites are a new type of scum like nothing else we've ever come across. I think we can salvage some information from this, but it will require you to venture back into areas infested with Muramites. You'll need to [" . quest::saylink("gather some materials") . "] for me so we can sew the flesh back together.");
  }
  if (($text=~/made of flesh/i) && defined($qglobals{ikky}) && ($qglobals{ikky} >= 8)) { 
    quest::say("The first thing you'll need is a needle. We can't take any chances with the use of Muramite-altered flesh so you'll need to make your own. To do so, you'll need to find four bone chips and combine them with someo f the weird black residue that the Muramites leave behind when they die. You should be able to fashion them together with a sweing kit. The next thing you'll need to do is get some [" . quest::saylink("strands of hair") . "] to keep the flesh together.");
  }
  if (($text=~/strands of hair/i) && defined($qglobals{ikky}) && ($qglobals{ikky} >= 8)) { 
    quest::say("You'll need to gather four strands of hair from the local hynids. They're not friendly, so be careful when you encounter one. Once you've gotten the strands and made your needle, you're going to need to sew the strands together using the needle. It seems strange I know, but remember that the best solutions are usually the simplest ones. Take the hynid thread and the needle and your four peices of flesh and sew them together. That should get you what you need. Once you've sewn the clue back together, give it to me and I may finally be able to understand it.");
  }
  if (($text=~/ritual/i) && defined($qglobals{ikky}) && ($qglobals{ikky} == 9)) {   
    quest::say("I've been assuming that only the Muramites were so cruel that they would rip flesh from another living being in this manner, but it appears that the trusik priests were the ones that did it. They etched glyphs into the skin and then removed it to be used later. The glyphs represent the four temples and their direct connection to the Altar of Destruction. It looks as though there may be [" . quest::saylink("more clues") . "] about the Altar of Destruction and its surrounding temples in the trial temples.");
  }
  if (($text=~/more clues/i) && defined($qglobals{ikky}) && ($qglobals{ikky} == 9)) {
    quest::say("I need you to return to the three temples where you participated in the three trials. Based on this clue, I believe you will find three additional clues about the Altar of Destruction in the Temple of Singular Might, the Temple of Twin Struggles, and the Temple of the Tri-Fates. I doubt they'll be hard to find, but you must go to each and search for the clues! Return to me when you have found them!");
  }
  if (($text=~/pit of the lost/i) && defined($qglobals{ikky}) && ($qglobals{ikky} >= 10)) {
    quest::say("I see Kevren finally sent someone to me to look into the pit. It's about time! I've been telling him over and over that there are some really strange things going on in the Pit of the Lost to the north of here, but he just doesn't seem to want to pay enough attention to the claims. In any case, you're here now and that means that you must be [" . quest::saylink("willing to look") . "] into the odd occurrences, right?");
  } 
  if (($text=~/willing to look/i) && defined($qglobals{ikky}) && ($qglobals{ikky} >= 10)) {
    quest::say("I'm glad I can count on you. You need to know a couple things before you go. As I said, there are strange things going on in the pit, but we're not sure what they are yet. We have sensed an energy force emanating from that area and believe there are some kind of artifacts there that must be collected. We need you to [" . quest::saylink("collect the artifacts") . "] and return them so we can study them.");
  }
  if (($text=~/collect the artifacts/i) && defined($qglobals{ikky}) && ($qglobals{ikky} >= 10)) {
    quest::emote("hands you a bag. 'Place four artifacts you find from the pit in this bag and seal it off. Return the sealed bag to me when you're done so I can further examine what you find. Make haste to the Pit of the Lost and be careful -- there's no telling what kind of evils are waiting for you there. If you have someone else with you that [needs a bag], have them tell me so.'");
    quest::summonitem(60155);
  }
  if (($text=~/stop it/i) && defined($qglobals{ikky}) && ($qglobals{ikky} >= 10) && !defined($qglobals{ageless})) {
    quest::say("You must return to the Pit of the Lost and find whatever this fiend is and destroy it. I believe that it will have some kind of artifact that is linked to the ones you returned to me in the sealed bag. Return whatever it may have to me. Good luck, $name, I have no doubt that the artifact it holds will be as interesting of a find as anything else we've uncovered so far!");
    quest::spawn2(293221,0,0,2176,2184,-476,137);
    quest::setglobal("ageless",1,0,"H8");
  }
  if (($text=~/four temples/i) && defined($qglobals{ikky}) && ($qglobals{ikky} >= 10)) {
    quest::say("As you've already uncovered, the Sanctuary of Divine Destruction was used to uncover the purpose for the other three. I believe the Muramites destroyed that temple because it holds the key to the remaining three temples and the artifacts that they hold. Now that we know what's ahead, we can continue forth and unravel this [" . quest::saylink("mystery") . "].");
  }
  if (($text=~/mystery/i) && defined($qglobals{ikky}) && ($qglobals{ikky} >= 10)) {
    quest::say("It's clear to me that you must proceed into each of the three remaining temples and recover the three artifacts that are in them. It's up to you how you want to proceed, but you will have to enter the [" . quest::saylink("Sanctuary of the Righteous") . "], the [" . quest::saylink("Sanctuary of the Glorified") . "], or the [" . quest::saylink("Sanctuary of the Transcendent") . "]. Each one of these holds an artifact that I believe will be used to gain entrance to whatever lies beyond the Altar of Destruction. Which will you choose?");
  }
  if (($text=~/gotten stronger/i) && defined($qglobals{ikkypit}) && ($qglobals{ikkypit} >= 1)) {
    quest::say("The power wasn't as noticeable before. Now, though, it seems there's a fiend in the pit that's become agitated by the removal of these objects we've been collecting. I believe that whatever is behind the energy disruption kept a watchful eye over those objects. Now that they're gone, I believe it will try to find them again and destroy anything and everything in its path in the process. You must [" . quest::saylink("stop it") . "] before it has a chance!");
	quest::delglobal("ikkypit");
  }
  if ($text=~/sanctuary of the righteous/i) {
	if ($raid) {
	    if ($raid->RaidCount() <= 54) {
		  if (!defined $qglobals{ikkylockout3}) {
			if (defined($qglobals{ikky}) && ($qglobals{ikky} >= 10)) {
			  if ($InIkkyV3 == 0) {
				$Instance = quest::CreateInstance("ikkinz",3,21600);
				quest::AssignRaidToInstance($Instance);   
				quest::say("Instance added.");
				quest::say("The glyphs you recovered show an Artifact of Righteousness that is guarded by a sentinel that is ages old. You will find the Sanctuary of the Righteous to the south of the Altar of Destruction. You must gather a raiding party several times larger than your normal party's size and be prepared for anything. Find an entrance to the inner chambers of the Sanctuary of the Righteous and recover the artifact. May you be gifted with the luck of the brotherhood. I fear you may need it.");
			  }
			  else {
				$client->Message(13, "You are already in an instance!");
			  }
			}
		  }
		  else {
			$client->Message(13, "You have recently completed this raid.");
		  }
		} else {
			$client->Message(13, "You have ".$raid->RaidCount()." players in raid.  Only 54 allowed");
		}
    }
    else {
      $client->Message(13, "You are not in a raid!");
    }
  }
  if ($text=~/sanctuary of the glorified/i) {
    if ($raid) {
		if ($raid->RaidCount() <= 54) {
		  if (!defined($qglobals{ikkylockout4})) {
			if (defined($qglobals{ikky}) && ($qglobals{ikky} >= 10)) {
			  if ($InIkkyV4 == 0) {
				$Instance = quest::CreateInstance("ikkinz",4,21600);
				quest::AssignRaidToInstance($Instance);   
				quest::say("Instance added.");
				quest::say("The glyphs you recovered show an Artifact of Glorification that is guarded by a sentinel that is ages old. You will find the Sanctuary of the Glorification to the south of the Altar of Destruction. You must gather a raiding party several times larger than your normal party's size and be prepared for anything. Find an entrance to the inner chambers of the Sanctuary of the Glorified and recover the artifact. May you be gifted with the luck of the brotherhood. I fear you may need it.");
			  }
			  else {
				$client->Message(13, "You are already in an instance!");
			  }
			}
		  }
		  else {
			$client->Message(13, "You have recently completed a raid.");
		  }
		} else {
			$client->Message(13, "You have ".$raid->RaidCount()." players in raid.  Only 54 allowed");
		} 
    }
    else {
      $client->Message(13, "You are not in a raid!");
    }
  }
  if ($text=~/sanctuary of the transcendent/i) {
    if ($raid) {
		if ($raid->RaidCount() <= 54) {
		  if (!defined($qglobals{ikkylockout5})) {
			if (defined($qglobals{ikky}) && ($qglobals{ikky} >= 10)) {
			  if ($InIkkyV5 == 0) {
				$Instance = quest::CreateInstance("ikkinz", 5, 21600);
				quest::AssignRaidToInstance($Instance);   
				quest::say("Instance added.");
				quest::say("The glyphs you recovered show an Artifact of Transcendence that is guarded by a sentinel that is ages old. You will find the Sanctuary of the Transcendent to the south of the Altar of Destruction. You must gather a raiding party several times larger than your normal party's size and be prepared for anything. Find an entrance to the inner chambers of the Sanctuary of the Transcendent and recover the artifact. May you be gifted with the luck of the brotherhood. I fear you may need it.");
			  }
			  else {
				$client->Message(13, "You are already in an instance!");
			  }
			}
		  }
		  else {
			$client->Message(13, "You have recently completed a raid.");
		  }
		} else {
			$client->Message(13, "You have ".$raid->RaidCount()." players in raid.  Only 54 allowed");
		} 
    }
    else {
      $client->Message(13, "You are not in a raid!");
    }
  }
  if (($text=~/altar of destruction/i) && defined($qglobals{ikkyraid}) && ($qglobals{ikkyraid} == 3)) { 
    quest::say("The Altar of Destruction is far more remarkable than any other temple built in this region. I have been catching up on the history of those three artifacts and now you must harness the power that the geomantic priests once held. That power will combine the three pieces you collected into one final [" . quest::saylink("Icon of the Altar") . "].");
  }
  if (($text=~/icon of the altar/i) && defined($qglobals{ikkyraid}) && ($qglobals{ikkyraid} == 3)) { 
    quest::say("From what we've seen of the glyphs in the area, we believe the trusik would use their geomantic powers to meld the three pieces together and form the icon. Since we don't have that luxury, we're going to have to do it another way. I've devised a [" . quest::saylink("plan") . "] that should replicate what they were trying to do, but it will require more effort on your part.");
  }
  if (($text=~/plan/i) && defined($qglobals{ikkyraid}) && ($qglobals{ikkyraid} == 3)) { 
    quest::say("The first thing you're going to need is something to meld the three pieces together. I believe that using some inanimate ore from the stone guardians that protect the temples will be perfect for this job. The next thing you'll need is to make an inferno scepter to heat up the ore. You'll have to make the scepter yourself, which can be done by combining a flarestone, flaring coals, an inferno scepter mold and a blazing torch in a forge. Hmm, I believe you'll have to head back to the camp to find some of those things, In any case, there's one [" . quest::saylink("final step") . "] that you need to take before you're done.");
  }
  if (($text=~/final step/i) && defined($qglobals{ikkyraid}) && ($qglobals{ikkyraid} == 3)) { 
    quest::say("Each inferno scepter you make can be used to smelt one block of inanimate ore. Do this three times and you'll get three vials of smelted molten ore. Combine the three vials and the three artifacts in a forge to fuse the three pieces together and hopefully create the Icon of the Altar. When you've finally accomplished all this, show me the icon so I can identify whether this method is one that works or not. Good luck, $name.");
	quest::setglobal("ikky",13,5,"F");
    $client->Message(4, "Finished! - You've been instructed what needs to be done to make the Icon of the Altar!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 60174 => 1)){
    if (plugin::check_hasitem($client, 60252)) {
      quest::say("You have done great things for us, but your journey is not yet over.");  #need live text
      $client->Message(4, "Finished! - You've recovered the Sliver of the High Temple! Congratulations!");
      $client->Message(4, "You feel the magic protecting Qvic has softened.");
      quest::summonitem(60176);
      quest::setglobal("god_qvic_access",1,5,"F");
      quest::set_zone_flag(295);
    }
    else {
      quest::say("You have done well in the Temple, please return when you have recovered the fragment also.");
      quest::summonitem(60174);
    }
  }
  if (defined($qglobals{ikky}) && ($qglobals{ikky} == 6)) {
    if (plugin::check_handin(\%itemcount, 60146 => 1)) {
      quest::summonitem(60146);
      GIVE_TABLET();
    }
    if (plugin::check_handin(\%itemcount, 60147 => 1)) {
      quest::summonitem(60147);
      GIVE_TABLET();
    }
    if (plugin::check_handin(\%itemcount, 60148 => 1)) {
      quest::summonitem(60148);
      GIVE_TABLET();
    }
    if (plugin::check_handin(\%itemcount, 60149 => 1)) {
      quest::summonitem(60149);
      GIVE_TABLET();
    }
  }
  if (defined($qglobals{ikky}) && ($qglobals{ikky} == 7)) {
    if (plugin::check_handin(\%itemcount, 60162 => 1, 60163 => 1, 60164 => 1, 60165 => 1)) {
      quest::emote("grunts unhappily at the four pieces. 'I had hoped more work wouldn't be needed to uncover the clues, but it looks like there's a bit more you're going to need to do for me. Take a look at these edges. Do you see how they look really sinewy? That's because they're [" . quest::saylink("made of flesh") . "], probably that of the trusik. No doubt the Muramites have been quite cruel to them now that they are mostly used for slavery.'");
      quest::exp(100000);
      quest::summonitem(60162);
      quest::summonitem(60163);
      quest::summonitem(60164);
      quest::summonitem(60165);
      quest::setglobal("ikky",8,5,"F");
    }
  }
  if (defined($qglobals{ikky}) && ($qglobals{ikky} == 8)) {
    if (plugin::check_handin(\%itemcount, 60166 => 1)) {
      quest::say("Nicely sewn, $name. I would have tried doing it myself, but I have the most unsteady fingers when it comes to things like that. In any case, let me have a look at what this says.' Tublik looks over the clue for a time before continuing. 'Unbelievable. Simply astounding. These notes weren't made by the Muramites at all. In fact, they were created by trusik priests from their own flesh in some kind of [" . quest::saylink("ritual") . "].");
      quest::setglobal("ikky",9,5,"F");
    }
  }
  if (defined($qglobals{ikky}) && ($qglobals{ikky} == 9)) {
    if (plugin::check_handin(\%itemcount, 60167 => 1, 60168 => 1, 60169 => 1)) {
      quest::emote("stares at the three clues for a moment before speaking. 'I can't be sure, but I believe we are getting close to something big, $name. I need more time to examine these clues, but I should have something for you when you return. You've done well and I know that we wouldn't have been able to get this far without your help. Good job!'");
      quest::exp(100000);
      quest::setglobal("ikky",10,5,"F");
    }
  }
  if (plugin::check_handin(\%itemcount, 60161 => 1)) {
      quest::say("Excellent! We don't have to worry about that abomination any longer. This artifact you found on the creature is also quite unique. It will be a while before I have a chance to look it over, but it's nice to have it in our possession nonetheless. Well done once again, $name. I look forward to working with you again soon!");
      quest::exp(100000);
  }
  if (defined($qglobals{ikky}) && ($qglobals{ikky} == 13)) {
    if (plugin::check_handin(\%itemcount, 60173 => 1)) { 
      quest::emote("scans the icon before returning it to you. 'You've done well. $name. Up until now I hadn't noticed the final glyph that is created when the three pieces are combined. I must inspect this further, but return to me shortly and I should have an answer as to the glyph's meaning.'");
      $client->Message(4, "Finished! - You've constructed your Icon of the Altar!");
      quest::setglobal("ikky",14,5,"F");
	}
	quest::summonitem(60173);
  }
  if (defined($qglobals{ikky}) && ($qglobals{ikky} < 14)) {
    if (plugin::check_handin(\%itemcount, 60173 => 1)) {
      quest::say("You can't have this? What kind of trickery is this? I'm alerting the proper autorities you thief.");
    }
  }
  if (defined($qglobals{ikky}) && ($qglobals{ikky} >= 10)) {
    if (plugin::check_handin(\%itemcount, 60160 => 1)) {
      quest::say("You're done already? I wasn't expecting such a prompt response, but nicely done %name! Give me a while to examine these artifacts. I should have some additional information for you once you return.");
      quest::setglobal("ikkypit",1,5,"F");
    }  
    if (plugin::check_handin(\%itemcount, 60170 => 1)) {
      if (!defined($qglobals{ikkyraid})) {
	    quest::say("You've done it! You've recovered the first of the three artifacts! You must keep this with you, as you'll need it once you've recovered all three artifacts. You only need two more -- one from [" . quest::saylink("Sanctuary of the Glorified") . "], and one from the [" . quest::saylink("Sanctuary of the Transcendent") . "]. Which do you think you'd like to do next?");
        quest::setglobal("ikkyraid",1,5,"F");
        $client->Message(4, "Finished! - You've recovered the Artifact of Righteousness!");
      }
      quest::summonitem(60170);
    }
    if (plugin::check_handin(\%itemcount, 60171 => 1)) {
      if (defined($qglobals{ikkyraid}) && ($qglobals{ikkyraid} == 1)) {
	    quest::say("You've done it! You've recovered the second of the three artifacts! You must keep this with you, as you'll need it once you've recovered all three artifacts. You only need one more from [" . quest::saylink("Sanctuary of the Transcendent") . "]. Are you ready to progress forward with the final artifact?");
        quest::setglobal("ikkyraid",2,5,"F");
        $client->Message(4, "Finished! - You've recovered the Artifact of Glorification!");
      }
      quest::summonitem(60171);
    }
    if (plugin::check_handin(\%itemcount, 60172 => 1)) {
      if (defined($qglobals{ikkyraid}) && ($qglobals{ikkyraid} == 2)) {
	    quest::say("You've done it! You've recovered all three of the artifacts! You must keep this with you, because you'll need it now. Somewhere deep down I knew you would be able to get them all. I've been studying the markings from the artifacts and I've come to the conclusion that they must be combined to form a key to enter the [" . quest::saylink("Altar of Destruction") . "].");
        quest::setglobal("ikkyraid",3,5,"F");
        $client->Message(4, "Finished! - You've recovered the Artifact of Transcendence!");
      }
      quest::summonitem(60172);
    }
  }
  plugin::return_items(\%itemcount);
}

sub GIVE_TABLET {
  quest::say("So, you really are helping Kevren with this. My apologies for being so blunt with the requirements, but you never can be too careful with things like this. Here's a stone tablet for your troubles. You're going to need to use as many piles of dust as you have glyphs, then combine the dust and the four glyphs together with the stone tablet to translate them. These glyphs can be tricky, so good luck.");
  quest::summonitem(60175);
}

sub PROGRESS_UPDATE {
  if (defined($qglobals{ikkyredo}) && ($qglobals{ikkyredo} == 1)) {
    $client->Message(14, "Finished! - You can now retry any of the trials at any time!");
  }
  if ($qglobals{ikky} >= 2) {
    $client->Message(14, "Finished! - You have completed the trial at the Temple of Singular Might!");
  }
  if ($qglobals{ikky} >= 3) {
    $client->Message(14, "Finished! - You have completed the trial at the Temple of Twin Struggles!");
  }
  if ($qglobals{ikky} >= 4) {
    $client->Message(14, "Finished! - You have completed the trial at the Temple of the Tri-Fates!");
    if (defined($qglobals{ikky_flesh})) {
      $client->Message(14, "Finished! - You've returned four relics from the Martyrs Passage!");
    }
  }
  if ($qglobals{ikky} >= 5) {
    $client->Message(14, "Finished! - You've returned four relics from the Martyrs Passage!");
    $client->Message(14, "Finished! - You've returned valuable information as to why the Muramites are in the Martyrs Passage!");
  }
  if ($qglobals{ikky} >= 6) {
	$client->Message(14, "Finished! - You've been comminssioned to investigate the Temple of the Damned!"); 
    $client->Message(14, "Finished! - You've recovered important glyphs from the Temple of the Damned!");             
  }
  if ($qglobals{ikky} >= 7) {
    $client->Message(14, "Finished! - You've successfully translated the glyphs you found in the Temple of the Damned!");
  }
  if ($qglobals{ikky} >= 8) {
    $client->Message(14, "Finished! - You have collected the four Frayed Flesh Scraps from the Crumbled Sanctuary of Divine Destruction!");
  }
  if ($qglobals{ikky} >= 9) {
    $client->Message(14, "Finished! - You've sewn the flesh scraps together to make the Sewn Flesh Parchment!");
  }
  if ($qglobals{ikky} >= 10) {
    $client->Message(14, "Finished! - You've found the three clues from the three trial temples!");
    if (defined($qglobals{ikkyraid}) && $qglobals{ikkyraid} >= 1) {
      $client->Message(14, "Finished! - You've recovered the Artifact of Righteousness!");
	}
    if (defined($qglobals{ikkyraid}) && $qglobals{ikkyraid} >= 2) {
      $client->Message(14, "Finished! - You've recovered the Artifact of Glorification!");
	}
    if (defined($qglobals{ikkyraid}) && $qglobals{ikkyraid} >= 3) {
      $client->Message(14, "Finished! - You've recovered the Artifact of Transcendence!");
	}
  }
  if ($qglobals{ikky} >= 13) {
    $client->Message(14, "Finished! - You've been instructed what needs to be done to make Icon of the Altar");
  }
  if ($qglobals{ikky} == 14) {
    $client->Message(14, "Finished! - You've constructed your Icon of the Altar!");
  }
}