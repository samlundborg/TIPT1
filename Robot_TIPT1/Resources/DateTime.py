##TODO
import datetime
import locale


def date_Format_Swedish():
    locale.setlocal(locale.LC_TIME, "sv_SE")
    x = datetime.datetime.today().weekday()
    print(x)
    return x


