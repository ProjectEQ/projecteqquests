#############
#Quest Name:The Fishslayers
#Author:Shaznito
#NPCs Involved:Fiddy Bobick, Marshall Lanena
#Items Involved:Bag of Piranha Teeth, Piranha Bag, Piranha Tooth
#################


sub EVENT_SAY { 

if($text=~/Hail/i){
quest::say("Hello. $name.  I am Lanena Wickystick. marshal of all Vale concerns.  If there are any troubles brewing in our fine town which concern the Guardians of the Vale. please inform me.  You must be a [new deputy] or are you an [outsider]?");
}

if($text=~/I am a new deputy/i && $faction < 5 && $faction > 2){
quest::say("It is good to see such fine stock in the ranks of the Guardians.  Being new. there is much to learn. in battle and in life itself.  If you are not presently obligated. we have need of you here in the hollow.  There seems to be a [small problem].");
}

if($text=~/I am a new deputy/i && $faction == 5){
quest::say("You are in good standing with the Guardians of the Vale. Continue with your good work and then we may speak.");
}

if($text=~/I am an outsider/i){
quest::say("Well. then!! You should not be in here.  This place is restricted to all outsiders.  You will leave at once!  Thank you and good day.");
}

if($text=~/what small problem/i){
quest::say("For months. Fiddy Bobick has petitioned the marshals to assist him with a problem he has.  With the addition of new deputies such as yourself. we can now give him the assistance he requires.  Just go down to Bobick's shop near the lake.  Tell him I sent you.");
}

if($text=~/what rantho rapier/i){
quest::say("The Rantho Rapier was crafted by the great blacksmith Rantho Goobler.  It was designed for use by the warriors of the wee folk.  With its light weight and special two-hand hilt, it becomes a formidable weapon in the hands of our younger deputies.  Only a [new deputy] has the right to earn one.");

 }
}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 13870 => 1)){ 
 quest::say("'What was I thinking?!! Piranha are coming downstream and eating our supply of fish! We have never had a problem like this!!  Where are these little beasts coming from?  For now we must collect more. Take this bag. Collect enough teeth to fill the bag. Don't worry, if it takes a while I shall reward you with the [Rantho Rapier].  We will need to examine the teeth."); 
 
 quest::summonitem(17968);
 quest::faction(133,10);
 quest::faction(208,10); 
 quest::faction(316,10);  
 quest::faction(218,10); 
 quest::faction(88,-10);
 quest::givecash(0,1,0,0);
 quest::exp(20);
 } 
 elsif(plugin::check_handin(\%itemcount, 12155 => 1)){
 quest::say("Fine work. We shall continue to study these and shall determine if we need to seek the source.");
 
 quest::summonitem(5423);
 quest::faction(133,15);
 quest::faction(208,15); 
 quest::faction(316,15);  
 quest::faction(218,15); 
 quest::faction(88,-20);
 quest::givecash(0,0,2,0);
 quest::exp(20);
 
 } else { 
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
  quest::say("I have no need for this item $name, you can have it back.");
 }
}
  
  #END of FILE Zone:rivervale  ID:19061 -- Marshal_Lanena
