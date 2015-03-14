#Text information for Pally 1.5. Hailed is in DB. The event script not yet implemented.

sub EVENT_SAY {
  if($text=~/brother/i) {
    quest::say("Mujak! Haha! He.. He captured me and.. Imprisoned me here as punishment for and resentful of our fathers favor toward me. He has only further proven his weakness through trapping me with power granted to him by Terris Thule. Hmm, [perhaps]..");
  }
  if($text=~/perhaps/i) {
    quest::say("Perhaps you could find some way to overwhelm Mujaki? I might be able to work an enchantment to transport you closer to my brother. I only feel I have power to send twenty four of you, when you have formed rank please have the leaders of your groups let me know when you are ready.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
