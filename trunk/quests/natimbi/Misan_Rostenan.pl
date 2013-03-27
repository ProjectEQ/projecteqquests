# Paranormal Research
# Created by Gonner

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome, adventurous one. You wouldn't happen to be interested in a little [paranormal research] would you?"); 
  }
  if ($text=~/paranormal research/i) {
    quest::say("That is wonderful. There are some ruins on the other bank of this channel. They appear to be quite old and are covered in strange markings. It is my theory that they were some form of religious or supernatural ritual area. I don't know what happened, but there are ghostly sightings there nearly every night. I have been studying them but thus far have had no luck in gaining anything solid that I can bring back for extensive study. I have seen some strange essence left behind, however. If you could bring me a few of those, say four? It would be most helpful. I may even have a mace in it for you."); 
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 54064 => 4)) { # Spectral Essence
    quest::exp(10000);
    quest::summonitem(54065) # Mace of Focused Flame
  }
  plugin::return_items(\%itemcount);
}
#END of FILE zone:natimbi ID:280045 -- Misan_Rostenan.pl