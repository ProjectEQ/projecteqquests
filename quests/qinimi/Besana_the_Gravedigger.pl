sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I am the spectral image of Besana. In life, I guarded the spirits of my people and now in death I make sure the dead have a proper burial. Those who have tried to stop the menacing invaders of this area have suffered many losses. I have placed many bodies here in the ground until their spirits return to inhabit them. The spirits looking for their bodies need only say they [wish to live again] and I will dig up the body for them.");
  }
  if ($text=~/wish to live again/i) {
    quest::say("And so you shall my friend. And so you shall.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}