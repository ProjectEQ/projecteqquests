sub EVENT_SAY {
if (($text=~/hail/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 6)) {  #update global at proper point
   quest::say("Welcome back, $name. Have you found any clues from the [Crumbled Sanctuary] yet? Please find anything you can and return to me as soon as possible!");
  }
  else{
    quest::emote("glances at you suspiciously.");
    quest::say("Can I help you with something? Has someone sent you? Speak up!");
    quest::say("If you want to see what you've completed at any time, just ask me for a [progress update]!");
  }
  if ($text=~/progress update/i) {
  #add kodtaz update via globals
  }
if (($text=~/stone tablet/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 6)) {
  quest::say("You need a stone tablet? What for? What have you got that's so special it requires the use of a stone tablet?");
 }
if (($text=~/crumbled sanctuary/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 8)) { 
  quest::say("Oh yeah, I know all about that thing. It was a temple that was decimated by the Muramites during their initial invasion. We're unsure what caused them to destroy that temple, but not the other three. I need you to go to the temple and [look for clues] as to what the reason may have been for destroying the temple.");
 }
if (($text=~/look for clues/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 8)) {  
  quest::say("I have no idea what the clues may look like, but I'm hoping they'll bring about some insight as to the reason behind the Muramites destroying the temple. Once you've recovered all the clues you can find, please come back to me so I can go over them. If we're lucky, I'll be able to decipher what the real cause was and we can relay that important news to the brotherhood. Off you go, $name, and good luck!");
 }
if (($text=~/ritual/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 9)) {   
  quest::say("I've been assuming that only the Muramites were so cruel that they would rip flesh from another living being in this manner, but it appears that the trusik priests were the ones that did it. They etched glyphs into the skin and then removed it to be used later. The glyphs represent the four temples and their direct connection to the Altar of Destruction. It looks as though there may be [more clues] about the Altar of Destruction and its surrounding temples in the trial temples.");
 }
if (($text=~/more clues/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 9)) { 
  quest::say("I need you to return to the three temples where you participated in the three trials. Based on this clue, I believe you will find three additional clues about the Altar of Destruction in the Temple of Singular Might, the Temple of Twin Struggles, and the Temple of the Tri-Fates. I doubt they'll be hard to find, but you must go to each and search for the clues! Return to me when you have found them!");
}
if (($text=~/pit of the lost/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 10)) {
   quest::say("I see Kevren finally sent someone to me to look into the pit. It's about time! I've been telling him over and over that there are some really strange things going on in the Pit of the Lost to the north of here, but he just doesn't seem to want to pay enough attention to the claims. In any case, you're here now and that means that you must be [willing to look] into the odd occurrences, right?");
}  
if (($text=~/willing to look/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 10)) {
   quest::say("I'm glad I can count on you. You need to know a couple things before you go. As I said, there are strange things going on in the pit, but we're not sure what they are yet. We have sensed an energy force emanating from that area and believe there are some kind of artifacts there that must be collected. We need you to [collect the artifacts] and return them so we can study them.");
}
if (($text=~/collect the artifacts/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 10)) {
   quest::emote("hands you a bag");
   quest::say("Place four artifacts you find from the pit in this bag and seal it off. Return the sealed bag to me when you're done so I can further examine what you find. Make haste to the Pit of the Lost and be careful -- there's no telling what kind of evils are waiting for you there. If you have someone else with you that [needs a bag], have them tell me so.");
   quest::summonitem(60155);
}
if (($text=~/stop it/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 11)) {
   quest::say("Hurry, the Protector is now present");
   quest::spawn2(293221,0,0,2176,2184,-476,137);
}
if (($text=~/four temples/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 12)) {
    quest::say("As you've already uncovered, the Sanctuary of Divine Destruction was used to uncover the purpose for the other three. I believe the Muramites destroyed that temple because it holds the key to the remaining three temples and the artifacts that they hold. Now that we know what's ahead, we can continue forth and unravel this [mystery].");
}
if (($text=~/mystery/i) && (defined $qglobals{ikky} && $qglobals{ikky} == 12)) {
    quest::say("It's clear to me that you must proceed into each of the three remaining temples and recover the three artifacts that are in them. It's up to you how you want to proceed, but you will have to enter the [Sanctuary of the Righteous], the [Sanctuary of the Glorified], or the [Sanctuary of the Transcendent]. Each one of these holds an artifact that I believe will be used to gain entrance to whatever lies beyond the Altar of Destruction. Which will you choose?");
}
}    
sub EVENT_ITEM {
if (defined $qglobals{ikky} && $qglobals{ikky} == 6) {
  if (plugin::check_handin(\%itemcount, 60146 =>1 )) {
     quest::summonitem(60146);
     GIVE_TABLET();
     }
  if (plugin::check_handin(\%itemcount, 60147 =>1 )) { 
     quest::summonitem(60147);
     GIVE_TABLET();
     }
  if (plugin::check_handin(\%itemcount, 60148 =>1 )) { 
     quest::summonitem(60148);
     GIVE_TABLET();
     }
  if (plugin::check_handin(\%itemcount, 60149 =>1 )) {
     quest::summonitem(60146);
     GIVE_TABLET();
     }
}
if (defined $qglobals{ikky} && $qglobals{ikky} == 8) {
  if (plugin::check_handin(\%itemcount, 60162 =>1, 60163 =>1, 60164 =>1, 60165 =>1 )) {
    quest::emote("grunts unhappily at the four pieces");
    quest::say("I had hoped more work wouldn't be needed to uncover the clues, but it looks like there's a bit more you're going to need to do for me. Take a look at these edges. Do you see how they look really sinewy? That's because they're [made of flesh], probably that of the trusik. No doubt the Muramites have been quite cruel to them now that they are mostly used for slavery.");
    quest::exp(100000);
    quest::summonitem(60162);
    quest::summonitem(60163);
    quest::summonitem(60164);
    quest::summonitem(60165);
    }
    if (plugin::check_handin(\%itemcount, 60166 =>1 )) {
      quest::say("Nicely sewn, $name. I would have tried doing it myself, but I have the most unsteady fingers when it comes to things like that. In any case, let me have a look at what this says.' Tublik looks over the clue for a time before continuing. 'Unbelievable. Simply astounding. These notes weren't made by the Muramites at all. In fact, they were created by trusik priests from their own flesh in some kind of [ritual].");
    quest::setglobal("ikky",9,5,"F");
    }
}
if (defined $qglobals{ikky} && $qglobals{ikky} == 9) {
  if (plugin::check_handin(\%itemcount, 60167 =>1, 60168 =>1, 60169 =>1 )) {
      quest::emote("stares at the three clues for a moment before speaking.");
      quest::say("I can't be sure, but I believe we are getting close to something big, $name. I need more time to examine these clues, but I should have something for you when you return. You've done well and I know that we wouldn't have been able to get this far without your help. Good job!");
   quest::exp(100000);
   quest::setglobal("ikky",10,5,"F");
}
}
if (defined $qglobals{ikky} && $qglobals{ikky} == 10) {
  if (plugin::check_handin(\%itemcount, 60160 =>1 )) {
  quest::say("You have done well.  It is now time to find the final relic which is guarded by the protector.  Are you ready to [stop it]?");
  quest::setglobal("ikky",11,5,"F");
}
}
if (defined $qglobals{ikky} && $qglobals{ikky} == 11) {
  if (plugin::check_handin(\%itemcount, 60161 =>1 )) {
  quest::say("Well done!  You are now ready to venture into the [four temples].  Let me know when you are ready.");
  quest::exp(100000);
  quest::setglobal("ikky",12,5,"F");
}
}
plugin::return_items(\%itemcount);
}

sub GIVE_TABLET {
    quest::say("So, you really are helping Kevren with this. My apologies for being so blunt with the requirements, but you never can be too careful with things like this. Here's a stone tablet for your troubles. You're going to need to use as many piles of dust as you have glyphs, then combine the dust and the four glyphs together with the stone tablet to translate them. These glyphs can be tricky, so good luck.");
    quest::summonitem(60175);
  }
