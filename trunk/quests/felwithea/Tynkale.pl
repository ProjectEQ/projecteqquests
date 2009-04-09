sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail noble, $name!  Can you be of [service to the Clerics of Tunare] or are you not from our order?");
}
if($text=~/.*will.*service to the clerics of Tunare*./i){
quest::say("When you have furthered your service to the Paladins of Tunare. we shall make conversation.");
}
if($text=~/i can be service to the clerics of tunare/i){
quest::say("That is good. Prove yourself, then.  Are you [new to Felwithe] or have I been conversing with a [veteran of the good fight]?");
}
if($text=~/i am new to felwithe/i){
quest::say("Then stand at attention when I speak.  I want you to venture to Kelethin and seek out Tandan Nybright.  He is an old member of ours.  He had some hardships and he fell from Tunare's grace, yet he is still a member of our family.  He will be the one who reeks of elven wine.  Greet him by name.  We are worried for him.");
}
if($text=~/i am a veteran of the good fight/i){
quest::say("I command you to venture to Innothule and seek a beast called Jojongua, a name penned by the trolls.  It is said to be ten feet tall and nothing but fury.  Some say it resembles a kobold, but how can that be?  You bring this beast's hide to me and then I will believe you to be a veteran.  Beware!  Innothule is a very dangerous place even for a noble veteran."); }
}

sub EVENT_ITEM { 
 if(plugin::check_handin(\%itemcount, 18781 => 1)){
	quest::say("Greetings. young paladin!  I am Master Tynkale of the Clerics of Tunare.  Here. we shall teach and train you in the skills needed to defeat our evil and diseased enemies.  Take this, our guild tunic - it will help protect you.  Wear it with pride, for you are now one of us.");
	quest::summonitem("13591");
	quest::faction("105","1");
 }
 if (plugin::check_handin(\%itemcount, 	13351 => 1)) {
   quest::say("So you have proven yourself to be a great slayer of beasts.Now it is time to prove yourself to be an asset to the Crown. You are to meet a man named Tolon Nurbyte.He will be at the local inn. Go to him and repeat the phrase, 'The glory of the Mother shines bright.' I can say no more. Oh.. and here. This may help you on your upcoming adventure.");
   quest::faction( 8, 10);
   quest::faction( 43, 10);
   quest::faction( 178, 10);
   quest::exp(150); 
 }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:felwithea  ID:61018 -- Tynkale 

