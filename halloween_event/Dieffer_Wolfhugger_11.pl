#zone:PoKnowledge
#Angelox/Cavedude
# items: 84091, 84092, 84093, 85062, 85064, 85068, 85065, 85063, 85066, 85067, 124688

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
my $rewards = $qglobals{halloween_special_winner};

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
    		if($itemcount{85062} && $random_result < 2)
    		{
        		quest::summonitem(quest::ChooseRandom(84091,84092,84093,84091,84092,84093,85062)); # Item(s): Sand (84091), Chunk of Coal (84092), Pocket Lint (84093), Sand (84091), Chunk of Coal (84092), Pocket Lint (84093), Bristlebane's Ticket of Admission (85062)
        		quest::say("Hahaha! Better luck next time!");
    		}
    		elsif($itemcount{85062} && $random_result > 1 && $random_result < 6)
    		{ 
        		quest::summonitem(quest::ChooseRandom(85064,85068,85065,85063,85066,85067),20); # Item(s): Caramel-Coated Candy Apple (85064), Delicious Pumpkin Bread (85068), Sweetened Gummy Bears (85065), Tasty Sugar Pop (85063), Sweetened Rock Candy (85066), Haunted Candy Apples (85067)
        		quest::say("Don't get too hyper now!");
    		}
    		elsif((($itemcount{85062} && $random_result > 5) || $itemcount{124688}) && $rewards < 11)
    		{
			my $prize = 0;
			$prize = int(rand(7));

    			if($prize < 4){
				my $item1 = quest::ChooseRandom(40645,111274,40777,54934,50851,43969);
				if(plugin::check_hasitem($client, $item1)){ 
					$client->Message(0, "I tried to give you an item you already have. Hand this back to me for another roll at the grand prize.");
					quest::summonitem(124688); # Item: Peace Be With You
				}
				else {
				my $itemname = plugin::GetItemName($item1);
        			quest::summonitem($item1);
				quest::shout("Congratulations to $name for winning a $itemname!");
				my $nextglobal = $qglobals{halloween_special_winner} + 1;
        			quest::setglobal("halloween_special_winner",$nextglobal,0,"D30");
				}
        		}
        		if($prize == 4){
				
        			$client->AddPVPPoints(20);
				$client->Message(3, "You have been awarded 20 player points. See Corrigan Hawthorne in Bazaar to claim them!");
				quest::shout("Congratulations to $name for winning player points!");
				my $nextglobal = $qglobals{halloween_special_winner} + 1;
        			quest::setglobal("halloween_special_winner",$nextglobal,0,"D30");
			}
        		if($prize > 4) {
				my $item2 = quest::ChooseRandom(66615,51598,26015);
				if(plugin::check_hasitem($client, $item2)){
					$client->Message(0, "I tried to give you an item you already have. Hand this back to me for another roll at the grand prize.");
					quest::summonitem(124688); # Item: Peace Be With You
				}
				else {
					my $itemname = plugin::GetItemName($item2);
					if($item2 == 26015){
						quest::summonitem($item2,20);
					}
					else {
						quest::summonitem($item2);
					}
					quest::shout("Congratulations to $name for winning a $itemname!");
					my $nextglobal = $qglobals{halloween_special_winner} + 1;
        				quest::setglobal("halloween_special_winner",$nextglobal,0,"D30");
				}
        		}
    		}
		else {
			quest::say("You have either handed me an item I don't need or no longer qualify for a grand prize. You can have this back.");
	  		plugin::return_items(\%itemcount);
		}
	}  	
}	
