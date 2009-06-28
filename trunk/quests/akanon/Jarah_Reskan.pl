sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings, child. Welcome to Gemchopper Hall. I trust that you are a [warrior], or perhaps you are lost..?");
  }
  if($text=~/lost/i) {
    quest::say("One can easily get lost in Ak'Anon. You must get your vision checked. If you are truly lost, I would advise speaking with a mechanical guide. There should be one close by on the main walkway.");
  }
  if($text=~/warrior/i) {
    quest::say("That is good news! We gnomes are not known for our love of battle so it is always good to bring new blood into our ranks. We shall prove our worth as warriors to all other races. For now. there is much to do in Ak'Anon. There are [rogue clockworks] and the [cargo clockwork].");
  }
  if($text=~/rogue clockworks/i) {
    quest::say("The clockworks are the responsibility of Manik Compolten. Speak with him - I am sure he is here somewhere.");
  }
  if($text=~/cargo clockwork/i) {
    quest::say("The cargo clockwork is located near the entrance to Ak'Anon in the Steamfont Mountains. It runs a delivery to the windmills every five days at eight in the morning. There have been attacks by a group of highwaymen. They are quite a formidable group. I have offered a reward for their heads. Be very careful if you plan on escorting the cargo clockwork. This trio of bandits is very strong.");
  }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:akanon  ID:55172 -- Jarah_Reskan