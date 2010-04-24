sub EVENT_SAY {
         if($text=~/Hail/i) {
            quest::emote("grins widely, 'Hello $name, would you like to do some banking today?'");
         }
}
