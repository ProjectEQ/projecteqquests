sub EVENT_SAY {

if (defined $qglobals{muadalet} && $qglobals{muadalet} == 8) {
  if ($text=~/hail/i) {
    quest::emote("eye's you curiously.");
    quest::faction( 397,5 );
    quest::faction( 364,5 );
  }
}
if (defined $qglobals{muadalet} && $qglobals{muadalet} == 8) {
  if ($text=~/willing to help/i) {
     quest::say("Uyo rea het tebardsrol?");
}
}
if (defined $qglobals{muadalet} && $qglobals{muadalet} == 8) {
   if ($text=~/I am the beastlord/i) {
     quest::say("Ah, a quick study. Interesting. We did indeed seek some help, but you must [prove] your wits. That is our way.");
   }
}
if (defined $qglobals{muadalet} && $qglobals{muadalet} == 8) {
  if ($text=~/prove/i) {
   quest::say("You must answer three [riddles]. Because I only request your help, I will not put you through a great challenge, but you must know and understand the world around you if you expect to pass this test of good faith."); 
   }
  }
if (defined $qglobals{muadalet} && $qglobals{muadalet} == 8) {  
  if ($text=~/riddles/i) {
    quest::say("The first riddle is thus -- There are two revolving in two ways.");
  }
  }
if (defined $qglobals{muadalet} && $qglobals{muadalet} == 8) {  
  if ($text=~/moons/i) {
    quest::say("Very well. I see that wasn't too great of a challenge. The second riddle you must answer is -- Set upon the world in defiance, the cauldron still swims with its ire alone.");
  }
  }
if (defined $qglobals{muadalet} && $qglobals{muadalet} == 8) {
   if ($text=~/kedge keep/i) {
     quest::say("I had not thought you'd get this far. Most of Norrath's history is forgotten, but this is encouraging indeed. The final riddle you must answer for me, is this -- They were one that splintered in to three.");
   }
   }
if (defined $qglobals{muadalet} && $qglobals{muadalet} == 8) {
  if ($text=~/elddar elves/i) {
    quest::say("You have indeed studied the world and know the simplest of references. I am grateful you would even attempt to aid us, two of the few remaining sphinxes. Most would rather take our secrets from us or see us dead! And I do believe we have once again come upon an [enemy].");
  }
  }
if (defined $qglobals{muadalet} && $qglobals{muadalet} == 8) {
  if ($text=~/enemy/i) {
    quest::say("Yes, and do perk your ears. I do not want to have to say this too loudly. There is darkness around our minds and it is clouding our visions and magic. It is a cold, [chaotic feeling] and it does not feel natural. I might have dismissed it as my path to aging, but it is not, for my counterpart, Zazamoukh, feels it too.");
    }
    }
if (defined $qglobals{muadalet} && $qglobals{muadalet} == 8) {
  if ($text=~/chaotic feeling/i) {    
      quest::say("Not since we allied with the ogre magi long ago, have I felt foreboding in my heart. But I feel it tenfold now. Something or someone is attempting to envelop our minds and use them against us somehow, but we are not sure how. I fear that even as I speak to you, I am [endangered] further, and so are you.");
      }
      }
if (defined $qglobals{muadalet} && $qglobals{muadalet} == 8) {
  if ($text=~/endangered/i) {      
     quest::say("Zazamoukh calls to me. You must go see the sphinx quickly.");
     quest::setglobal("muadalet",9,5,"F");
    }
    }
    $qglobals{muadalet}=undef;
    } 
    
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 52904 =>1 )) {
    quest::say("What is this? Too . . . late . . . I do not understand. I am fading!");
    quest::spawn2(50327,0,0,-3304,3476,28,1180);
    qeust::depop();
  }
  if (plugin::check_handin(\%itemcount, 52903 =>1 )) {
    quest::say("Beastlord, I am indeed impressed. We did not know that there was a dark magic on the ankh pieces. It seems the life that flows from the ankh will need to be restored, but I think we are safe now. Take this gift to return to the beastlord elders who aided us.");
    quest::summonitem(52905);
  }
  plugin::return_items(\%itemcount);
}