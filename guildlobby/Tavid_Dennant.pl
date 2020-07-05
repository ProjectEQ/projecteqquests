#status: initial copy/paste of ZAM info
# items: 429420

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Well hello! What brings a _____ like you to a place like this? Me? I seem to have misplaced my scarf, I don't suppose you've seen it? Long, wool, colorful? I can't imagine where I might have left it. Speaking of misplaced things, I've got quite a number of who's its and what's its that I've picked up during my travels. You're welcome to take a look if you think you might find any of it useful. All except for this [watch] of course. I also have a limited amount of [items] that work with armor from beyond the void. These I will even give for free, but you must ask me for them.");
  } elsif($text=~/luminescent/i) {
    quest::summonitem(429420);
  }
}