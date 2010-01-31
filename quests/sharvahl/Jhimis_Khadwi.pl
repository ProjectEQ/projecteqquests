sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Welcome to my store! How may I help you?");
  }
  if ($text=~/stretching dowels/i) {
    quest::say("Aye, I have a few left, but they are a big seller right now and I don't know when I'm going to get more in stock. Perhaps we can barter for a set. If you can gather two small owlbear claws and show me your apprentice's cloak, I'll guess that I can justify given you a set of dowels. I'll also be able to make some earrings for my girlfriend. I'm sure she'll love that!");
  }
}

sub EVENT_ITEM {
    if (plugin::check_handin(\%itemcount, 5580 =>1, 6181 =>2 )) {
      quest::say("'These claws are very nice! Don't you think they will make splendid earrings? Of course you do! Well, she'd better like them after all of the trouble I had to go through to get them. Here are your dowels. If you need more, I'll have a new crate of them tomorrow. Take care and enjoy... Thank you for shopping with Jhimis!");
      quest::summonitem(5580);
      quest::summonitem(6138);
      
    }
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Jhimis_Khadwi