## Bidils_the_Quickhand.pl
## Quest: The Realm of Heroes -- Misty Thicket


sub EVENT_SAY {

   if($text=~/hail/i)
   {
      quest::say("Why, hello there $name! And what brings ya to see little old me? Oh, let me guess! I am sure it is because ya wish t'buy a good spot of Jumjum and listen to [my tale]? Oh, quite lovely so! Why else would one well rounded $race come to see the great Bidils the Quickhand other than to hear of this rogue's great adventures!");
   }
   if($text=~/my tale/i)
   {
      quest::say("Ahhh. . . I see the gods have found the time to be now for a good ear to lend to my words! So long as ya share the Jumjum, I can speak t'ya of the endless adventures and triumphs of Bidils the Quickhand! Now. . . where shall I begin? Yes! [The beginning], of course! Indeed, quite lovely so.");
   }
   if($text=~/The beginning/i)
   {
      quest::say("Yes, of course I shall begin at the beginning! No proper tale would begin anywhere other than the beginning! You see, good $race, I was once a humble rog. . . [merchant] within this here fair   city. Oh, how the Jumjum and gol. . . merchandise flowed in then! Quite lovely, indeed, it was. Well then, where was I?");
   }
   if($text=~/merchant/i)
   {
      quest::say("hhh yes! Those days were fair indeed. How I do miss them! Of course, that is not to say that Bidils the Quickhand does not appreciate the eyes and favor of [Bristlebane] upon him! In fact, it is quite the contrary! I do love a good prank! Yes, quite lovely so!");
   }
   if($text=~/Bristlebane/i)
   {
      quest::say("Fizzlethorp Bristlebane, indeed quite the trickster and with a sense of humor! I bet you could not have seen that Bidils the Quickhand would have caught the eye of such a dignified individual, now did ya? Yes, The King of Thieves. . . and merchants finds it amusing when one [takes his possessions]!");
   }
   if($text=~/takes his possessions/i)
   {
      quest::emote("eyes grow wide with an eager, child-like anticipation.");
      quest::say("Oh yes! Upon one of my several adventures through this great, glorious land of Norrath, I did stumble upon a [lovely treasure], indeed! Great skill and cunning was used, skill that belonged only to Bidils the Quickhand, and has yet to be surpassed within this realm!");
   }
   if($text=~/lovely treasure/i)
   {
      quest::say("A lovely gem, far more beautiful than even the most delicate and fury feet of a halfling lass! It was larger than my face, and sparkled more than the most pure of Jumjum catching the rays of Karana's blessed skies! Indeed, it was a divine treasure to behold. . . but little then did I know that such a treasure truly belonged to the King of Thieves. . . and merchants himself! But no, such truths still would not have [stopped me]!");   
   }
   if($text=~/stopped me/i)
   {
      quest::say("Ahh ha! I was not stopped, and the gem was mine! Right from beneath the arms of Bristlebane   himself did I take it! That was when he noticed me. . . and that is when I was taken from the humble life of a merchant and placed within the glorious [realm of heroes]! Of course. . . Bristlebane took back the gem. What a shame. Indeed, quite so.");   
   }
   if($text=~/realm of heroes/i)
   {
      quest::say("The realm of heroes, that is my new home. . . Well, it was. Ahhh, indeed, it is quite lovely! It is where all that catch the eyes of the gods in favor ascend if their deeds be true and worthy   enough for note! Perhaps one day, $name , you shall rise as well!! Look at Bidils the Quickhand, once a sturdy merchant and now a [humble servant] and rewarder of deeds!");   
   }
   
   if($text=~/humble servant/i)
   {
      quest::say("Yes! Indeed, a humble servant I am! I complain not for my occupation. . . as I am humble. I   collect [deeds and make recognition] of those who have caught the eyes of the gods. Why the gods do it not themselves, I am lost for answers. . . but, I do not complain. They are gods, you know. Quite busy! Indeed, lovely so!");
   }
   
   if($text=~/deeds and make recognition/i)
   {
      quest::say("Deeds! Yes, the gods are quite tricky and intelligent you know! They have found a way to mark deeds in the form of a coin! A [coin] in which one who has been so fortunate enough as to accept would give to me. . . or one of the [other Heroes] that have recently come to this land.");
      }
   
   if($text=~/other Heroes/i)
   {
      quest::say("Oh yes! I am not the only one who has returned to Norrath in search of Heroes! There are many others, indeed! Although, as the gods, their colors vary. Some are [kind and gentle] while some are [vile and nasty] beings of which ya should watch ya'r back for.");
      }
   
   if($text=~/kind and gentle/i)
   {
      quest::emote("sighs heavily, a twinkle in his eye and warm smile upon his heavy cheeks.");
      quest::say("Yes. . . none so as Ailerina the Gentle, as she was so rightfully named. A lovely lass. Tender as a gentle morning mist. . . Yes. . . Indeed, quite lovely so. An enchanting creature. . . and as pure as Tunare's good grace itself. It is no wonder she caught the Earth Mother's eye.");
      }
   
   if($text=~/vile and nasty/i)
   {
      quest::emote("glares and spits on the ground beside him.");
      quest::say("I know not why some of these. . . villains are called heroes. It is all part of the fold and plan, I am sure. However, I shall give ya this warning of one of them, perhaps the most vile of all, and that is Kizrak the Tyrant, a brutal creature of the Warlord who has quite the taste for halflings. . . and I mean not in the sense of good grace and kindness");   
   }      
}
