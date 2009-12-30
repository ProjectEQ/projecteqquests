sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("nods respectfully");
    quest::say("Greetings. If I can assist you, just let me know. And perhaps, if you are [willing], you could assist me.");
  }
  if ($text=~/willing/i) {
    quest::say("All of the tradesfolk an board the Queen of Thorns have been kept very busy attending to the needs of the crew and the Wayfarers that pass through. I am no exception. I enjoy my work, and being busy is not of concern to me in most situations. However, we have discovered some unusual [new material], and I would like to have some time to work with it. I would be grateful if you could help me with my [work] so that I might have more time for other matters.");
  }
  if ($text=~/work/i) {
    quest::emote("bows his head to you");
    quest::say("I appreciate your offer. There are many items that I need to keep up with demand. Unfortunately, they need to be made from the Preserved Muramite Etched Scales. I don't need the aged scales, just ones that you can obtain from Tonlyei just by giving her Muramite Etched Scales. I understand that this will require you to obtain these scales in order to help me. Because of this, I will be willing to teach you the secret of preparing the Muramite Etched Scales, both younger and aged. And I will be able to reward you with this information more quickly than Tonlyei in recognition of the extra efforts I require of you. If you are still interested in helping, just hand me an Preserved Muramite Etched Scale and I will show you what I need you to do.");
    quest::taskselector(176);
  }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58053 => 1) && quest::istaskactivityactive(176,0)) {
    quest::say("Wonderful. I am pleased that your desire for knowledge is important to you. Many of the Wayfarers are asking for armor made from the skin of these Muramites. Wristguards are popular among our scouts, and they are not difficult to make. So this will be your first task. Simply take the Muramite Scale and the Wayfarer Wristguard Pattern and combine them in your Sewing Kit. Bring the completed wristguards to me.");
    quest::summonitem(58051,10);
    quest::summonitem(58225,10);
}
  if (plugin::check_handin(\%itemcount, 58053 => 1) && quest::istaskactivityactive(176,1)) {
  quest::say("Ah, good. The Muramite scales make very supple and durable gloves. They seem to have become a popular item among our own Wayfarers, and so I need you to make some for me. Take one piece of Muramite scale and one glove pattern and combine them in your sewing kit to make the gloves. Please bring them to me when you are done. Thank you.");
  quest::summonitem(58051,10);
  quest::summonitem(58189,10);
}
  if (plugin::check_handin(\%itemcount, 58053 => 1) && quest::istaskactivityactive(176,2)) {
  quest::emote("smiles slightly");
  quest::say("I am glad you have decided to continue working with us. This time I have need of some caps. These are simple items, but the pattern I have created seems to make a hat that our Wayfarers approve of and requests for them have increased. I guess I should be pleased, though I am uncertain if the term 'jaunty' should be taken as praise. Please take a pattern and one of the Muramite scale and combine them in your sewing kit. The sooner you return to me with the caps the better.");
  quest::summonitem(58051,10);
  quest::summonitem(58181,10);
}
  if (plugin::check_handin(\%itemcount, 58053 => 1) && quest::istaskactivityactive(176,3)) {
   quest::say("You have been very helpful. What I need of you now is a little more complicated and will require some detailed work. I am certain that you are up to the task. Many of our items now use our emblem and the demand for them has increased. If you could stitch and dye some of the Muramite scale using the pattern I have given you, I would be grateful. Please return with the Wayfarer patches as soon as you can.");
   quest::summonitem(58051,10);
   quest::summonitem(58166,10);
   quest::summonitem(58215,10);
}
if (plugin::check_handin(\%itemcount, 58037 =>1 )) {
  quest::summonitem(58038,2);
}
plugin::return_items(\%itemcount);
}