sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I suppose the bad publicity surrounding your organization has subsided to the point where we can speak freely.' He clears his throat, 'Word is that you are looking for someone to forge a blade or two specifically for you for a specific purpose. I'll go on faith that you intend to use this weapon to catch a criminal and not become one yourself. We have the ability. My assistant, Dandi, is the best smith I know. And . . . As luck would have it I [owe your friends a favor]. The only thing we lack is the knowledge of how to imbue the weapon with dark energy. I thought this secret lied in the hands of the Teir`dal, but if they will not acquiesce perhaps there is another way. Did you ever stop to think that the directions may have been written down somewhere?");
  }
  if ($text=~/owe my friends a favor/i) {
    quest::say("Let's get one thing straight, right now, $name. I do NOT work for Stanos, and I do NOT work for you. It's a simple matter of repaying a favor, and I'd suggest you not press the issue lest I change my mind.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 52337 => 1)) {
    quest::emote("Lirprin, Head of Affairs discusses the process with his assistant. She listens, nodding, then begins work immediately. She takes measurements of your hands and fashions the grip so that it's a perfect fit, then turns to the hot coals of the forge. She selects a brick of fine metal. Her back to you, Dandi hammers away at the metal, sparks flying in all directions. When the job is completed she hands you the blade, still warm. 'Best work I've ever done. I hope it serves you well. Unfortunately the metal I have to work with isn't the recommended 'Velixite'. Based on the description I used the closest thing we have. Also, without an example to work from I had to improvise on a few details that weren't fully described in your documentation.");
    quest::summonitem(52347);
  }
}