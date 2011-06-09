sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("smirks and nods politely your way. The glint of a silvery key hanging from a chain around his neck catches your eye.");
  }
  if ($text=~/key/i) {
    quest::say("'Oh what, this little thing?' He grasps the key with one hand and holds it forth, displaying it proudly. This be my pride and joy, aye. Stolen right out from under the nose of those blasted Muramites. They be mighty angry at my trespass, I gather.");
  }
  if ($text=~/money talks/i) {
    quest::say("Money talks? Aye, it does. Keep in mind I still can't give you the original, it means far too much to me. If you're dying to have the key you can make a copy. Say twenty-five thousand gold. It's a nice round number. That should be relatively trivial for someone of your background to obtain.");
  }
}

sub EVENT_ITEM {
  if($gold >= 25000) {
    quest::summonitem(52181);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}