#zone:PoKnowledge
#Angelox/Cavedude

sub EVENT_SAY 
{ 
	if($text=~/hail/i){
		$npc->SetAppearance(0);
		quest::say("Hello $name, I'm Deiffin's younger brother. I angered him a bit so it looks as though I was placed on buffbot duty. Anyway, for a donation of 3pp, I'll cast SoW on ya or for 15pp I can cast SoE. In addition, for 500pp I can stop the weather in this zone for one hour.");
		quest::say("Happy Halloween! If you can find me Bristlebane's Ticket of Admission, then I can give you a trick, treat, or possibly a special prize!");
 	}
}


sub EVENT_ITEM 
{

$random_result = 0;
my $random_result = int(rand(10));

	if($platinum == 10000)
	{
      		quest::we(15,"$name BLAMES RENO!");
  	} 
  	elsif($platinum == 10001) 
  	{
      		quest::we(15,"$name SAW NORK KISSING TUNARE!");
	}
	elsif($platinum>0 && $platinum<10000){
      		quest::say("Thank you for your donation $name, it wasn't enough though ...");
 	}
   	elsif($ulevel > 9) 
   	{
    		if($itemcount{85062} && $random_result<3)
    		{
        		quest::summonitem(quest::ChooseRandom(84091,84092,84093));
        		quest::say("Hahaha! Better luck next time!");
    		}
    		if($itemcount{85062} && $random_result>2 && $random_result<9)
    		{ 
        		quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),20);
        		quest::say("Don't get too hyper now!");
    		}
    		if($itemcount{85062} && $random_result==9 && !defined $qglobals{halloween_goldenticket})
    		{
        		quest::summonitem(66615);
        		quest::say("There you are, Charlie!");
        		quest::setglobal("halloween_goldenticket",1,0,"D30");
    		}
		if($itemcount{85062} && $random_result==9 && defined $qglobals{halloween_goldenticket})
    		{
        		quest::summonitem(85062);
        		quest::say("Woah there, bossman. One ticket per trick or treater!");
    		}
    		if($itemcount{85062} && $random_result==10)
    		{
        		quest::summonitem(quest::ChooseRandom(84091,84092,84093));
        		quest::say("Hahaha! Better luck next time!");
    		}
  	}
    	elsif($ulevel < 10)
    	{
    		if($itemcount{85062} && $random_result<3)
    		{
        		quest::summonitem(quest::ChooseRandom(84091,84092,84093));
        		quest::say("Hahaha! Better luck next time!");
    		}
    		if($itemcount{85062} && $random_result>2 && $random_result<11)
    		{ 
        		quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),20);
      			quest::say("Don't get too hyper now!");
		}
	}
	else {
		quest::say("You can have this back.");
	  	plugin::return_items(\%itemcount);
	}	  	

}	

