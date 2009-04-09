# Naea's Necklace
# Created by Gonner

sub EVENT_SAY {

if($text=~/hail/i){

quest::say("Why hello there. Just arrived? My name is Naea Fobbins. My husband and I recently joined the Wayfarers Brotherhood. When we heard that they were sailing for lands unknown we just had to go. Truth be told, I do miss home though. I had quite a lucrative business in Rivervale making [necklaces]."); 
}

if($text=~/what necklaces/i){

quest::say("I have made all kinds! Some were magical in nature and some just beautiful to look at. That reminds me. My husband recently brought some shells from the shores of Natimbi. They were quite wonderful and I was able to make a nice necklace from them. If you could bring me some shells from Natimbi, I can try to make you one as well. I have nothing else to do at the moment. Are you [interested]?"); 
}

if($text=~/i am interested/i){

quest::say("Okay, great! I will need three Broken Shore shells, and one set of Reef Crustacean Glands to make a necklace for you. The glands are needed because they secrete a kind of sealant to protect the delicate shells. You should be able to find all the items in Natimbi. Hand them to me once you find them."); 
}

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 55586 => 1, 55585 => 3)) { # broken shore shell, reef crustacean gland

quest::say("Oh, you have returned. And you brought all the items I asked for! As promised I will make you a necklace.' Naea begins to carefully thread the shells and adds the secretion from the gland. 'This should do nicely. Here you go! It was a pleasure making it for you. Take care!"); 
quest::summonitem(55587); # broken shore necklace
}
else{     
quest::say("I have no use for this.");    
plugin::return_items(\%itemcount);
}

}

#END of FILE zone:abysmal ID:279176 -- Naea_Fobbins.pl

