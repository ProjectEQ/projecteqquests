sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::emote("gives you a crooked smile. 'Hello there, $name. I'm doin some important 'meditations' to my
god here. Maybe you can go somewhere else?'");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20694 => 1)) {
    quest::emote("looks up at you with a twisted gleam in his eyes. 'Something for me then, eh?' As he looks closer his skin begins to peel and stretch, a bright hot light emanating from his hands gripped around the unicorn horn. 'NOOOO!' The pure cleansing light burns away the gnome without a trace of his existence except for a tiny ball of light which you pick up.");
    quest::summonitem(20697);
    $npc->Depop(1);
  }
  else {
    quest::say("I do not want this.");
    plugin::return_items(\%itemcount);
  }
}