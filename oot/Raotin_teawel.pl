# Phylactery Will Get You Nowhere
# Created by Gonner
# items: 31071, 55291, 55296, 31057, 25420, 31064, 25406, 31162, 31155, 25496, 31078, 25427, 31176, 25413, 31169, 31141, 55297, 25392, 31008, 25357, 31050, 25399, 31148, 31106, 31043

sub EVENT_SAY {
}

sub EVENT_ITEM {
# INT Casters
if (plugin::check_handin(\%itemcount, 31071 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55296); # Grand Robe of the Oracle
}

if (plugin::check_handin(\%itemcount, 31057 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55296); # Grand Robe of the Oracle
}

if (plugin::check_handin(\%itemcount, 25420 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55296); # Grand Robe of the Oracle
}

if (plugin::check_handin(\%itemcount, 31064 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55296); # Grand Robe of the Oracle
}

if (plugin::check_handin(\%itemcount, 25406 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55296); # Grand Robe of the Oracle
}

if (plugin::check_handin(\%itemcount, 31162 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55296); # Grand Robe of the Oracle
}

if (plugin::check_handin(\%itemcount, 31155 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55296); # Grand Robe of the Oracle
}

if (plugin::check_handin(\%itemcount, 25496 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55296); # Grand Robe of the Oracle
}

if (plugin::check_handin(\%itemcount, 31078 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55296); # Grand Robe of the Oracle
}

if (plugin::check_handin(\%itemcount, 25427 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55296); # Grand Robe of the Oracle
}

if (plugin::check_handin(\%itemcount, 31176 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55296); # Grand Robe of the Oracle
}

if (plugin::check_handin(\%itemcount, 25413 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55296); # Grand Robe of the Oracle
}

if (plugin::check_handin(\%itemcount, 31169 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55296); # Grand Robe of the Oracle
}

# WIS Casters
if (plugin::check_handin(\%itemcount, 31141 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55297); # Grand Tunic of the Oracle
}

if (plugin::check_handin(\%itemcount, 25392 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55297); # Grand Tunic of the Oracle
}

if (plugin::check_handin(\%itemcount, 31008 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55297); # Grand Tunic of the Oracle
}

if (plugin::check_handin(\%itemcount, 25357 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55297); # Grand Tunic of the Oracle
}

if (plugin::check_handin(\%itemcount, 31050 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55297); # Grand Tunic of the Oracle
}

if (plugin::check_handin(\%itemcount, 25399 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55297); # Grand Tunic of the Oracle
}

if (plugin::check_handin(\%itemcount, 31148 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55297); # Grand Tunic of the Oracle
}

if (plugin::check_handin(\%itemcount, 31106 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55297); # Grand Tunic of the Oracle
}

if (plugin::check_handin(\%itemcount, 31043 => 1, 55291 => 1)) { # Token of Service
	quest::say("Your promised reward.");  
	quest::summonitem(55297); # Grand Tunic of the Oracle
}

# Change from Tunic to robe - Robe to Tunic.
if (plugin::check_handin(\%itemcount, 55297 => 1)) { # Grand Tunic of the Oracle
	quest::say("Your promised reward.");  
	quest::summonitem(55296); # Grand Robe of the Oracle
	}
	
if (plugin::check_handin(\%itemcount, 55296 => 1)) { # Grand Robe of the Oracle
	quest::say("Your promised reward."); 
	quest::summonitem(55297); # Grand Tunic of the Oracle
	}

  plugin::return_items(\%itemcount);
}

# END of FILE Zone:oot  ID:69086 -- Raotin_teawel.pl

