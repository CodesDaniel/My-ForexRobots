
//+------------------------------------------------------------------+
//|                                                 SimpleSystem.mq4 |
//|                                        Copyright 2019 ,genetic trading |
//|    
//+------------------------------------------------------------------+
#property copyright "     Copyright 2019 ,genetic trading "
#property link      "https://forexboat.com"
#property version   "1.00"
#property strict
 
extern int     StartHour      = 9; 
extern int     TakeProfit     = 40;
extern int     StopLoss       = 40;
extern double  Lots           = 1;
 
void OnTick()
{
   static bool IsFirstTick = true;
   static int  ticket = 0;
   
   if(Hour() == StartHour)
   {
      if(IsFirstTick == true)
      {
         IsFirstTick = false;
         
          bool selectOrder = OrderSelect(ticket, SELECT_BY_TICKET);
          
          if( selectOrder == true ){
               
               if( OrderCloseTime() == 0 ){
                  
                   bool ifClose =  OrderClose(ticket,Lots, OrderClosePrice(), 10*10);
                   if(ifClose == false){
                   
                   Alert(" Could not close order" , ticket);
                   }
                   
               }  
          }
      
         if(Open[0] < Open[StartHour])
         {
            //here we are assuming that the TakeProfit and StopLoss are entered in Pips
            ticket = OrderSend(Symbol(), OP_BUY, Lots, Ask, 10*10, Bid-StopLoss*Point*10, Bid+TakeProfit*Point*10, "Set by SimpleSystem");
            if(ticket < 0)
            {
               Alert("Error Sending Order!");
            }
         }
         else
         {
            //here we are assuming that the TakeProfit and StopLoss are entered in Pips
            ticket = OrderSend(Symbol(), OP_SELL, Lots, Bid, 10*10, Ask+StopLoss*Point*10, Ask-TakeProfit*Point*10, "Set by SimpleSystem");
            if(ticket < 0)
            {
               Alert("Error Sending Order!");
            }
         }
 
      }
   }
   else
   {
      IsFirstTick = true;
   }
 
}