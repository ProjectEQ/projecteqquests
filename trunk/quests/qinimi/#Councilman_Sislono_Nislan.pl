my @player_list = ();
my $event_started = 0;
my $counter = 0;


sub EVENT_SAY {
  if ($text=~/hail/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 1) {
      quest::say("While I place my own life at risk by helping you, I feel a strong sense of honor amongst you and those who have come with you. It is because of this that I will try to help in anyway I can.");
}
}
  if ($text=~/stone of entry/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 2) {
  quest::say("Gaining access to such a private place has always been reserved for the elders of my people. While the legion may have destroyed our home, they have yet to figure out a way around many of our wards that bar access to our sacred areas. Unfortunately, their frustration at gaining entry resulted in the painful torture of many of my people until they were given the keys to enter. The courtroom requires one of these keys and while the invaders hold all of the existing keys, I can create one if you can retrieve the proper [items].");
}
}
  if ($text=~/items/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 2) {
  quest::say("The key consists of mud, some stonedust particles, and a piece of chalk. The mud can be found in the sewers beneth the city. The stonedust is plentiful near the coliseum, and the chalk can be found all over this area. Bring these to me and I will make you a temporary key which will grant you access to the courtroom. I implore you to hurry. I fear the one you seek may not be alive much longer.");
}
}
  if ($text=~/thing/i) {
    if (defined $qglobals{bic} && $qglobals{bic} == 2) {
    quest::say("The geomantic device which raises you into the courtroom is an ancient one and takes time to reset after it has been used. If you are having trouble entering, be patient. You will know it is ready to receive a key when you hear a grinding sound from the base of the device as it settles into place. Please be sure you are fully prepared before entering. While it once was a place of peaceful discussion, the courtroom is now a place where terrible torture is conducted by those the legion wants information from. When they see uninvited guests, they will not be very happy. The leader of this area's force is known as Tixxrt and stopping him is the only way you can save the small one, called Kreshin.");
}
}
if (defined $qglobals{bic} && $qglobals{bic} == 3) {
if ($text=~/ritual/i) {
  quest::say("While animating stone comes easy for us, sometimes we need an extremely powerful stone worker to help with the city. These stone servants were made through a ritual which combined the power of eight geomancers into a ninth. This geomancer would then imbue a stone worker with this power, resulting in a more powerful construct. We stopped doing the ritual when we discovered that it could take away our ability over time. If [she] has somehow figured out a way to absorb this power, then my people could be in more danger than I thought possible.");
}
}
if (defined $qglobals{bic} && $qglobals{bic} == 3) {
if ($text=~/she/i) {
   quest::say("We refer to her as the silent one, but the legion calls her Xictic. She is one of their kind who can use magic and she seems to be quite feared by everyone in this area. She comes here sometimes and takes three of us into the building with the glowing dome around it. Along with her are eight magic-using invaders and some of the slavers. When they are finished, only members of the legion leave. None of my people who enter are ever seen again. If what this says is true, you must stop her. If she succeeds, she will be able to control our stone servants at will and cause even more destruction. I beg you to stop her. I will help you in any way if you [promise] to stop her.");
}
}
if (defined $qglobals{bic} && $qglobals{bic} == 3) {
if ($text=~/promise/i) {
   quest::say("I cannot tell you how relieved this makes me. Now to the issue at hand. While Xictic and those she chooses can roam freely in and out of the magical dome surrounding the chamber, if anyone else tries to enter they are held back. As a councilman, I was granted a device that allows access into the dome and I've managed to keep it away from the prying eyes of the Mata Muram. Using it is not without its consequences, though. As soon as an outsider shows up within the dome, they will know what has occurred and will come searching for the culprit so be certain you are ready to face the challenges ahead before you embark upon this venture. Only eighteen of you will be allowed into the chamber at one time so gather your forces and tell me you are [ready] to face Xictic.");
   }
   }
 if (defined $qglobals{bic} && $qglobals{bic} => 3) {
 if ($text=~/ready/i) {
     if (!$event_started && $entity_list->GetNPCByNPCTypeID(281077)) { #Pixtt_Xictic_Krvne (NoTarget)
      $raid = $entity_list->GetRaidByClient($client);
      if ($raid) {
        for ($count = 0; $count < $raid->RaidCount(); $count++) {
          push (@player_list, $raid->GetMember($count)->GetName());
        }
        foreach $player (@player_list) {
         $pc = $entity_list->GetClientByName($player);
          $pc->MovePC(281,-521,36,-8,166);
         }
           $event_started = 1;
           quest::spawn2(281127,0,0,0,0,0,94);   #Trigger_Qinimi_2
           quest::emote("pulls out a small stone and closes it in his hand.");
           quest::say("Please be careful. What you are about to see may shock you at first, but don't let yourself be distracted for too long. These beings are merciless and once they have discovered your presence, they will stop at nothing to add your corpse to the others in the area.");
           quest::signalwith(281127,0,30);      #starts event

      }
      else {
        $client->Message(15,"Maybe you should consider joining a raid first.");
      }
    }
    else {
      $client->Message(15,"Mystical forces prevent you from entering at this time.");
    }
  }
}


sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 67700 =>1 )) {
    if (defined $qglobals{bic} && $qglobals{bic} == 1) {
    quest::say("Yes, I have seen this and others like it before. While we do not understand where it comes from, we have come to the conclusion that these strange glyphs express somthing important to your people. These particular glyphs were made by the small one they hold captive in the courtroom. If you wish to help him, you will have to retrieve the [stone of entry]. Only with this stone can you enter the courtroom and help the one who calls himself Kreshin.");
    quest::setglobal("bic",2,5,"F");
  }
  }
  if (plugin::check_handin(\%itemcount, 67398 =>1, 67399 =>1, 67400 =>1 )) {
    if (defined $qglobals{bic} && $qglobals{bic} == 2) {
    quest::emote("covers the three pieces in his hands, closes his eyes, and begins to chant. A glow begins to emanate from his hands and he begins to chant louder. Then, just as quickly as it began, the glow in his hands dims and the chanting stops.");
    quest::say("There you are -- the key which grants you and your party access to the courtroom. Just stand on the pedestal in the center of the large building in this part of the city with the key in your hand and say you wish to enter. There is one more [thing] I must tell you before you go.");
    quest::summonitem(67415);
  }
  }
  if (plugin::check_handin(\%itemcount, 67403 =>1 )) {
    quest::say("These glyphs look quite familiar. They are definitely in my language, but it seems as if the one who etched them did so against his will. Where did you get this? Wait, don't tell me. I know. Kreshin must have been successful in finding out what was going on in the Chamber of Souls. These glyphs detail how to animate stone using our geomancy abilities. There are some strange symbols toward the bottom, but for the most part, this is our language. Could he be trying to conduct the [ritual] of my people?");
    quest::setglobal("bic",3,5,"F");
   
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  if ($signal == 1) { #Signal from Trigger_Qinimi_2
    REMOVE_PLAYERS();
    $event_started = 0;
    $counter = 0;
}
}

sub REMOVE_PLAYERS {
  foreach $player (@player_list) {
    $pc = $entity_list->GetClientByName($player);
    $pc->MovePC(281,-1053,438,-16,1);
  }
  @player_list = ();
}
} 