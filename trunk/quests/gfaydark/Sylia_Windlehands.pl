sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Salutations! The Song Weavers are always glad to add a new voice to the choir.  In addition to your voice. will you also [fetch spiderling silk]?  We need some to replace our worn lute strings.  Carry out this task in high tempo and we will show our gratitude.");
}
if($text=~/how fetch spiderling silk?/i){
quest::say("Very spirited of you!!  Gather four spiderling silk and return them to me.  Good hunting. my friend!!");
}
if($text=~/where fetch spiderling silk?/i){
quest::say("Very spirited of you!!  Gather four spiderling silk and return them to me.  Good hunting. my friend!!");
}
if($text=~/fetch spiderling silk?/i){
quest::say("Very spirited of you!!  Gather four spiderling silk and return them to me.  Good hunting. my friend!!"); }
}

sub EVENT_ITEM { 
if (plugin::check_handin(\%itemcount, 13099  => 4)) {
  quest::say("Splendid job! Now if you can just keep a tune, you'll be a fine bard.");
  quest::summonitem(13000);
  quest::givecash("0","0","1","0");
}
 if(plugin::check_handin(\%itemcount, 18783 => 1)){
	quest::say("Greetings. friend. I am Sylia.  I see that you wish to join our humble guild.  Good.  Here is a gift for you - your guild tunic.  Let's get started with your training. shall we?");
	quest::summonitem("13534");
 } 
 #elsif(plugin::check_handin(\%itemcount, 9894 => 2, 13099 => 3)){
	#quest::say("Well done! Do you have the rest?");
	#quest::say("Splendid job!  Now if you can just keep a tune. you'll be a fine bard.");
	#quest::summonitem("13000");
	#quest::givecash("0","0","1","0");
	#quest::faction("0","1");
 else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Bard');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:gfaydark  ID:54088 -- Sylia_Windlehands 

