#zone:PoKnowledge
#Angelox/Cavedude
# items: 84091, 84092, 84093, 85064, 85068, 85065, 85063, 85066, 85067, 40604, 40744, 40437, 40711, 97891, 40602, 40603, 64082, 40647, 66615

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
        		quest::summonitem(quest::ChooseRandom(84091,84092,84093)); # Item(s): Sand (84091), Chunk of Coal (84092), Pocket Lint (84093)
        		quest::say("Hahaha! Better luck next time!");
    		}
    		if($itemcount{85062} && $random_result>1 && $random_result<8)
    		{ 
        		quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),20); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
        		quest::say("Don't get too hyper now!");
    		}
    		if($itemcount{85062} && $random_result>7)
    		{
        		quest::summonitem(quest::ChooseRandom(40604,40744,40437,40711,97891,40602,40603,64082,40647,66615)); # Item(s): Bridle of the Seething Chimera (40604), Bridle of the Bloodied Sokokar (40744), White Ornate Chain Worg Bridle (40437), Bridle of the Commanded Feran (40711), Class V Collapsible Roboboar (97891), Bridle of the Shadow Panther (40602), Bridle of the Mystical Kirin (40603), Black Ornate Chain Bridle and Barding (64082), Bridle of the Viridian Cragslither (40647), Gold Ticket (66615)
        		quest::say("Enjoy it!");
        		quest::setglobal("halloween_special_winner",1,0,"D30");
    		}
  	}
	else {
		quest::say("You can have this back.");
	  	plugin::return_items(\%itemcount);
	}	  	
}	

