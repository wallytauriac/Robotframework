import random

def hello(name):
    print("Hello, %s!" % name)

def do_nothing():
    pass

def get_random_value(num):
    # Supply a ceiling number to define the range for a random number

    r_nbr = random.randint(0, int(num))

    return r_nbr

def validate_phone_number(pnbr):
    # Check length of number
    if len(pnbr) == 10 and pnbr.isnumeric():
        return True
    if len(pnbr) < 10:
        return False
    # check to remove +, space, (, ), -
    list = []
    list = [x for x in pnbr]
    print(list)   # This print will appear in the HTML output
    for x in list:
      if x in ["-", "+", " ", "(", ")"]:
        list.remove(x)
    print(list)   # This print will appear in the HTML output
    nbr = ""
    for x in list:
      nbr += x
    print(nbr)   # This print will appear in the HTML output
    if len(list) >= 10 and nbr.isnumeric():
        return True
    return False

def validate_credit_card(ccnbr):
    # reverse the credit card number
    cc_num = ccnbr[::-1]
    # convert to integer list
    list = [int(x) for x in cc_num]
    chk_digit = list.pop(0)
    #print(list)
    # double every second digit
    doubled_second_digit_list = []

    # digits = enumerate(cc_num, start=1)
    # print(digits)
    for index, digit in enumerate(list):
        if index % 2 == 0:
            doubled_second_digit_list.append(digit * 2)
        else:
            doubled_second_digit_list.append(digit)
    #print(doubled_second_digit_list)
    # add the digits if any number is more than 9
    list = []
    list = doubled_second_digit_list
    doubled_second_digit_list = []
    for index, digit in enumerate(list):
        if index % 2 == 0 and digit > 9:
            doubled_second_digit_list.append(digit - 9)
        else:
            doubled_second_digit_list.append(digit)
    #print(doubled_second_digit_list)

    doubled_second_digit_list = [int(x) for x in doubled_second_digit_list]
    #print(doubled_second_digit_list)
    # sum all digits and multiply by 9
    sum_of_digits = sum(doubled_second_digit_list) * 9
    # Subtract check digit from total
    sum_of_digits = sum_of_digits - chk_digit
    #print(sum_of_digits)
    # return True or False
    return sum_of_digits % 10 == 0


# y = validate_credit_card("37562198673")
# y = validate_credit_card("3716820019271998")
# y = validate_credit_card("6823119834248189")


def validate_number_length(num, lth):
    x = len(num)
    if x > int(lth):
        return False
    else:
        return True

def validate_email(eaddr):
    elist = []
    elist = eaddr.split("@")
    if len(elist) != 2:
        return False

    elist2 = elist[1].split(".")

    if len(elist2) != 2:
        return False
    text_file = open("c:/Users/wally/Documents/Python/Demo2/TestSuite/Domains.txt", "r")
    lines = text_file.readlines()
    lines = [i.strip().strip("'") for i in lines]
    print(lines)

    eval = elist2[-1]

    print(eval)
    try:
        if lines.index(elist2[-1]) > -1:
            return True
    except:
        print("ValueError: Value search Failed..")
        return False



