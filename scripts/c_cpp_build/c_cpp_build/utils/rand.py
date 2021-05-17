import random
import math


def get_random_int(min: int, max: int) -> int:
    return math.floor(random.random() * (max - min + 1) + min)


def get_uid(length: int) -> str:
    uid = ''

    chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
    for i in range(length):
        uid += chars[get_random_int(0, len(chars) - 1)]

    return uid
