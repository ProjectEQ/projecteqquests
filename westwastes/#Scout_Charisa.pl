# Items of Benevolence, starts in Skyshrine with Commander Leuz
# items: 29683, 29684, 29688, 29685, 29686, 29687

sub EVENT_SAY {
	if ($text=~/Hail/i) {
		quest::emote("motions you to be silent.");
	}
}

sub EVENT_ITEM { 
  if ($faction <= 2) {
    if (plugin::check_handin(\%itemcount, 29683 => 1)) { #Scout Tools
      quest::say("Great! I was wondering when they would send someone out to give me these. In my haste and excitement of this new assignment I forgot these. This scout business is great I must say. It sure beats setting in Southern Ro studying the ruins. I've been following these Storm Giants for days. They've been wandering up and down the coast looking for something."); 
      quest::faction(430,8);   #Claws of Veeshan
      quest::faction(436,2);  #Yelinak
      quest::faction(448,-4); #Kromzek
      quest::exp(100000);
      quest::unique_spawn(120115,0,0,-3501,-4868,-108); # a Kromzek Captain
      quest::spawn(120121,0,0,-3507,-4897,-106); # Kromzek Warrior
      quest::spawn(120121,0,0,-3496,-4874,-109); # Kromzek Warrior
      quest::spawn(120121,0,0,-3474,-4863,-114); # Kromzek Warrior
      quest::spawn(120121,0,0,-3463,-4852,-117); # Kromzek Warrior
      quest::spawn(120121,0,0,-3452,-4841,-119); # Kromzek Warrior
      quest::spawn(120121,0,0,-3441,-4830,-122); # Kromzek Warrior
      quest::spawn(120121,0,0,-3430,-4819,-124); # Kromzek Warrior
      quest::spawn(120121,0,0,-3452,-4841,-119); # Kromzek Warrior
      quest::spawn(120121,0,0,-3441,-4830,-122); # Kromzek Warrior
      quest::spawn(120121,0,0,-3430,-4819,-124); # Kromzek Warrior
    }
    elsif (plugin::check_handin(\%itemcount, 29684 => 1)) { #Broken Disk
      quest::faction(430,25);   #Claws of Veeshan
      quest::faction(436,6);  #Yelinak
      quest::faction(448,-12); #Kromzek
      quest::summonitem(29688); #Scout Report
      quest::summonitem(29685); #Robe of Benevolence
      quest::exp(100000);
      quest::say("Ahhh the artifact, I will return this to Commander Leuz.  Please take this updated report to him ahead of me so he knows what to expect on my arrival.  Please accept this robe as a reward, I'm not very skilled at judging size so if you have a problem with wearing it please give it back and I will see what else I have for you.");
    }
    elsif (plugin::check_handin(\%itemcount, 29685 => 1)) { #Robe of Benevolence
      quest::summonitem(29686); #Bracer of Benevolence
      quest::say("Didn't like the robe, eh?  How about this then.  They packed it in my scout kit, and it is of no use to me, though it looks very nice.");
    }
    elsif (plugin::check_handin(\%itemcount, 29686 => 1)) { #Bracer of Benevolence
      quest::summonitem(29687); #Talisman of Benevolence
      quest::say("Hmm, not the martial type, I take it.  Perhaps this will better suit your needs.");
    }
    elsif (plugin::check_handin(\%itemcount, 29687 => 1)) { #Talisman of Benevolence
      quest::summonitem(29685); #Robe of Benevolence
      quest::say("Right back where we started!  While this is an interesting game of dress-up, I have to resume my duties.  So, make up your mind!");
    }
	}
    plugin::return_items(\%itemcount);
}

#End of File, Zone:westwastes  NPC:120000 -- #Scout_Charisa
