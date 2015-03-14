sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("stares at you blankly. She is wearing a pendant that resembles a sun occluded by the horizon.");
  }
  if ($text=~/the sun is setting on the horizon/i) {
    quest::say("He said you would come, $name. Listen closely to what I have to say. We do not have time for dilly-dally and I don't appreciate having to repeat myself to any old $class. Your services came highly recommended and so I doubt there will be any problems, hm? Our mutual acquaintance, Stanos, has various contacts around Norrath. Through these eyes and ears some disturbing information has surfaced. Word is that someone is attempting to forge a weapon of unmatched prowess - a blade of assassination, potentially capable of slaying even the most powerful creatures. We know the perpetrator is an outsider. They are not a member of any of any rival thieving guild, and we cannot trust such a weapon to exist out in the open without knowing its true purpose. Do you know [how we deduced this information]?");
  }
  if ($text=~/how did you deduce this information/i) {
    quest::say("Thieves guilds have their secrets - this is not in dispute. The most treasured secrets reside in the hands of the most senior members and they guard these secrets carefully. Because of this, an uneasy balance is maintained between the different sects. That balance has been disrupted. What we have discovered is that an unknown party has managed to pry the most guarded information on how best to craft a blade from thieves around the world. To what end this knowledge will be used for is unknown, as is the method they used to coerce these pillars of the community. But it does not bode well. Stanos knew this. Due to his past he no doubt believes that the blade will be used for a dark purpose, and who are we to argue? He has a special insight into such matters. At any rate, this is [where you come in].");
  }
  if ($text=~/where do i come in/i) {
    quest::say("You must find these rogues and deal with them.' She chuckles, 'Don't worry, you needn't cause them harm. Deal with them diplomatically. Here, take this pendant so that they recognize your status. Your name is inscribed on the pendant in symbols that they will understand. Many of these individuals are legendary members of the rogue community, or at the very least . . . Infamous. Causing them grief will solve nothing. Find out what they know. We can use this knowledge to [craft another blade]. If you can, find out who they spoke to. Use whatever methods you have at your disposal - these blaggards are not necessarily beneath bribery.");
    quest::summonitem(52009);
  }
  if ($text=~/craft another blade/i) {
    quest::say("We have multiple reasons for wanting to forge a duplicate blade: Firstly, we want to find out what we're up against. Second, it only makes sense to carry comparable weaponry in case you have to tangle with the assassin. Third, it will help us to uncover who was behind the creation of the original.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}