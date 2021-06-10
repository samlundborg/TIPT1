import pytz
import datetime


def day_number_to_swedish(day):
    day = int(day)
    switch = {
        1: "Måndag",
        2: "Tisdag",
        3: "Onsdag",
        4: "Torsdag",
        5: "Fredag",
        6: "Lördag",
        7: "Söndag"
    }
    return switch.get(day)


def today_by_number():
    dt_cest_now = datetime.datetime.now(pytz.timezone('Europe/Stockholm'))
    today = dt_cest_now.isoweekday()
    return int(today)
