import datetime
from datetime import timedelta
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


