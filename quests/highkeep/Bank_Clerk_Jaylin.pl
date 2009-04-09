sub EVENT_SAY
{
  if($text=~/Hail/i)
  {
    quest::say("Greetings! I am Jaylin Monel, your Highkeep bank clerk. If you are here to close an account, please return your strongbox key to my assistant Kiolna and she will return any items you may have stored.");
  }
}
#END of FILE Zone:highkeep ID:6059 -- Bank_Clerk_Jaylin