import re


def load_input():
    return open("./input.txt", "r").read().replace("\n", "")


def parse_mul(input):
    return re.findall("mul\\((\\d+),(\\d+)\\)", input)


def aggregate_mul(mul):
    return sum([int(v[0]) * int(v[1]) for v in mul])


def strip_dont(input):
    return re.sub("don't\\(\\).*?do\\(\\)", "", input)


input = load_input()
total = aggregate_mul(parse_mul(input))
total_do = aggregate_mul(parse_mul(strip_dont(input)))

print("total = {total}, total_do = {total_do}".format(total=total, total_do=total_do))
