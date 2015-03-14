sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello there. Forgive me for staring, but it seems more and more of your kind have been passing through here each day. You sure are a curious $race.");
  }
}
#END of FILE Zone:povalor  ID:208063 -- Xaven_White