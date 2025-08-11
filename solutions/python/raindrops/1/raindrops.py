def convert(number):
    noise = "";
    if number % 3 == 0:
        noise += "Pling"
    if number % 5 == 0:
        noise += "Plang"
    if number % 7 == 0:
        noise += "Plong"
    if len(noise) == 0:
        noise = str(number)
    return noise
