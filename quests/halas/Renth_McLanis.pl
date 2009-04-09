sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail, $name! Have ye come to train?  I train all warriors. All Wolves o' the North must be strong warriors and swift as well. Are ye a young wolf, then? If so, maybe ye can [assist Renth] with his wee problem, eh?");
}
if($text=~/i can assist renth/i){
quest::say("I was ordered by Kylan O'Danos to personally escort a young warrior sent to fetch the remains of his cousin, Ivan McMannus. I forgot and spent me greater time testing out the fine spirits. Now I must find the courier and the remains. Will ye [search fer the courier]?");
}
if($text=~/i will assist renth/i){
quest::say("I was ordered by Kylan O'Danos to personally escort a young warrior sent to fetch the remains of his cousin, Ivan McMannus. I forgot and spent me greater time testing out the fine spirits. Now I must find the courier and the remains. Will ye [search fer the courier]?");
}
if($text=~/i will search fer the courier/i){
quest::say("Thank ye, $name! Go to Everfrost Peaks and seek out Arnis McLish. Ask him where Megan, the courier, is. Once ye find Megan, would ye ask her where Ivan's remains are? Please go, at once!");
}
if($text=~/what dangerous matter/i){
quest::say("It seems there be a murderer in these parts. Someone needs to find this person and put a stop to them. Why don't ye go and talk to Dok in his cigar shop. He might know something about the [murderer]. Once you solve the murder, return the proof to me."); }
}

sub EVENT_ITEM { 
if (plugin::check_handin(\%itemcount, 13246 => 1)) {
  quest::say("Good work!! Kylan will never know o' me negligence. I owe ye one, young warrior. Let's call it even with this. Twas found by one of our foraging parties. It is still useful. And... I believe ye can assist with a more [dangerous matter] as well");
  quest::summonitem(quest::ChooseRandom(17009, 17001));
  quest::faction( 361, 15);
  quest::faction( 294, 15);
  quest::faction( 213, 15);
  quest::faction( 311, 15);
  quest::exp(2000);
}
 if($itemcount{13249} == 1 && $itemcount{13248} == 1 && $itemcount{13247} == 1 && $itemcount{13233} == 1){
	quest::say("Thank ye, $name! I knew ye could do it. It is a sad thing, but at least now he can rest in peace. Here is something for your efforts. If ye are interested, there is a [dangerous matter] that needs to be looked into.");
	quest::exp(3000);
	quest::givecash(5,0,0,0);
 } elsif($itemcount{10556} == 1){
	quest::say("Nice work $name! Basil has always been an outcast of sorts. I'm glad to see you were able to stop him. Here is a Langseax for your efforts.");
	quest::exp(10000);
	quest::summonitem(5367);
 } elsif($itemcount{13913} == 1){
	quest::say("Nice work $name! Paglan has always been an outcast of sorts. I'm glad to see you were able to stop him. Here is a Langseax of the Wolves for your efforts.");
	quest::exp(12000);
	quest::summonitem(5368);
 } else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:halas  ID:29026 -- Renth_McLanis 

