sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello. researcher!  There are many things to be found here.  Our selection grows daily.  Would you [care for any books]?");
}
if($text=~/i care for any books/i){
quest::say("Excellent!  I love to see the young so interested in knowledge.  What subject would you like to research? My most interesting topics today would have to be the Hole. old Paineel. the Underfoot. and the history of Paineel.");
}
if($text=~/tell me about the history of paineel/i){
quest::say("Tis an excellent topic. $name.  Much can be learned of a civilization if one first understands its history.  I hope you enjoy the book.");
}
if($text=~/tell me about the hole/i){
quest::say("Here you are. $name.  The book has old bindings and is worthless to most. but the value of knowledge is priceless.");
}
if($text=~/tell me about the underfoot/i){
quest::say("Excellent choice. $name.  The Underfoot is a mysterious place.  I hope you get as much from the book as I did.");
}
if($text=~/tell me about the old paineel/i){
quest::say("Take this book. $name.  It contains the history of the ancient city from which we came."); }
}
#END of FILE Zone:paineel  ID:75076 -- Librarian_Kesler 

