import datetime
from datetime import timedelta
from datetime import date

cities = ('Denver', 'Frankfurt', 'London', 'Los Angeles', 'Paris', 'Portland',
			'San Francisco', 'Seattle', 'Sydney', 'Zurich')
# print(cities[0])
cityNum = {'Denver':0, 'Frankfurt':1, 'London':2,'Los Angeles':3, 'Paris':4,
			'Portland':5, 'San Francisco':6, 'Seattle':7, 'Sydney':8, 'Zurich':9}
# print(cityNum["Denver"])
prices = [000, 351, 308, 229, 319, 250, 184, 266, 720, 383,
           351, 000, 242, 296, 117, 291, 392, 464,1109, 180,
           308, 242, 000, 703,  99, 505, 533, 514,1310, 170,
           229, 206, 703, 000, 399, 180,  55, 159, 609, 365,
           319, 117,  99, 399, 000, 565, 566, 544,1299, 130,
           250, 291, 505, 180, 565, 000,  69,  59, 732, 420,
           184, 392, 533,  55, 566,  69, 000,  79, 669, 342,
           266, 464, 514, 159, 544,  59,  79, 000, 729, 407,
           720,1109,1310, 609,1299, 732, 669, 729, 000, 976,
           383, 180, 170, 315, 130, 420, 342, 407, 976, 000]
# print(prices[40])
flight_times = {"8am":1.1, "1pm":0.98, "5pm":1.04, "11pm":0.9}
class_increases = [1.875, 1.45, 1]
advance_discounts = [1, 0.95, 0.85, 0.75]

def hello(name):
    print("Hello, %s!" % name)

def do_nothing():
    pass

def get_YYYYMMDD():
    date = datetime.datetime.now()
    x = str(date.year) + "/" + str(date.strftime("%m")) + "/" + str(date.strftime("%d"))
    return x

def get_time_of_day():
    date = datetime.datetime.now()
    x = str(date.strftime("%H")) + ":" + str(date.strftime("%M")) + ":" + str(date.strftime("%S"))
    return x

def get_day_of_week():
    date = datetime.datetime.now()
    x = str(date.strftime("%w"))
    return x

def format_date(dt):
    #MM/DD/YYYY format

    x = dt[0:2] + "/" + dt[2:4] + "/" + dt[4:]
    return str(x)

def get_future_date(daycnt):
    #Calculate new date in the future using days
    date = datetime.datetime.now()

    x = date + timedelta(days=int(daycnt))
    return x.date()

def get_previous_date(daycnt):
    #Calculate new date in the future using days
    date = datetime.datetime.now()

    x = date - timedelta(days=int(daycnt))
    return x.date()


def Get_Arrive_Base_Value(departure, arrival):
    bp_index = (cityNum[departure] * 9) + (cityNum[departure] + cityNum[arrival])
    bprice = prices[bp_index]
    return bprice


def Calculate_Days(depdate):
    d0 = datetime.datetime.now()
    d1 = datetime.datetime.strptime(depdate, "%Y-%m-%d %H:%M:%S")

    date0 = date(d0.year, d0.month, d0.day)
    date1 = date(d1.year, d1.month, d1.day)

    delta = abs((date1 - date0).days)


    return delta

def Reformat_Date(odate):
    d1 = datetime.datetime.strptime(odate, "%Y-%m-%d %H:%M:%S")
    fdate = str(d1.month) + "/" + str(d1.day) + "/" + str(d1.year)
    return  fdate

def Calculate_Reservation_Discount(delta, bprice):
    if delta > 21:
        r_discount = advance_discounts[3] * bprice
    elif delta > 14:
        r_discount = advance_discounts[2] * bprice
    elif delta > 7:
        r_discount = advance_discounts[1] * bprice
    else:
        r_discount = advance_discounts[0] * bprice
    r_discount = bprice - r_discount
    r_discount = float("{:.2f}".format(r_discount))

    return r_discount


def Calculate_Class_Increase(fclass, bprice):
    fclass = int(fclass)
    adj_price = class_increases[fclass] * bprice
    #c_increase = c_increase - bprice
    adj_price = float("{:.2f}".format(adj_price))
    return adj_price


def Calculate_TOD_Discounts(time, bprice):

    t_value = flight_times[time]
    t_discount = (t_value * bprice)
    #t_discount = float("{:.2f}".format(t_discount))
    #if t_discount > bprice:
    #    t_discount = (t_discount - bprice)
    #else:
    #    t_discount = (bprice - t_discount) * -1
    t_discount = float("{:.2f}".format(t_discount))
    #t_discount = int(t_discount)
    return t_discount

def Test_amcost(amcost):
    return amcost

def Calculate_Flight_Cost(adj_price, r_discount, t_discount, amcost, rtrip):
    total_cost = t_discount

    if rtrip == "Y":
        amcost = amcost[2:]
        total_cost = total_cost + int(amcost)
    total_cost = int(total_cost)
    total_cost = "$" + str(total_cost)

    return total_cost
