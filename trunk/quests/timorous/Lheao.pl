sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("jumps at your voice and begins laughing at his skittishness.");
  quest::say("Ahh, hello there. Not many people know of this place, so visitors are quite rare. Hehehe. Its a very beautiful place indeed, so.. ummm, dont go telling everyone you know about it. Heheh. Thanks, Friend.");
 }
 if($text=~/i have found the book of immortals/i){
  # Monk Epic 1.0
  quest::emote("looks up at you, eyes wide in astonishment.");
  quest::say("My god, you found Immortals?! Where did you find it? Nevermind, that is unimportant. I have in my possession a book that explains more of these individuals. Its value is unimaginable as well as the impact it is capable of. As you can see, I grow old. I need an individual to watch over this book and make sure it is protected. Would you be willing to take this [responsibility]?");
 }
 if($text=~/responsibility/i){
  # Monk Epic 1.0
  quest::say("Im sorry, $name, but I could only give this book to a true master, such as a member of the Whistling Fists Order. And unless you can give me proof that you are one, in addition to Danls reference, which is very unlikely, there is no way I'll let you take charge of the [Celestial Fists].");
 }
 if($text=~/celestial fists/i){
  # Monk Epic 1.0
  quest::say("The Celestial Fists is the title of a book written by an unknown author. His writing is sub par but the legend is interesting from a biographical standpoint alone. Its rarity commands top dollar in the scholarly community but the secrets revealed in the book are what truely makes it dangerous. I hope Im able to find someone to watch over it soon.");
 }
}

sub EVENT_ITEM {
 # Handin: Robe of the Whistling Fists & Danl's Reference
 if(plugin::check_handin(\%itemcount, 12970 => 1, 1682 => 1)){
  # Monk Epic 1.0
  quest::say("Astonishing! To think that you are a master of an order thought to be lost in our world. Forgive my earlier doubts. I believe you are indeed worthy to be given the responsibility of watching over this book. Take great care that it does not fall into the wrong hands as it would be truly disatrous.");
  # Summon: Celestial Fists (Book)
  quest::summonitem(1683);
} else {
  quest::say("I have no need for this item $name, you can have it back.");
  plugin::return_items(\%itemcount);
 }
}


# End of File
