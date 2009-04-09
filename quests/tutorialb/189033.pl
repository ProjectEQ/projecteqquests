sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Maps are a wonderful thing you know. Any time you find yourself lost you can hit BACKSPACE to view your map , try it.");  
  }
}