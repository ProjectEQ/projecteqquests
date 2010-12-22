sub EVENT_SAY {
 if($text=~/hail/i) {
   if((defined $qglobals{ikky} && $qglobals{ikky} == 4)) {
    quest::say("You have done well and completed the three trials.  I have a few [task] for you to complete when you are ready.");
   #need live text
   }
   elsif((defined $qglobals{ikky} && $qglobals{ikky} == 5)) {
    quest::say("Thanks for bringing those relics to me.  I have had a chance to examine them and they lead me to believe that something is going on in the Temple of the Damned.  Could you help me [discover their plans]?");
    #need live text
    }
   elsif((defined $qglobals{ikky} && $qglobals{ikky} == 7)) {
    quest::say("We have come upon another problem.  The summoners that you encountered in the Temple of the Damned are working at another location closer to the main temple to summon more vile creatures. Do you [think that you] can stop the ritual?");
    #need live text
    }
   else {
   quest::emote("looks relieved to see you.");
   quest::say("Finally the Wayfarers Brotherhood has sent adventurers this far out. I was beginning to wonder what was happening. I'm Kevren Nalavat, one of the brotherhood's traveling scholars. We can talk [more] later. The important thing is that you're here and now that you are you'll need to prove that you're up to the challenges facing us on this rugged terrain. I've been all through this area and it's no place to be caught unaware! So what do you say? Are you [ready to be tested]?");
    }
}
if ($text=~/more/i) {
  quest::say("Well I haven't always been the bold adventurer you see before you. I know I may not look too daring, but that's because I'm trying to keep a low profile. Before I joined the Wayfarers Brotherhood I was a learned scholar and knowledge-seeker. I sought to uncover the mysteries of ancient ruins and civilizations lost long ago. I was so focused on my studies that most of my colleagues thought I bordered on [crazy].");
}
if ($text=~/crazy/i) {
  quest::say("Yes, crazy. I didn't mind though. I knew most of them would never uncover a full understanding of the past like I was. I continued my studies until I was approached by Morden Rasp -- I'm sure you've heard of him. He contacted me and said he was going to begin gathering artifacts from civilizations lost to the ages and that my skills were going to be needed in the times to come. I couldn't help but [join him].");
}
if ($text=~/join him/i) {
  quest::say("His offer was irresistible! Since I joined the brotherhood I have provided my continuing expertise about lost civilizations. Of course, Morden told me that just being a scholar wasn't going to be enough. He said I had to learn some other skill to stay with the brotherhood as an explorer. I had already learned so much so quickly and didn't dare leave with all the new and exciting items we were getting from adventurers, so I decided to learn how to become a rogue so I could [sneak around] to collect what I needed.");
}
if ($text=~/sneak around/i) {
  quest::emote("looks toward the ground shamefully");
  quest::say("It wasn't the most glamorous thing to do, I know. But you have to understand that I have never been the adventurous type! I certainly didn't want glamour of any kind. I figured sneaking around to gather [what was needed] would be easier than trying to fight my way through. Plus, sneaking around allowed me to go alone into ruins so I didn't need to rely on anyone.");
}
if ($text=~/what was needed/i) {
  quest::emote("suddenly looks up at you with renewed earnest.");
  quest::say("Oh you wouldn't believe the things I've already found out about the people who built the temples around here! Well firstly, it's been a bit more difficult than usual to find anything out about them because they have no written history -- they tell stories complemented with glyphs to recount their history. I've learned how to interpret most of the glyphs I've encountered so far and believe me when I say that it's been some of the most interesting work I've done thus far. That reminds me, do you want to hear some more about the [background information] of this area or are you ready to learn about the [trials]?");
}
if ($text=~/ready to be tested/i) {
  quest::say("Good to hear! If you're interested I can give you a little [background information] about the mountaintop here before we get started, otherwise I'll explain the [trials] to you.");
}
if ($text=~/background information/i) {
  quest::say("Good. There's no use going into an area without knowing the lay of the land. The first thing you should know is that you're walking into a huge expanse at the top of the mountain. It must have taken several years to dig out all the rock from the mountain. With the space they dug out they were able to build grand temples into the side of the mountain. Until you've seen them for yourself you can't imagine their [grandeur].");
}
if ($text=~/grandeur/i) {
  quest::say("Oh indeed! The trusik -- that's what they call themselves -- had powerful geomancers that must have expended huge amounts of energy to shape and mold the mountain. They used mighty golems to clear away the rubble so they could continue their work. The temples they built are all in recognition to [some being] they worshipped long ago and some of them seem to reach the sky!");
}
if ($text=~/some being/i) {
  quest::say("From what I've been able to gather these people prayed to a god they call Trushar. They believed Trushar was the one who controlled the seas. It was to this deity that they prayed for the destruction of all non-believers and those who exiled them. I tend to wonder if they [prayed for the destruction] of non-believers or the nihil in the city.");
}
if ($text=~/prayed for the destruction/i) {
  quest::emote("scrunches his brow thoughtfully.");
  quest::say("From the information I've sorted through so far, the nihil in the city kicked the trusik out because they were tired of the fanatic belief in their beloved sea god. I even think that's where the name trusik comes from, a title for exiled believers of a non-existent being. I'm hoping that we can uncover some more of those [mysteries] in the temples beyond.");
}
if ($text=~/mysteries/i) {
  quest::say("There are still some things that are left unexplained. Most importantly is the fact that we don't know how deep the invader presence goes. We need to discover some of the reasons for the temples, what purpose they serve now, and what the invaders have to do with them. We need to investigate the temples and the remains further for this information. That's where [you come in].");
}
if ($text=~/you come in/i) {
  quest::say("I haven't had a lot of time to look around the temples, because I was commissioned to scout ahead and remain here for the adventuring parties that would be sent shortly after. Now that those parties are being sent, I have to maintain my post and make sure that those we're sending in to look for the information for us are up to the task. That's the very reason we have designed the [trials].");
}
if ($text=~/trials/i) {
  quest::emote("look turns serious");
  quest::say("There are any number of new threats with these invaders and we're unsure just how powerful or how many of them there are. We need to make sure that those of you being sent up here to find that information out for us won't be scared off by the destructive force these invaders bring along with them. The trials must be done in a [specific order] and must all be completed before we can allow you to attempt any further work for the brotherhood.");
}
if ($text=~/specific order/i) {
  quest::say("There exist three temples nearby that you must enter. I have defined these three as the Temple of [Singular Might], Temple of [Twin Struggles], and Temple of the [Tri-Fates]. In each lay the forces of the Legion of Mata Muram who must be destroyed. You must not be fooled, we do not control these temples. The areas are controlled by the [Muramites], but we believe that these places hold the most predictable of the invaders and can be used easily as our testing grounds.");
}
if ($text=~/singular might/i) {
  quest::say("Beyond the dark fog to the south lies the Temple of Singular Might. You can find it between the two other temples. In front of the temple you will find a single, smaller temple where another of the brotherhood is waiting for you. Seek out Gazak Klelkek and speak to him about the troubles within the temple.");
  quest::setglobal("ikky",1,5,"F");
}
if (($text=~/twin struggles/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 2)) {
  quest::say("Beyond the dark fog to the south lies the Temple of Twin Struggles.  It is past the first two temples. Seek out Maroley Nazuey and speak to her about the troubles within the temple.");  #need live text
}
elsif ($text=~/twin struggles/i) {
  quest::say("I'm sorry $name, but you're not ready to face the second trial. You must first find Gazak Klelkek near the Temple of [Singular Might] and finish the first trial before you may proceed. Return to me when you have accomplished that feat.");
}
if (($text=~/tri fates/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 3)) {
  quest::say("Beyond the dark fog to the south lies the Temple of Tri-Fates.  It is the first temple you will come to.  Seek out Kenra Kalekkio and sepak to her about the troubles within the temple");  #need live text
}
elsif ($text=~/tri fates/i) {
  quest::say("I'm sorry $name, but you're not ready to learn about the third trial. You must first find Gazak Klelkek near the Temple of [Singular Might] and finish the first trial before you may proceed. Return to me when you have accomplished that feat.");
}
if (($text=~/hail/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 4)) {
  quest::say("If you continue on past the temples you will come to an area called [Martyr's Passage].  Within this area you need to find four different relic's of those who have died there, bring them to me.");
  }
if (($text=~/martyr's passage/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 4)) {
  $client->Message(4,"Congratulations!- You have commissioned to investigate Martyr's Passage.");
}
if (($text=~/discover their plans/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 5)) {
  quest::say("The Temple of the Damned is just south of my location.  Explore with caution.");
  $client->Message(4,"Finished! - You've been commissioned to investigate the Temple of the Damned!");
}
if (($text=~/think you can/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 7)) {
  quest::say("The Summoner's Ring is just past the Temple of the Damned");
  $client->Message(4,"Finished! - You've been charged with stopping the ceremony at the Summoning Circle!");
}
if ($text=~/progress/i) {
    if((defined $qglobals{ikky} && $qglobals{ikky} == 1)) {
      $client->Message(13, "Pending – You have requested the trial at the Temple of Singular Might!");
      }
    elsif((defined $qglobals{ikky} && $qglobals{ikky} == 2)) {
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Singular Might!");
      }
    elsif((defined $qglobals{ikky} && $qglobals{ikky} == 3)) {
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Singular Might!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Twin Struggles!");
      }
    elsif((defined $qglobals{ikky} && $qglobals{ikky} == 4)) {
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Singular Might!");  
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Twin Struggles!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of the Tri-Fates!");
      }
    elsif((defined $qglobals{ikky} && $qglobals{ikky} == 5)) {
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Singular Might!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Twin Struggles!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of the Tri-Fates!");
      $client->Message(13, "Finished! - You've returned four relics from the Martyrs Passage!");     
      }
    elsif((defined $qglobals{ikky} && $qglobals{ikky} == 6)) {
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Singular Might!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Twin Struggles!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of the Tri-Fates!");
      $client->Message(13, "Finished! - You've returned four relics from the Martyrs Passage!");     
      $client->Message(13, "Finished! - You've recovered important glyphs from the Temple of the Damned!");              
      }
    elsif((defined $qglobals{ikky} && $qglobals{ikky} == 7)) {
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Singular Might!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Twin Struggles!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of the Tri-Fates!");
      $client->Message(13, "Finished! - You've returned four relics from the Martyrs Passage!");     
      $client->Message(13, "Finished! - You've recovered important glyphs from the Temple of the Damned!");              
      $client->Message(13, "Finished! - You've successfully translated the glyphs you found in the Temple of the Damned!");
      }
    elsif((defined $qglobals{ikky} && $qglobals{ikky} == 9)) {
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Singular Might!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Twin Struggles!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of the Tri-Fates!");
      $client->Message(13, "Finished! - You've returned four relics from the Martyrs Passage!");     
      $client->Message(13, "Finished! - You've recovered important glyphs from the Temple of the Damned!");              
      $client->Message(13, "Finished! - You've successfully translated the glyphs you found in the Temple of the Damned!");
      $client->Message(13, "Finished! - You've sewn the flesh scraps together to make the Sewn Flesh Parchment!");
      }
    elsif((defined $qglobals{ikky} && $qglobals{ikky} == 10)) {
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Singular Might!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Twin Struggles!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of the Tri-Fates!");
      $client->Message(13, "Finished! - You've returned four relics from the Martyrs Passage!");     
      $client->Message(13, "Finished! - You've recovered important glyphs from the Temple of the Damned!");              
      $client->Message(13, "Finished! - You've successfully translated the glyphs you found in the Temple of the Damned!");
      $client->Message(13, "Finished! - You've sewn the flesh scraps together to make the Sewn Flesh Parchment!");
      $client->Message(13, "Finished! - You've found the three clues from the three trial temples!");
      }
    elsif((defined $qglobals{ikky} && $qglobals{ikky} == 11)) {
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Singular Might!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Twin Struggles!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of the Tri-Fates!");
      $client->Message(13, "Finished! - You've returned four relics from the Martyrs Passage!");     
      $client->Message(13, "Finished! - You've recovered important glyphs from the Temple of the Damned!");              
      $client->Message(13, "Finished! - You've successfully translated the glyphs you found in the Temple of the Damned!");
      $client->Message(13, "Finished! - You've sewn the flesh scraps together to make the Sewn Flesh Parchment!");
      $client->Message(13, "Finished! - You've found the three clues from the three trial temples!");
      $client->Message(13, "Finished! - You've collected the Minor Relics of Power from the Pit of the Lost!");
      }
    elsif((defined $qglobals{ikky} && $qglobals{ikky} == 12)) {
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Singular Might!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Twin Struggles!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of the Tri-Fates!");
      $client->Message(13, "Finished! - You've returned four relics from the Martyrs Passage!");     
      $client->Message(13, "Finished! - You've recovered important glyphs from the Temple of the Damned!");              
      $client->Message(13, "Finished! - You've successfully translated the glyphs you found in the Temple of the Damned!");
      $client->Message(13, "Finished! - You've sewn the flesh scraps together to make the Sewn Flesh Parchment!");
      $client->Message(13, "Finished! - You've found the three clues from the three trial temples!");
      $client->Message(13, "Finished! - You've collected the Minor Relics of Power from the Pit of the Lost!");
      $client->Message(13, "Finished! - You've rescued the artifact from the Ageless Relic Protector in the Pit of the Lost!");
      $client->Message(13, "Finished! – You have been approved for the three trial temples!");         
      }
    elsif((defined $qglobals{ikky} && $qglobals{ikky} == 13)) {
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Singular Might!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Twin Struggles!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of the Tri-Fates!");
      $client->Message(13, "Finished! - You've returned four relics from the Martyrs Passage!");     
      $client->Message(13, "Finished! - You've recovered important glyphs from the Temple of the Damned!");              
      $client->Message(13, "Finished! - You've successfully translated the glyphs you found in the Temple of the Damned!");
      $client->Message(13, "Finished! - You've sewn the flesh scraps together to make the Sewn Flesh Parchment!");
      $client->Message(13, "Finished! - You've found the three clues from the three trial temples!");
      $client->Message(13, "Finished! - You've collected the Minor Relics of Power from the Pit of the Lost!");
      $client->Message(13, "Finished! - You've rescued the artifact from the Ageless Relic Protector in the Pit of the Lost!");
      $client->Message(13, "Finished! – You have been approved for the three trial temples!");         
      $client->Message(13, "Finished! - You have completed the three raid trials!");
      }
    elsif((defined $qglobals{ikky} && $qglobals{ikky} == 14)) {
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Singular Might!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of Twin Struggles!");
      $client->Message(13, "Finished! - You have completed the trial at the Temple of the Tri-Fates!");
      $client->Message(13, "Finished! - You've returned four relics from the Martyrs Passage!");     
      $client->Message(13, "Finished! - You've recovered important glyphs from the Temple of the Damned!");              
      $client->Message(13, "Finished! - You've successfully translated the glyphs you found in the Temple of the Damned!");
      $client->Message(13, "Finished! - You've sewn the flesh scraps together to make the Sewn Flesh Parchment!");
      $client->Message(13, "Finished! - You've found the three clues from the three trial temples!");
      $client->Message(13, "Finished! - You've collected the Minor Relics of Power from the Pit of the Lost!");
      $client->Message(13, "Finished! - You've rescued the artifact from the Ageless Relic Protector in the Pit of the Lost!");
      $client->Message(13, "Finished! – You have been approved for the three trial temples!");         
      $client->Message(13, "Finished! - You have completed the three raid trials!");
      $client->Message(13, "Finished! - You have crafted the Icon of the Altar!");
      }
   } 
}
sub EVENT_ITEM {
  if ((plugin::check_handin(\%itemcount, 60141 =>1,60142 =>1,60143 =>1,60144 =>1 )) && (defined $qglobals{ikky} && $qglobals{ikky} == 4)) {
         $client->Message(4,"Finished! - You've returned four relics from the Martyrs Passage!");
         quest::setglobal("ikky",5,5,"F");
  }
  if ((plugin::check_handin(\%itemcount, 60146 =>1,60147 =>1,60148 =>1,60149 =>1 )) && (defined $qglobals{ikky} && $qglobals{ikky} == 5)) {
       quest::emote("examines the strange glyphs.");
       quest::say("These glyphs are faded. I won't be able to decipher them until they've been cleaned up. You'll need to go back to the Martyrs Passage and recover some dust from the grounds nearby. Once you've gotten a pile of dust, you'll need to speak with Tublik Narwethar who is south of the Martyrs Passage. He has a stone tablet that can add some clarity to the glyphs with the help of that dust. Hurry along, $name, this information is important!");
           $client->Message(4,"Finished! - You've recovered important glyphs from the Temple of the Damned!");
           quest::setglobal("ikky",6,5,"F");
           quest::summonitem(60146,60147,60148,60149);          
  }
 if ((plugin::check_handin(\%itemcount, 60150 =>1 )) && (defined $qglobals{ikky} && $qglobals{ikky} == 6)) { 
      quest::emote("copies down the intricate patterns from the glyph.");
      quest::say("Very interesting, but very dangerous. I've gone over the glyphs and they suggest there is great danger in the summoning of some kind of ferocious beast. I need to study the markings further, but since I've transcribed them already, you can keep the glyph for your own use. Nicely done, $name.");
      quest::summonitem(60150);
      quest::setglobal("ikky",7,5,"F");
      $client->Message(4,"Finished! - You've successfully translated the glyphs you found in the Temple of the Damned!");
}
 if ((plugin::check_handin(\%itemcount, 60151 =>1 )) && (defined $qglobals{ikky} && $qglobals{ikky} == 7)) { 
    quest::say("You have done well, $name.  Speak with Tublik to continue helping us here in Kod'Taz."); 
    quest::setglobal("ikkyalt",8,5,"F");
      $client->Message(4,"Finished! - You were able to recover a rare artifact from the Grand Summoner's goons in the Summoning Circle!");
}
 plugin::return_items(\%itemcount);

}