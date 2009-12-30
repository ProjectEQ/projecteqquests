sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("We is workin all day and night to make tings for da Wayfarers. Can you help us wit all dis [work]? We wants time to play wit da new ore.");
  }
  if ($text=~/work/i) {
    quest::say("We been getting da new ore an I wants to take it to da forge. Near da mountains dere is ore dat shines. It's da same aligned ore dat is found everywhere, but gots augment bits in it, and dat makes it shine. I wants time ta work wit it. Dere is too much work to do here, and you look like you can do some of it. If you can do dese [tasks] for me, den I can work wit da [shimmering ore].");
  }
  if ($text=~/shimmering ore/i) {
    quest::say("Da ore is pretty. Da bits of da augment stuff makes da stuff more magical. It only found in da mountains. Dey say dat's because some magic ting happen up dere long time ago. Dem magic types will do stuff wit da ore, for sure. I figured out how to smelt it, wit help from Snokin. If you bring da shimmering ore to me, I will give you da shimmering steel.");
  }
  if ($text=~/tasks/i) {
    quest::say("Lot of work to do here. You help us out, work hard like real ogre, and I show you da secret of making steel from da ore. I needs to make stuff out of da aligned steel, so you needs to bring me some. Find da aligned ore and have Snokin make da steel. Den, bring to me and I will give you work. I reward you sooner dan Snokin if you help me. Jus bring da aligned steel to me when you ready to work.");
    quest::taskselector(170);
      }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58019 => 1) && quest::istaskactivityactive(170,0)) {
    quest::say("Good, you is ready to work. We need skewers. Da more we make, da more we gets to eat! Da new steel makes skewers dat last long time an don't make food taste bad. So you take dis stuff and forge skewers. Bring dem to me when you done.");
    quest::summonitem(58078,10);
    quest::summonitem(58119,10);
 }
  if (plugin::check_handin(\%itemcount, 58019 => 1) && quest::istaskactivityactive(170,1)) {
  quest::say("Dere is much work for you. We use steel spikes for lots of tings here, and dey asks me to make some with da new steel. It easy job, so maybe you do it. Just take da metal and da mold to da forge and make da spikes. Bring dem to me when you is done.");
  quest::summonitem(58078,10);
  quest::summonitem(58123,10);
  }
 if (plugin::check_handin(\%itemcount, 58019 => 1) && quest::istaskactivityactive(170,2)) {
    quest::say("Lots more work for you to do. Da iron files dat we use don't last long. For da special work dey asks me to make dem files from da new steel. So now you is going to make files from da new steel. Take dis stuff to da forge an make da files. Bring dem to me when you gets dem done.");
    quest::summonitem(58078,10);
    quest::summonitem(58043,10);
    quest::summonitem(58096,10);
    }
 if (plugin::check_handin(\%itemcount, 58019 => 1) && quest::istaskactivityactive(170,3)) {
    quest::say("You good helper. Dis time we need needles. Da peoples dat sews stuff likes da needles made wit da new metal, an my fingers is too big for making needles good. You take this stuff to da forge an make needles for us. Bring dem to me when you is done.");
    quest::summonitem(58078,10);
    quest::summonitem(58105,10);
    }
    if (plugin::check_handin(\%itemcount, 58080 =>1 )) {
      quest::summonitem(58020,2);
    }
    plugin::return_items(\%itemcount);
 }