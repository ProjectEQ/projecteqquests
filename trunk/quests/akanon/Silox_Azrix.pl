sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 20694 => 1)){
  quest::emote("looks up at you with a twisted gleam in his eyes. 'Something for me then, eh?' As he looks closer his skin begins to peel and stretch, a bright hot light emanating from his hands gripped around the unicorn horn. 'NOOOO!' The pure cleansing light burns away the gnome without a trace of his existence except for a tiny ball of light which you pick up.");
  quest::summonitem(20697);
  quest::depop();
 }
}