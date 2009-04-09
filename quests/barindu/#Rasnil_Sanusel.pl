# Rarundel's Memory

# Created by Gonner

sub EVENT_SAY {
}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 67408 => 1)) { # Rarundel's Memroy Stone
	quest::say("If only she could have told me this face to face. Why did they have to take her from me, why did this happen to us?' Tears begin to roll down Rasnil's face as he picks up a clump of soil and forms it into a small vial. Placing the vial under his eye he lets a tear drop in it and hands it to you. 'Thank you for bringing this to me, please take this to her so that she will know how much she still means to me.");
	quest::summonitem(67409); # Rasnil's Tear
	}
}

#END of FILE zone:Barindu ID:283103 -- #Rasnil_Sanusel.pl

