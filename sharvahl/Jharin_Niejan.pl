my $count = 0;

sub EVENT_SPAWN {
  quest::settimer("shifting",10);
}

sub EVENT_TIMER {
  $count++;
  if ($count == 1) {
    quest::say("This is the tale of the time that followed the Shifting. Our people had been thrown into darkness with only a handful of heroes to guide us. Perhaps it was fate that brought us here... or maybe the spirits are calling us to their aid.");
  }
  if ($count == 2) {
    quest::say("When the magic ripped us from our realm, we found ourselves within a strange land. We could no longer sense our guiding spirits around us, and fear began to overtake our kin. Fortunately, our king Vah Kerrath was quick to see this, and so he began to give us tasks to help our people regain their sanity and stability.");
  }
  if ($count == 3) {
    quest::say("He sent his greatest warriors under the leadership of the great explorer Khati Sha to the north to find out more about these strange lands. King Vah Kerrath then sent another army of brave men to the west under the leadership of Dar Khura.");
  }
  if ($count == 4) {
    quest::say("The citizens that marched into the darkness in those days were responsible for the security that we now enjoy. The bravery of Vah's leaders and our ability to come together as a people secured our sanctuary here in the darkness. Those days were full of turmoil and conflict... much like they are now.");
  }
  if ($count == 5) {
    quest::say("Before the time of the Shifting we had the spirits to guide us, but their guidance seemed to be blocked from us by the only sense a distant creature lurking as if it was of the shadow itself.");
  }
  if ($count == 6) {
    quest::say("Without the will of Vah to guide us through those desolate years, we might have lost everything. Our People feared that we were the only of our kind left alive and to give up would have meant that the honor of our ancestors would have surely been lost to the ages.");
  }
  if ($count == 7) {
    quest::say("When our king passed on, we took his name as our own to show that we are strong, for he was a strong king. Under the leadership of Vah Kerrath, we survived.");
  }
  if ($count == 8) {
    quest::say("We survived the loss of our ancestral spirits and we survived the loss of our home and our people. We stood firm against the lurking shadows and roared the name of Vah as a challenge to all who would stand against our will to live. That is how we survived the Shifting.");
  }
  if ($count == 9) {
    quest::say("Thank you for listening. Do not fear, if you missed part of that story I will repeat it again in a little while. It is one of my favorites.");
    quest::settimer("shifting",400);
  }
  if ($count == 10) {
    $count = 0;
    quest::settimer("shifting",10); 
  }
}