#zone - tutorialb
#quest - Queen Gloomfang
#site3op

sub EVENT_SAY{
  if($text=~/Hail/i){
    quest::say("Queen Gloomfang spawns dozens of eggs every day. She must be stopped before the Kobolds can train and raise any more spiderlings. Venture into the spider tunnels and kill Queen Gloomfang. She lairs on a ledge high above the other spiders. You will recognize her perch by the thick stench of poison and decay. Once you destroy her, I can use an extract from her chitin to brew you a protective potion.");
 }
}

sub EVENT_ITEM{
  if($itemcount{14018} == 1){
    quest::summonitem(77780);
    quest::summonitem(77780);
    quest::summonitem(77780);
    quest::summonitem(77780);
    quest::summonitem(77780);
    quest::exp(500);
  }
}