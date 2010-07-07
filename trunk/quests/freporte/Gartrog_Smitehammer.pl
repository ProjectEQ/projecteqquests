sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("You have heard of the strange stones being recovered from ancient dungeons? It is true. Powerful stones of unknown origins have been discovered as of late in the newly discovered dungeons. I see you wield a warrior's most prized honor. Congratulations on your acquiring such a fine weapon. It holds great power. I worry however if you were to try to augment your new weapon with one of these new stones. I have done some research and it seems the Red Scabbard used to combine and uncombined your weapon, could potentially harm any augmentation you might add. However with the help of Wenden here, we have been able to successfully forge all three versions of your weapon! The scabbard no longer works with them, but we have achieved some nice results by adding various augmentations to them. We could perhaps craft you a new set of weapons if you are [interested].");
  }
  if ($text=~/I am interested/i) {
  quest::emote("Gartrog Smitehammer pulls out a shining smithy's hammer.");
    quest::say("Hand me your Red Scabbard and your Jagged Blade of War. I will supply the rest of the metal since you helped out Kargek with the note from his brother and the gift you gave to him.");
  }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 17859 => 1, 10908 => 1)) {
    quest::emote("Gartrog Smitehammer begins to furiously work the metal. Sparks fly and a faint magical aura seems to surround the immediate area.");
    quest::say("Ah, a fine job! Your new weapons, $name! Good luck on your travels and if you find any of the augmentation stones, you can now use them to make these fine weapons ever finer!");
    quest::summonitem(66175);
    quest::summonitem(17869);
  }
  else {
     plugin::return_items(\%itemcount);
}
}