//+------------------------------------------------------------------+
//|                                               CloseAllOrders.mq4 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
{
// Close all open pending orders
   for(int i = OrdersTotal() - 1; i >= 0; i--)
     {
      if(OrderSelect(i, SELECT_BY_POS))
        {
         if(OrderSymbol() == Symbol() && (OrderType() == OP_BUYLIMIT || OrderType() == OP_SELLLIMIT))
           {
            // Delete pending orders
            int ticketclosepending = OrderDelete(OrderTicket());

            if(ticketclosepending > 0)
               Print("Close all pending order");
            else
               Print("Error closing pending orders ", GetLastError());
           }
        }
     }
}
//+------------------------------------------------------------------+
