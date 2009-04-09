# male dwarven slave
sub EVENT_SAY{
  if($text=~/Hail/i){
    quest::say("Slavedrivers are just lackeys for the [taskmaster]. He is the real orc in charge.");
  }
  if($text=~/taskmaster/i){
    quest::say("The taskmaster?? He is that large orc who runs around with that [bronze earring] in his ear.");
  }
  if($text=~/what bronze earring/i){
    quest::say("Yeah, a bronze earring; He wears it like a newly crowned king. If I ever had that earring I know I would stand a chance at escape.");
  }
}
sub EVENT_ITEM{
  #Shackle key
  if($copper >= 1 || $item1 != 20016){
    quest::say("No, no!! I do not need this!! Get me key number 16!!");
  }
  if($item1 == 20016){
    quest::say("Good work!! I shall be on my way. Farewell my friend!!");
    quest::givecash(0,5,3,0);
    quest::exp(10000);
    quest::ding();
    quest::faction(169,10);
    quest::faction(314,10);
    quest::faction(220,10);
    quest::faction(215,10);
    quest::depop();
  }
  
  #Taskmaster earring
  if($item1 == 10351){
    quest::say("You killed the taskmaster?!  Absolutely amazing! The orcs will be fighting among themselves for power now and I can disappear in the commotion. Thanks, friend! Take this for your deeds!");
    quest::summonitem(18905);
    quest::exp(15000);
    quest::ding();
    quest::depop();
  }
}