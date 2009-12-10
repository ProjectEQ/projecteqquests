sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Have you any skill at alchemy? I certainly could use some [assistance] providing the unusual items that the Wayfarers are always in need of.");
  }  
  if ($text=~/assistance/i) {
    quest::say("As the master alchemist on board, it is my duty to provide some of the more [unique chemicals] used on the ship. Unfortunately, this has prevented me from furthering my research on the unusual sludge that comes from the continent. My partner Lita also has some tasks that she may need help with and she can filter samples of Taelosian sludge for you. Me, I am trying to study the sludge that comes from the highland regions of the continent, particularly the mountainous areas. Something about those areas has imbued the [highland sludge] with unusual properties.");
  }
  if ($text=~/unique chemicals/i) {
    quest::say("'I believe you can be of assistance to me, but I need some Sample of Filtered Taelosian Sludge that we can work with. Lita can filter a Sample of Taelosian Sludge for you. If you bring some filtered sludge to me, I can get you started helping out. If you help me I could teach you the secret of filtering the sludge. You'll have to work hard, but because the tasks I will be asking of you require you to bring your own materials, I can reward you sooner than Lita will.");
    quest::taskselector(171);

  }
}
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 58074 => 1) && quest::istaskactivityactive(171,0)) {
        quest::say("Thank you for helping out. Your first task will be to help me with some water breathing potions. These are special, easier to make than most because they will be very limited in nature. They will only work here in the Abysmal Sea. Take a Sea Turtle Lung, a Flask of Abysmal Sea Water and a Small Sample of Filtered Taelosian Sludge and combine them in your medicine bag to produce the potion. Bring them back to me when you are done.");
       quest::summonitem(58079,10);   
       quest::summonitem(58039,10);
       }
if (plugin::check_handin(\%itemcount, 58074 => 1) && quest::istaskactivityactive(171,1)) {
       quest::say("'Ah, good. I need a good volume of disease curing potions. We are not yet certain what sort of plagues may exist here. These are not too hard to make. Just take one of these Taelosian Insects and combine it in your medicine bag with a Small Sample of Filtered Taelosian Sludge. The insects should have samples of any illnesses we should have to worry about, and the sludge, used properly, will tame them. When you have the potions, please bring them back to me.");
       quest::summonitem(58222,10);
       quest::summonitem(58139,10);
       }
if (plugin::check_handin(\%itemcount, 58074 => 1) && quest::istaskactivityactive(171,2)) {
     quest::say("Your efforts are appreciated. I need more of a substance that I call Jorlan's Amazing Cleaner. I use it for many things lately. Primarily it's a fantastic cleaner. But it can be used in a few potions and such that I'm going to keep to myself. If you could take a Small Sample of Filtered Taelosian Sludge, a Orange Rind and two Chunk of Sandstone, combine them in your medicine bag and bring them back to me, I'd be grateful.");
     quest::summonitem(58139,10);
     quest::summonitem(58058,10);
     quest::summonitem(58029,20);
}
if (plugin::check_handin(\%itemcount, 58074 => 1) && quest::istaskactivityactive(171,3)) {
   quest::say("'Bless your ancestors! I could certainly use some Wayfarers Special Waterproofer. It's not that hard to make. You just take this Sticky Tree Sap and combine it with a Sample of Filtered Taelosian Sludge in your medicine bag and you have it. Bring it back to me as soon as you can, I have a lot of potters waiting on that stuff.");
   quest::summonitem(58146,10);
   quest::summonitem(58074,10);
   }
   plugin::return_items(\%itemcount);
   }