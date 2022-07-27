#zone Shar Vhal  Guard_Jabbar ID 155085
# items: 31766, 31775

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings! You wouldn't happen to be the one delivering the tea I requested from Ahlan, are you?");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 31766 => 1)) {
    quest::say("Ah the tea! I've been anxiously awaiting your arrival $name! We'd almost run out of this wonderful Gravel leaf tea. Take this seal back to Ahlam, and give him my thanks.");
    quest::summonitem(31775); # Item: Jabbar's seal
  }
  plugin::return_items(\%itemcount);
}
#endoffile  Zone Shar Vhal  Guard_Jabbar  ID  155085 