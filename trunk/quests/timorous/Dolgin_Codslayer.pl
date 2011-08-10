sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("ARGH! Dangit, ya scared me! Tread cautiously, friend. This here place ain't as friendly as it seems. There's a beast lurkin' in this here puddle.");
  } elsif ($text=~/a beast/i) {
    quest::say("Aye lad. I seen it come from the ocean. It was fightin' a group of adventurers, not unlike yerself. The battle raged long and hard, and at the end the beast lay still among countless of the adventurers bodies. They left assuming it had been slain by their hands. But, once they left, I seen it come crawlin in this here place. They called it by the name Fayde, er, Fayred. Hrmm. What was it they called it? I can't remember.");
  } elsif ($text=~/Faydedar/i) {
    quest::say("Ya! That's what they called it! A great water dragon as the legends say. Only way to find him now is to lure him out from hiding. Not that I would suggest doin such a thing. The dern thing's broken, bleedin, and cornered. That's a mighty deadly position to put a critter in if ye ask me. Course if yer wantin' to try it, there might be a way. Ya willin to risk it?");
  } elsif ($text=~/i will risk it/i) {
    quest::say("Well jus' before that there beast ended up in combat, I watched him from the shores. Only reason he got into such a mess was 'cause of his belly. He swam right into those adventurers chasin' down a wandering froglok. You wanna catch a fish, use the right bait. If only we had us some frogloks essence, then mebbe he'd come out agin. But I must warn ye laddies that the bloke over by the inn already warned me to leave all the natural critters in this here oasis in peace. He might get right mad if he sees a battle brewin' here.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount,20696=>1)) {
    quest::say("What's this? Egads! It's perfect.  Now all we gotta do is hope he bites.' Dolgin takes a little of the essence and smears it on a piece of bread. He places the bait into the water and watches intently.");
    quest::summonitem("20696");
    quest::spawn2(96073,0,0,-2178,-11745,-0.63,63);
    $npc->Depop(1);
  }
  plugin::return_items(\%itemcount); # return unused items
}