#zone:PoKnowledge
#Angelox/Cavedude

sub EVENT_SAY 
{ 
	if($text=~/hail/i){
		$npc->SetAppearance(0);
		quest::say("Happy Halloween! If you can find a Bristlebane's Ticket of Admission, then I can give you a trick, treat, or possibly a special prize for it!");
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
   	elsif($ulevel > 0) 
   	{
    		if($itemcount{85062} && $random_result<2)
    		{
        		quest::summonitem(quest::ChooseRandom(84091,84092,84093));
        		quest::say("Hahaha! Better luck next time!");
    		}
    		if($itemcount{85062} && $random_result>1 && $random_result<8)
    		{ 
        		quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),20);
        		quest::say("Don't get too hyper now!");
    		}
    		if($itemcount{85062} && $random_result>7)
    		{
        		quest::summonitem(quest::ChooseRandom(40604,40744,40437,40711,97891,40602,40603,64082,40647,66615));
        		quest::say("Enjoy it!");
        		quest::setglobal("halloween_special_winner",1,0,"D30");
    		}
  	}
	else {
		quest::say("You can have this back.");
	  	plugin::return_items(\%itemcount);
	}	  	
}	

