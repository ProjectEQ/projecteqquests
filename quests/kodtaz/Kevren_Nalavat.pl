sub EVENT_SAY {
  if ($text=~/hail/i) {
    if (defined($qglobals{ikky}) && ($qglobals{ikky} == 2)) {
      quest::say("Welcome back, $name. Reports of your actions in the Temple of Singular Might suggest that you may be well on your way to becoming an outstanding addition to the coalition that investigates these temples. I continue standing my post and , boring as it is, it is of no interest to you I'm sure. If you want, we can talk [more] when we have some idel time. For now, if you're [ready to continue testing], we can proceed! What'll it be, $name?"); 
    }
    if (defined($qglobals{ikky}) && ($qglobals{ikky} == 3)) {
      quest::say("Welcome back, $name. Reports of your actions in the Temple of Twin Struggles suggest that you may be well on your way to becoming an outstanding addition to the coalition that investigates these temples. I continue standing my post and, boring as it is, it is of no interest to you I'm sure. If you want, we can talk [more] when we have some idle time. For now, if you're [ready to continue testing], we can proceed! What'll it be, $name?"); 
    }	
    if (defined($qglobals{ikky}) && ($qglobals{ikky} == 4)) {
      quest::say("Welcome back, $name. I must congratulate you on your recent completion of all three trials. I must admit that I was unsure of your ability to do as well as you did. Now that you have finished, you have the choice of taking on some [" . quest::saylink("other tasks") . "]. If you'd like, we have a chance now to talk [" . quest::saylink("more") . "]. You're also more than welcome to attempt the trials again. If so, just let me know you're [" . quest::saylink("ready to test") . "] again and we'll proceed down that path. What'll it be, $name?");
    }
    if (defined($qglobals{ikky}) && ($qglobals{ikky} == 5)) {
      quest::say("Hmm, we are still missing some valuable information. I need you to retrieve the missing piece.");
    }
    if (defined($qglobals{ikky}) && ($qglobals{ikky} == 7)) {
      quest::say("We have come upon another problem. The summoners that you encountered in the Temple of the Damned are working at another location closer to the main temple to summon more vile creatures. Do you think that you can [" . quest::saylink("stop the ritual") . "]?"); #need live text
    }
    if (defined($qglobals{ikky_flesh}) && ($qglobals{ikky_flesh} == 2)) {
      quest::say("The problem is that this information reveals a most disturbing plot by the Muramites to summon a creature into this realm. They appear to be experts in teleportation. The parchment you returned to me described the use of Temple of the Damned to gather instruments of power that will allow the beast to coalesce in our world. It doesn't go into what those instruments are or when the summoning will take  place, so you must [" . quest::saylink("discover their plans") . "].");
      quest::delglobal("ikky_flesh");
      quest::setglobal("ikky",5,5,"F");
    }
	if (defined($qglobals{ikky}) && ($qglobals{ikky} >= 2)) {
	  $client->Message(15, "Kevren Nalavat says, 'If you want to see what you've completed at any time, just ask me for a [" . quest::saylink("progress update") . "]!'");
	}
    else {
      quest::emote("looks relieved to see you.'Finally the Wayfarers Brotherhood has sent adventurers this far out. I was beginning to wonder what was happening. I'm Kevren Nalavat, one of the brotherhood's traveling scholars. We can talk [" . quest::saylink("more") . "] later. The important thing is that you're here and now that you are you'll need to prove that you're up to the challenges facing us on this rugged terrain. I've been all through this area and it's no place to be caught unaware! So what do you say? Are you [" . quest::saylink("ready to test",0,"ready to be tested") . "]?'");
    }
  }
  if (($text=~/progress update/i) && defined($qglobals{ikky})) {
   PROGRESS_UPDATE();
  }
  if ($text=~/more/i) {
    quest::say("Well I haven't always been the bold adventurer you see before you. I know I may not look too daring, but that's because I'm trying to keep a low profile. Before I joined the Wayfarers Brotherhood I was a learned scholar and knowledge-seeker. I sought to uncover the mysteries of ancient ruins and civilizations lost long ago. I was so focused on my studies that most of my colleagues thought I bordered on [" . quest::saylink("crazy") . "].");
   }
  if ($text=~/crazy/i) {
    quest::say("Yes, crazy. I didn't mind though. I knew most of them would never uncover a full understanding of the past like I was. I continued my studies until I was approached by Morden Rasp -- I'm sure you've heard of him. He contacted me and said he was going to begin gathering artifacts from civilizations lost to the ages and that my skills were going to be needed in the times to come. I couldn't help but [" . quest::saylink("join him") . "].");
  }
  if ($text=~/join him/i) {
    quest::say("His offer was irresistible! Since I joined the brotherhood I have provided my continuing expertise about lost civilizations. Of course, Morden told me that just being a scholar wasn't going to be enough. He said I had to learn some other skill to stay with the brotherhood as an explorer. I had already learned so much so quickly and didn't dare leave with all the new and exciting items we were getting from adventurers, so I decided to learn how to become a rogue so I could [" . quest::saylink("sneak around") . "] to collect what I needed.");
  }
  if ($text=~/sneak around/i) {
    quest::emote("looks toward the ground shamefully.");
    quest::say("It wasn't the most glamorous thing to do, I know. But you have to understand that I have never been the adventurous type! I certainly didn't want glamour of any kind. I figured sneaking around to gather [" . quest::saylink("what was needed") . "] would be easier than trying to fight my way through. Plus, sneaking around allowed me to go alone into ruins so I didn't need to rely on anyone.");
  }
  if ($text=~/what was needed/i) {
    quest::emote("suddenly looks up at you with renewed earnest. 'Oh you wouldn't believe the things I've already found out about the people who built the temples around here! Well firstly, it's been a bit more difficult than usual to find anything out about them because they have no written history -- they tell stories complemented with glyphs to recount their history. I've learned how to interpret most of the glyphs I've encountered so far and believe me when I say that it's been some of the most interesting work I've done thus far. That reminds me, do you want to hear some more about the [" . quest::saylink("background information") . "] of this area or are you ready to learn about the [" . quest::saylink("trials") . "]?'");
  }
  if ($text=~/ready to test/i) {
    if (!defined($qglobals{ikkyredo}) && defined($qglobals{ikky}) && ($qglobals{ikky} >= 4)) {
      quest::setglobal("ikkyredo",1,5,"F");
      $client->Message(4, "Finished! - You can now retry any of the trials at any time!");
    }
    else {
      quest::say("Good to hear! If you're interested I can give you a little [" . quest::saylink("background information") . "] about the mountaintop here before we get started, otherwise I'll explain the [" . quest::saylink("trials") . "] to you.");
    }
  }
  if ($text=~/background information/i) {
    quest::say("Good. There's no use going into an area without knowing the lay of the land. The first thing you should know is that you're walking into a huge expanse at the top of the mountain. It must have taken several years to dig out all the rock from the mountain. With the space they dug out they were able to build grand temples into the side of the mountain. Until you've seen them for yourself you can't imagine their [" . quest::saylink("grandeur") . "].");
  }
  if ($text=~/grandeur/i) {
    quest::say("Oh indeed! The trusik -- that's what they call themselves -- had powerful geomancers that must have expended huge amounts of energy to shape and mold the mountain. They used mighty golems to clear away the rubble so they could continue their work. The temples they built are all in recognition to [" . quest::saylink("some being") . "] they worshipped long ago and some of them seem to reach the sky!");
  }
  if ($text=~/some being/i) {
    quest::say("From what I've been able to gather these people prayed to a god they call Trushar. They believed Trushar was the one who controlled the seas. It was to this deity that they [" . quest::saylink("prayed for the destruction") . "] of all non-believers and those who exiled them. I tend to wonder if they [" . quest::saylink("prayed for the destruction") . "] of non-believers or the nihil in the city.");
  }
  if ($text=~/prayed for the destruction/i) {
    quest::emote("scrunches his brow thoughtfully. 'From the information I've sorted through so far, the nihil in the city kicked the trusik out because they were tired of the fanatic belief in their beloved sea god. I even think that's where the name trusik comes from, a title for exiled believers of a non-existent being. I'm hoping that we can uncover some more of those [" . quest::saylink("mysteries") . "] in the temples beyond.'");
  }
  if ($text=~/mysteries/i) {
    quest::say("There are still some things that are left unexplained. Most importantly is the fact that we don't know how deep the invader presence goes. We need to discover some of the reasons for the temples, what purpose they serve now, and what the invaders have to do with them. We need to investigate the temples and the remains further for this information. That's where you [" . quest::saylink("come in") . "].");
  }
  if ($text=~/come in/i) {
    quest::say("I haven't had a lot of time to look around the temples, because I was commissioned to scout ahead and remain here for the adventuring parties that would be sent shortly after. Now that those parties are being sent, I have to maintain my post and make sure that those we're sending in to look for the information for us are up to the task. That's the very reason we have designed the [" . quest::saylink("trials") . "].");
  }
  if ($text=~/trials/i) {
    quest::emote("look turns serious. 'There are any number of new threats with these invaders and we're unsure just how powerful or how many of them there are. We need to make sure that those of you being sent up here to find that information out for us won't be scared off by the destructive force these invaders bring along with them. The trials must be done in a [" . quest::saylink("specific order") . "] and must all be completed before we can allow you to attempt any further work for the brotherhood.'");
  }
  if ($text=~/specific order/i) {
    quest::say("There exist three temples nearby that you must enter. I have defined these three as the Temple of [" . quest::saylink("Singular Might") . "], Temple of [" . quest::saylink("Twin Struggles") . "], and Temple of the [" . quest::saylink("Tri-Fates") . "]. In each lay the forces of the Legion of Mata Muram who must be destroyed. You must not be fooled, we do not control these temples. The areas are controlled by the [" . quest::saylink("Muramites") . "], but we believe that these places hold the most predictable of the invaders and can be used easily as our testing grounds.");
  }
  if ($text=~/singular might/i) {
    if (!defined($qglobals{ikky})) {
      quest::say("Beyond the dark fog to the south lies the Temple of Singular Might. You can find it between the two other temples. In front of the temple you will find a single, smaller temple where another of the brotherhood is waiting for you. Seek out Gazak Klelkek and speak to him about the troubles within the temple.");
      quest::setglobal("ikky",1,5,"F");
    }
    else {
      quest::say("Beyond the dark fog to the south lies the Temple of Singular Might. You can find it between the two other temples. In front of the temple you will find a single, smaller temple where another of the brotherhood is waiting for you. Seek out Gazak Klelkek and speak to him about the troubles within the temple.");
    }
  }
  if ($text=~/twin struggles/i) {
    if (defined($qglobals{ikky}) && ($qglobals{ikky} == 2)) {
      quest::say("Beyond the dark fog to the south lies the Temple of Twin Struggles. It is past the first two temples. Seek out Maroley Nazuey and speak to her about the troubles within the temple.");  #need live text
    }
    else {
      quest::say("I'm sorry $name, but you're not ready to face the second trial. You must first find Gazak Klelkek near the Temple of [Singular Might] and finish the first trial before you may proceed. Return to me when you have accomplished that feat.");
    }
  }
  if ($text=~/tri-fates/i) {
    if (defined($qglobals{ikky}) && ($qglobals{ikky} == 3)) {
      quest::say("Beyond the dark fog to the south lies the Temple of Tri-Fates. It is the first temple you will come to. Seek out Kenra Kalekkio and speak to her about the troubles within the temple");  #need live text
    }
    else {
      quest::say("I'm sorry $name, but you're not ready to learn about the third trial. You must first find Gazak Klelkek near the Temple of [Singular Might] and finish the first trial before you may proceed. Return to me when you have accomplished that feat.");
    }
  }
  if (($text=~/other tasks/i) && defined($qglobals{ikky}) && ($qglobals{ikky} >= 4)) {
    quest::say("As I suspected, you're ready for some challenging work! I must warn though, what lies ahead is not for the faint of heart. The other tasks that are available deal with three other areas. Those areas are the [" . quest::saylink("Martyrs Passage") . "], the [" . quest::saylink("Pit of the Lost") . "], and the [" . quest::saylink("Crumbled Sanctuary") . "] of the Divine. Choose the one you wish to attempt and we can continue.");
  }
  if (($text=~/martyrs passage/i) && defined($qglobals{ikky}) && ($qglobals{ikky} == 4)) {
    quest::say("Good, we're in need of a sturdy adventurer to help us with a dire situation along with the Martyrs Passage. First, this area was named so because it houses the spirits of martyred heroes lost long ago. The trusik lined the passageway with [" . quest::saylink("ancient relics") . "] to sooth the spirits while in the afterlife. Unfortunately, the Muramites are disturbing the remains and are looking to collect the spiritual remnants for some sinister use.");
    $client->Message(4, "Congratulations!- You've been commissioned to investigate Martyrs Passage.");
  }
  if (($text=~/ancient relics/i) && defined($qglobals{ikky}) && ($qglobals{ikky} >= 4)) {
    quest::say("We're unsure what the invaders are gathering these particular relics for. From what I can surmise, none of them have any kind of magical properties. In any case, it's up to you and a group of adventurers to venture to the Martyrs Passage and [" . quest::saylink("investigate") . "] the situation. I've heard reports of ghosts in that area, so the invaders may have stirred up something unexpected.");
  }
  if (($text=~/investigate/i) && defined($qglobals{ikky}) && ($qglobals{ikky} >= 4)) {
    quest::say("You'll need to head to the Martyrs Passage and recover four different relics. I advise taking a sturdy group with you because there may be invaders there in the process of burgling the passage. If you uncover any information on what the Mata Muram are planning to use these relics for, return that to me as well, Do you [" . quest::saylink("understand") . "] your objective?");
  }
  if (($text=~/understand/i) && defined($qglobals{ikky}) && ($qglobals{ikky} >= 4)) {
    quest::say("Good, be on your way then. Return to me when you have completed your objective. I wish you luck and await your return.");
  }
  if (($text=~/pit of the lost/i) && defined($qglobals{ikky}) && ($qglobals{ikky} >= 4)) {
    quest::say("I'm glad you've decided to continue helping the brotherhood. We can always use adventurers like you. There have been some mysterious happenings coming from the Pit of the Lost. I don't have the information on what's going on, but another of the brotherhood nearby does. You must venture south of the Martyrs Passage and speak with Tublik Narwether. He will know what's going on.");
  }
  if (($text=~/crumbled sanctuary/i) && defined($qglobals{ikky}) && ($qglobals{ikky} >= 4)) {
    quest::say("I'm glad you're sticking around to help out with some additional tasks. We can certainly use the help. On the east side of the largest temple to the west, there exists a crumbled temple. As of yet, we're unsure what the cause or reason of the destruction was. I don't have all the information, but Tublik Narwether does. Seek him out to the south of the Martyrs Passage and find out what you can from him.");
  }
  if ((($text=~/temple of the damned/i) || ($text=~/discover their plan/i)) && defined($qglobals{ikky}) && ($qglobals{ikky} == 5)) {
    quest::say("You must go into the Temple of the Damned. It is the temple directly behind me with the fog looming around it. Explore the temple and search for the instruments of power that the Legion of Mata Muram priests are collecting. Once you have the relics in hand, return them to me so I can study them further. Good luck to you, $name.");
    $client->Message(4, "Finished! - You've been commissioned to investigate the Temple of the Damned!");
  }
  if (($text=~/stop the ritual/i) && defined($qglobals{ikky}) && ($qglobals{ikky} == 7)) {
    quest::say("The Summoner's Ring is just past the Temple of the Damned");
    $client->Message(4, "Finished! - You've been charged with stopping the ceremony at the Summoning Circle!");
  }
  if (($text=~/have done all you asked/i) && defined($qglobals{ikkyalt}) && ($qglobals{ikkyalt} == 8)) {
    quest::say("Indeed you have and your help is greatly appreciated. Take this back to L`diava I believe it has the answers she seeks.");
    quest::summonitem(67562);
  }
}

sub EVENT_ITEM {
  if (defined($qglobals{ikky}) && ($qglobals{ikky} == 4)) {
    if (plugin::check_handin(\%itemcount, 60141 => 1, 60142 => 1, 60143 => 1, 60144 => 1)) {
      quest::emote("examines the relics for a moment. 'The only thing I can find on these relics are glyphs. They're very old and hard to make out, but it appears that they depict four powers. I would say they refer to the temples around the Altar of Destruction, but I can't be sure. It will take some time to go over these some more. In the meantime, do you have anything else for me that might explain the Muramites' interest in the passage? If not, please do go look again. I'm sure there will be something there we can use!");
      $client->Message(4, "Finished! - You've returned four relics from the Martyrs Passage!");
      quest::setglobal("ikky_flesh",1,5,"F");
    }
    if (defined($qglobals{ikky_flesh}) && ($qglobals{ikky_flesh} == 1) && plugin::check_handin(\%itemcount, 60145=> 1)) {
      quest::say("Aha! I suspected there would be some kind of indication of what they were doing in that passage. I applaud your efforts. I only briefly skimmed the information and from what I can gather, it appears that there are nefarious deeds afoot. I'll need more time to examine this, but I should know what it says in a few moments. Well done, once again, $name!"); 
      $client->Message(4, "Finished! - You've returned valuable information as to why the Muramites are in the Martyrs Passage!");
      quest::setglobal("ikky_flesh",2,5,"F");
    }
  }
  if (defined($qglobals{ikky}) && ($qglobals{ikky} == 5)) {
    if (plugin::check_handin(\%itemcount, 60146 => 1, 60147 => 1, 60148 => 1, 60149 => 1)) {
      quest::emote("examines the strange glyphs. 'These glyphs are faded. I won't be able to decipher them until they've been cleaned up. You'll need to go back to the Martyrs Passage and recover some dust from the grounds nearby. Once you've gotten a pile of dust, you'll need to speak with Tublik Narwethar who is south of the Martyrs Passage. He has a stone tablet that can add some clarity to the glyphs with the help of that dust. Hurry along, $name, this information is important!'");
      $client->Message(4, "Finished! - You've recovered important glyphs from the Temple of the Damned!");
      quest::summonitem(60147);
      quest::summonitem(60149);
      quest::summonitem(60146);
      quest::summonitem(60148);
      quest::setglobal("ikky",6,5,"F");
    }
  }
  if (defined($qglobals{ikky}) && ($qglobals{ikky} == 6)) {
    if (plugin::check_handin(\%itemcount, 60150 => 1)) {
      quest::emote("copies down the intricate patterns from the glyph. 'Very interesting, but very dangerous. I've gone over the glyphs and they suggest there is great danger in the summoning of some kind of ferocious beast. I need to study the markings further, but since I've transcribed them already, you can keep the glyph for your own use. Nicely done, $name.'");
      quest::summonitem(60150);
      quest::setglobal("ikky",7,5,"F");
      $client->Message(4, "Finished! - You've successfully translated the glyphs you found in the Temple of the Damned!");
    }
  }
  if (defined($qglobals{ikky}) && ($qglobals{ikky} >= 7)) {
    if (plugin::check_handin(\%itemcount, 60151 => 1)) {
      quest::say("You have done well, $name. Speak with Tublik to continue helping us here in Kod'Taz.");
      quest::setglobal("ikkyalt",8,5,"F");
      $client->Message(4, "Finished! - You were able to recover a rare artifact from the Grand Summoner's goons in the Summoning Circle!");
    }
  }
  if (plugin::check_handin(\%itemcount, 67702 => 1)) {
    quest::say("Seems you have made quite an impression if you are trusted by L`diava. But don't think that this means you do not have to gain my trust. While you survived the three trials I am still in need of assistance, I some [" . quest::saylink("other tasks") . "] completed, when you have finished them please return to me and tell me you have done all I asked and I will give you what you came here for. If you do not wish to start these tasks right now we do have some time to talk a little [" . quest::saylink("more") . "].");
  }
  plugin::return_items(\%itemcount);
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