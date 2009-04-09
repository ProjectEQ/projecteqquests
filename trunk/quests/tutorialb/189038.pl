sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("You should brush up on your swimming skills while your here. Simply jump into the lake and use your direction keys to swim back and forth. You can also up PAGEUP to swim up and PAGEDOWN to swim down. Give it a try.");  
  }
}