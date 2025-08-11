def two_fer(name="you"):
    if name == "":
        name = "you"
    return 'One for {}, one for me.'.format(name)
