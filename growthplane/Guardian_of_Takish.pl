sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Well met, $name. It is indeed a wondrous day to be serving the lady Tunare. If you know of any templars or knights, send them to me.");
  }
  if ($text=~/knight/i) {
    quest::say("Fortune smile upon me this day. It seems that the great corrupter and the Prince of Hate have been spreading seeds of corruption within this continent. Will you assist us to stop them?");
  }
  if ($text=~/assist/i) {
    quest::say("Seek out the corrupter of life in the plane of hate and slay him. He has been reported performing dark rituals upon various wildlife within the Wakening Lands during the late hours of night. Return to me any evidence that you may find.");
  }
  if ($text=~/templar/i) {
    quest::say("I require your aid. It seems the agents of corruption have supplied the followers of the warbringer with four idols that will help defoliate the Wakening Lands. Will you aid me, noble Templar?");
  }
  if ($text=~/aid/i) {
    quest::say("Excellent. Gather the four idols that are held in Kael and return them to me. I will then properly dispose of these foul creations.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 31427 => 1, 31430 => 1, 31429 => 1, 31428 => 1)) {
    quest::summonitem(1209);
  }
  if (plugin::check_handin(\%itemcount, 31432 => 1, 31434 => 1, 31431 => 1, 31433 => 1)) {
    quest::summonitem(1223);
  }
  else {
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::say("May Tunare's blessing be upon thee! Here, take this item and use it wisely.");
  quest::exp(1000);
}

# Quest by mystic414