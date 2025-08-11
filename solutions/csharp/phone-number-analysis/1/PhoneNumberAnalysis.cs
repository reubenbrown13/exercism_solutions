using System;

public static class PhoneNumber
{
    public static (bool IsNewYork, bool IsFake, string LocalNumber) Analyze(string phoneNumber)
    {
        return (( phoneNumber.Split("-")[0] == "212" ? true : false ), ( phoneNumber.Split("-")[1] == "555" ? true : false ), phoneNumber.Split("-")[2]);
    }

    public static bool IsFake((bool IsNewYork, bool IsFake, string LocalNumber) phoneNumberInfo)
    {
        return phoneNumberInfo.IsFake;
    }
}
