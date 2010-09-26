sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Mortals, this far into the planes? Something that I never thought that I would see. Regardless that does not help my situation any does it?");
  }
  if($text=~/situation/i) {
    quest::say("Not that it is your business, but this is where I call home. I have lost track of the years that I have spent here. This valley is my home, for I was exiled from [Mithaniel's Temple]. It is not a story that I am proud of and do not wish to share with you. So be one with you.");
  }
  if($text=~/temple/i) {
    quest::say("Only a mortal would be as thick headed to know not when to take their leave. He and his legions call his temple The Halls of Honor. Paladins that have served him well on Norrath have the opportunity to ascend into his ranks. They are in training to make sure that they are always prepared to defend what they believe is the right and honorable thing to do. Mithaniel is an extremely proud being, and will accept any challenge that you may have to offer him. If you are willing to challenge him, I may have some [information] you will find useful.");
  }
  if($text=~/information/i) {
    quest::say("There are other methods to enter the Halls of Honor than those that are readily apparent, and as a former soldier of Marr I can offer you access into the Halls; however as with all such arrangements there must be something [paid] for something earned.");
  }
  if($text=~/paid/i) {
    quest::say("I was not the only member of my squad that was sent into exile, my brothers in arms, were the impetus for our exile. I was but a mere pawn. They now reside in the Plane of Justice as bodiless shades. Their punishment was too lax for their actions; I want their eternal souls to be mine. Find a smith who will teach you to create a box of souls, weaken the shades, then capture their souls and return all three to me.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 29281 => 1, 29292 => 1, 29293 => 1, 29294 => 1)) { #Box of Souls, Soul Sphrere (Angry), Soul Sphere (Calm), Soul Sphere (Resisting)
    quest::say("Hmm, this is minor vindication, but vindication nonetheless. I will never again fight with my old compatriots, but now I know the punishment of those responsible for my exile is fitting for their crime. We did have an agreement, and while stripped of my rank I still have my honor. This ring is what all Soldiers of Marr wear to enter the Halls of Honor, it serves no use for me any longer, it is yours now.");
    $group = $client->GetGroup();
    if($group) {
      for ($count = 0; $count < $group->GroupCount(); $count++) {
        $player = $group->GetMember($count);
        if($player) {
          $player->SummonItem(29214); #Ring of Marr
          $player->SetZoneFlag(211); #hohonora
          quest::targlobal("pop_alt_access_hohonora", 1,"F", 0, $player->CharacterID(), 0);
          $player->Message(15, "You receive a character flag!");
        }
      }
    }
  }
  else {
    quest::emote("ignores you.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:povalor  ID:208029 -- Grenic_Drere