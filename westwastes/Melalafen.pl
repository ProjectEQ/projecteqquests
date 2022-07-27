# Essence items
# items: 27329, 27265, 2698, 2699, 2700, 2748, 2842

sub EVENT_SAY {
  if ($faction <= 5) {
    if ($text=~/hail/i) {
      quest::say("We are aware of your presence, fleshling.");
    }
    if ($text=~/who/i) {
      quest::say("We are those who have been in hiding. We are those who have been in waiting. We are those who await the return of our Master.");
    }
    if ($text=~/master/i) {
      quest::say("Our Master? Surely all know of our Master now. It was he who was sleeping. It is he who is now freed. We give him honor, loyalty, and our lives. Jaled'Dar, first of our order, set in motion the events that freed our Master. But the Master has departed quickly, perhaps to challenge the Mother herself, such is his power. We wish to aid our Master, but we fear he is not aware that we exist, for his last memory of Wyrmkind was one of treachery and defeat. We believe we know where he has gone, but we do not know how to reach him.");
    }
    if ($text=~/where/i) {
      quest::say("We believe that he is in a far distant plane, beyond the powers of even the mightiest dragon to reach. He goes places only Veeshan herself was able to visit. We believe he searches for our long departed Mother, to challenge her for rule of the very heavens. If only we had some means of reaching him, we would give him all our aid! We doubt your pitiful mammal brain is capable of devising a plan where we have failed, but we will listen to your chatter, such is our desperation.");
    }
    if ($text=~/prismatic dragon scale/i) {
      quest::say("You have a scale? A scale from Kerafyrm himself? His long slumber, or the battles after he was freed, must have weakened him a great deal! One such as our master does not shed. If this is true, and you possess what you say, there is hope for us. With his scale, we can create a focus which gives us a chance to locate him in the far ether. But wait! If you have his scale, you must have been in his tomb! You are the ones who were responsible for freeing him, yes? If this is so, we owe you a debt, for carrying out Jaled'Dar's Plan. Give us the scale and we shall reward you well. We also require the key Jaled'Dar crafted for you to enter the tomb. His tomb is a holy place, and the likes of you should not be allowed to further defile it. We shall not compromise, the key and the scale.");
    }
  }
}

sub EVENT_ITEM {
  if ($faction <= 5) {
    if (plugin::check_handin(\%itemcount, 27329 => 1, 27265 => 1)) {
      quest::say("Thank you for returning this to us. Here is your reward, imbued with the essence of a fool who held one of the keys to our Masters prison. If you are unhappy with your reward, return it to us and perhaps we can give you something more appropriate.");
      quest::exp(5000000);
      quest::faction(1623,10);   #Disciples of Kerafyrm
      quest::faction(430,10);   #Claws of Veeshan
      quest::faction(304,10);  #Ring of Scale
      quest::faction(448,-30); #Kromzek
      quest::summonitem(2698); # Item: Essence Lens
    }
    elsif (plugin::check_handin(\%itemcount, 2698 => 1)) {
      quest::summonitem(2699); # Item: Essence Mace
    }
    elsif (plugin::check_handin(\%itemcount, 2699 => 1)) {
      quest::summonitem(2700); # Item: Essence Blade
    }
    elsif (plugin::check_handin(\%itemcount, 2700 => 1)) {
      quest::summonitem(2748); # Item: Essence Pearl
    }
    elsif (plugin::check_handin(\%itemcount, 2748 => 1)) {
      quest::summonitem(2842); # Item: Essence Ring
    }
    elsif (plugin::check_handin(\%itemcount, 2842 => 1)) {
      quest::summonitem(2698); # Item: Essence Lens
    }
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: westwastes ID: 120126 NPC: Melalafen
