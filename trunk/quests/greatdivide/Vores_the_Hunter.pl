sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("squints and looks in your direction. 'Who is that? I can't see ya but yer not Coldain and yer voice is too whiny for a giant. We ain't bashin' each other's brains in yet so ya can't be all that bad. Come have a seat by me fire. But quiet yerself down already. The wurms may not be the best at sniffin out people but best not to test em'.");
  }
  if ($text=~/wurm/i) {
    quest::say("Ye must be kidding me, outlander. Sure'n ya got eyes. The shardwurms. If ye can't see em then ya best not be tryin' ta put on yer pants for fear of stabbin' yerself with a sword.");
  }
  if ($text=~/control/i) {
    quest::say("Control. Aye. Break em like dogs or such. Domesticate em. I ain't ever found a way, all I got is me theories.");
  }
  if ($text=~/theories/i) {
    quest::say("It ain't so complex like a caster's diagrams 'n such. I just be thinkin' mebbe ya need a somethin' like a leash and then maybe some magical gem o' control. Uh, maybe. Ain't much for years o' work, eh? Unfortunately, I tried a hundread of other things already. Them wurms chafe at any attempt at control.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30270=> 1, 30249=> 1)) { #Gem of Persuasion and Blood Wolf Harness
    quest::say("Hey! What ya got there? Well now, ain't that pretty! Ya know, this just might do it. You done what I never was able. I gotta give ya that much. I ain't much o' one for travelin' any more. My legs be old and my bones are weak. You take this harness and find a good big mother of a wurm ta test it on. Just focus in yer mind what yer wantin the wurm ta do. Heh, maybe have it clear out some pests, eh?");
    quest::summonitem(30272); #Harness of Control
	quest::ding();
  }
  plugin::return_items(\%itemcount);
}
