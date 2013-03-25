sub EVENT_SAY
{
  if($text=~/Hail/i)
  {
    quest::say("Hello! I am Jaylin's new assistant, Kiolna. If you wish to hand in your keys, please give them to me and I will be happy to assist you! It is a pleasure doing business with you.");
  }
}

sub EVENT_ITEM
{
  # Check for H. K. 102 ID: 12143
  if(plugin::check_handin(\%itemcount, 12143 => 1))
  {
    quest::say("I am sorry to see you check out. Here is all you had in your box. We hope to serve you again. Have a nice day!! Next!");
    # Summon Item A Sealed Note (Zimel's letter from Hayle) ID: 18936
    quest::summonitem(18936);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:highkeep ID:6057 -- Assistant_Kiolna