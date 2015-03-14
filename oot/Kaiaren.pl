sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Hello $name, I have been [expecting] you.");
 }
 if($text=~/expecting/i){
  # Monk Epic 2.0
  quest::say("There is still much that needs to be done and I lack the strength still to continue it myself. If you choose to you can first begin by completing a [simple task] for me.");
 }
 if($text=~/simple task/i){
  # Monk Epic 2.0
  quest::say("I need you to gather some rare [delicacies] and bring them back to me. This meal has been passed down the Order for ages. This meal is said to grant strength back to the feeble. It is the only way possible for us to combat this [menace].");
 }
 if($text=~/delicacies/i){
  # Monk Epic 2.0
  quest::say("I will need you to gather some [sunless nectar] and some meat from an [ancient creature].");
 }
 if($text=~/sunless nectar/i){
  # Monk Epic 2.0
  quest::say("The sunless nectar comes from the darkest parts of Norrath. Once you find it you must combine it with some spices and a pie tin to make a Sugar and Spice Nectar Pie. Please return soon after you have both items.");
 }
 if($text=~/ancient creature/i){
  # Monk Epic 2.0
  quest::say("The creature you seek has been living for as long as any can remember. It can be found surrounded by water. You will need to take its meat and combine it with grilling sauce, a loaf of bread, and some cheese to make an Aged Meat and Cheese Sandwich. Please return soon after you have both items.");
 }
 if($text=~/menace/i){
  # Monk Epic 2.0
  quest::say("What menace? For sure Vortix has mentioned to you his dreams? His dreams provide a rare gift of foresight into what lies ahead. There is a dark threat that looms over the Orders head like a vice. It wants nothing more than to destroy all that know of its existence.");
 }
 if($text=~/choose/i){
  # Monk Epic 2.0
  quest::say("As I thought you would; you will find them as you did the others, in their natural essence. You will find the Disciple of Focus in the hills and mountains training diligently. The Disciple of Tranquility you shall find in a clearing where many do not travel without knowing valor and courage. It is there that you will be able to find your calmness. Please return to me when you have gained their respect as well as their symbols. I will also require your sash.");
 }
 if($text=~/final task/i){
  # Monk Epic 2.0
  quest::say("Yes, you must combat an enlightened one. It is our way that balance must be kept. Without good, evil cannot exist. We are but a small part in the cycle of true immortality. If you are [ready to begin] I will battle you. Please do not worry, if you defeat me, my being will continue to exist within you as that is the way of our Order. If you fall however, it was meant to be.");
 }
 if($text=~/ready to begin/i){
  # Monk Epic 2.0
  quest::say("Stand fast and ready to prove your worth now $name!");
  quest::attack($name);
 }
}

sub EVENT_ITEM {
 # Handin: 
 if(plugin::check_handin(\%itemcount, 0000 => 1,  0000 => 1)){
  # Monk Epic 2.0
  quest::say("Ah, thank you. These will help me greatly but I am afraid I will still lack the strength needed to combat this evil. You will have to go in my place until at least I have had a little longer to rest and train. If you [choose] to continue, there are two more Disciples that you must face in order to reach the point of transcendence.");
  quest::exp(1000);
 }
 # Handin: Initiate's Sash of the Celestial Order, Polished Symbol of Focus, Polished Symblol of Tranquility
 elsif(plugin::check_handin(\%itemcount, 48127 => 1, 48129 => 1, 48130 => 1)){
  # Monk Epic 2.0
  quest::say("I see you are ready to assume the [final task] before facing the dark foe that will forever change our way of life here.");
 }
}

sub EVENT_DEATH_COMPLETE {
  # Monk Epic 2.0
  quest::say("You have done very well.. You must now travel to the heart of the discord-filled lands and obtain a Globe of Discordant Energy. It is only after the menace has been stopped can we begin to live anew. If you succeed, return to Vortix and hand him the globe. He will know what to do. Hurry for time is of the essence!");
}


# End of File