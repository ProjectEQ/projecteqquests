sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome, $name!  Good to see that you came out for the event.  here are some swim goggles to help you cross the lake.  Don't forget to hand these to my friend Bike on the far shore so that you can complete the next leg of the race.");
    quest::summonitem(16889);
  }
}