# items: 124688
sub EVENT_SAY {
    #Halloween Event
    #if($text=~/hail/i){
    #    $npc->SetAppearance(0);
    #    quest::say("Happy Halloween! If you can find a Bristlebane's Ticket of Admission, then I can give you a trick, treat, or possibly a special prize for it!");
    #}

    #Custom for PVP on PEQ only
    if ($text=~/hail/i) {
      if ($client->GetPVP()) {
        quest::say("You follow the ways of Discord. Let me know if you would like to turn [PVP off].");
      }
      else {
        quest::say("Sorry, I am busy. Come back again later.");
      }
    }
    if (($text=~/pvp off/i) && $client->GetPVP()) {
      quest::pvp(off);
    }
}


sub EVENT_ITEM {

    $random_result = 0;

    my $random_result = int(rand(10));
    my $rewards = $qglobals{halloween_special_winner};

	# (85062) Bristlebane's Ticket of Admission 
    if($itemcount{85062} && $random_result < 2) {
        quest::summonitem(
            quest::ChooseRandom(
                84091, # (84091) Sand
                84092, # (84092) Chunk of Coal
                84093, # (84093) Pocket Lint
                84091, # (84091) Sand
                84092, # (84092) Chunk of Coal
                84093, # (84093) Pocket Lint
                85062  # (85062) Bristlebane's Ticket of Admission
            )
        );
        quest::say("Hahaha! Better luck next time!");
    }
	# (85062) Bristlebane's Ticket of Admission 
    elsif($itemcount{85062} && $random_result > 1 && $random_result < 6) {
        quest::summonitem(
            quest::ChooseRandom(
                85064, # (85064) Caramel-Coated Candy Apple
                85068, # (85068) Delicious Pumpkin Bread
                85065, # (85065) Sweetened Gummy Bears
                85063, # (85063) Tasty Sugar Pop
                85066, # (85066) Sweetened Rock Candy
                85067 # (85067) Haunted Candy Apples
            ),
        20);
        quest::say("Don't get too hyper now!");
    }
	# (85062) Bristlebane's Ticket of Admission 
	# (124688) Peace Be With You 
    elsif((($itemcount{85062} && $random_result > 5) || $itemcount{124688})) {
        
		#::: Wrote this quick loop because the old code logic was not the best and this is quick
		# It used to just hand the item back, handing the item back 20 times in a row is annoying
		
		my %reward_items = (
			0 => [37538, 0], # (37538) Oriaas Nostrum 
			1 => [48083, 0], # (48083) Bottle of Shared Adventure I 
			2 => [48084, 0], # (48084) Bottle of Shared Adventure II 
			3 => [48085, 0], # (48085) Bottle of Shared Adventure III 
			4 => [29781, 0], # (29781) Bristlebanes Party Platter 
			5 => [51598, 1], # (51598) Imp Wings 
			6 => [26015, 1], # (26015) Pulsing Goo 
			7 => [51604, 1], # (51604) Glass of Water 
			8 => [51602, 1], # (51602) Fiery Rock 
			9 => [51601, 1], # (51601) Sack of Clay
			10 => [66615, 1], # (66615) Gold Ticket
			11 => [51603, 1]  # (51603) Second Breath 
		);
		
		my $reward_amounts = keys %reward_items;
		
		$found_prize = 0;
		$loop_count = 0;
		while($found_prize == 0){
		
			my $prize = int(rand($reward_amounts));
		
			quest::debug($npc->GetCleanName() . " - prize roll: " . $prize . " client: " . $client->GetCleanName());
		
			my $item_id = $reward_items{$prize}[0];
			my $check_lore = $reward_items{$prize}[1];
			my $give_reward = 0;
			
		
			if(!plugin::check_hasitem($client, $item_id) && $check_lore == 1){
				$give_reward = 1;
			}
			elsif($check_lore == 0){
				$give_reward = 1;
			}
			
			if($give_reward){
				if($item_id == 26015){ # (26015) Pulsing Goo 
					quest::summonitem($item_id, 20);
				}
				else {
					quest::summonitem($item_id);
				}
				
				quest::shout("Congratulations to $name for winning a " . quest::varlink($item_id));

				my $nextglobal = $qglobals{halloween_special_winner} + 1;
				quest::setglobal("halloween_special_winner", $nextglobal, 0, "D30");
				
				$found_prize = 1;
			}
			
		
			quest::debug(" --- Rolled item: " . quest::varlink($item_id));

			$loop_count++;
			
			if($loop_count > 100){
				$client->Message(0, "I tried to give you an item you already have. Hand this back to me for another roll at the grand prize.");
				quest::summonitem(124688); # (124688) Peace Be With You 
				$found_prize = 1;
			}
			
		}
    }
    else {
        quest::say("You have either handed me an item I don't need or no longer qualify for a grand prize. You can have this back.");
        plugin::return_items(\%itemcount);
    }

}
