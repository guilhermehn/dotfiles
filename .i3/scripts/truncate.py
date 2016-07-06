#!/usr/bin/python

max_length = 80

def truncate(string):
    if len(string) > max_length:
        start = string[0:int(max_length / 2)]
        end = string[-int(max_length / 2):]
        return start + "..." + end
    else:
        return string

while True:
    string = input()
    print(truncate(string))
