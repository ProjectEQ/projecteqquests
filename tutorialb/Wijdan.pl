sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Wait!  Wait!  Lower your weapon!' Wijdan whimpers, throwing his hands up in front of his face.  'Listen, I'm a merchant and my lead competitor has just invested in the slave trade.  I want you all to revolt!  In fact, smash the place up and pillage this mine to the last copper.  Just bring me the loot before you escape so I can buy it from you.  There can be much profit for us both.'");
    quest::popup("Merchants", "<br>Wijdan is a merchant.  He can buy items that you bring him, or sell items that you want from him.  To buy and sell, <c \"#00F0F0\">right click</c> anywhere on him to bring up the <c \"#00A000\">Merchant Window</c>.  To sell, click on items in your own inventory to and press the <c \"#00F0F0\">Sell</c> button in the Merchant Window.  To buy, click on items in the merchant window and press <c \"#00F0F0\">Buy</c>.  Note you can examine items in the merchant window as though they were in your own inventory (by mousing over them and holding down the right mouse button).<br><br><c \"#F07F00\">Click 'OK' to continue.</c>", 20);
    quest::updatetaskactivity(5091, 4); #Task: Clearing the Vermin Nests
  }
}