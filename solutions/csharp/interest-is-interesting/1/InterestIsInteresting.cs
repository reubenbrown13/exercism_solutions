using System;

static class SavingsAccount
{
    public static float InterestRate(decimal balance)
    {
        float intRate = 2.475f;
        if ( balance < 0 ) { intRate = -3.213f; }
        else if ( balance < 1000 ) { intRate = .5f; }
        else if ( balance < 5000 ) { intRate = 1.621f; }
        return intRate;
    }

    public static decimal AnnualBalanceUpdate(decimal balance)
    {
        return ( (Math.Abs((decimal)(InterestRate(balance)/100)) * balance ) + balance );
    }

    public static int YearsBeforeDesiredBalance(decimal balance, decimal targetBalance)
    {
        int yearsToBalance = 0;
        while ( balance < targetBalance ) {
            balance = AnnualBalanceUpdate(balance);
            yearsToBalance++;
        }
        return yearsToBalance;
    }
}
