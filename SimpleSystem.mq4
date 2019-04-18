//+------------------------------------------------------------------+
//|                                                 SimpleSystem.mq4 |
//|                                   Copyright 2019, GeneticTrading |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, GeneticTrading"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
extern int  StartHours =9;
void OnTick()
  {
    
    static bool IsHourTick = True;
    
    if(Hour() == StartHours ){
    
     // check hour 
     
     if( IsHourTick  == True ){
     
     // check hour click 
     
       IsHourTick = false;
       
        /// body of our EA
        
        Alert(" the start hour of our ea main ");
     
     }
    
    }else{
     IsHourTick = true; 
    }
   
  }
//+------------------------------------------------------------------+
