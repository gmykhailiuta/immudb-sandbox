#!/usr/bin/env python3

import os
import random
import string
from immudb.client import ImmudbClient

ic = ImmudbClient(os.getenv("IMMU_ENDPOINT"))
ic.login(username=os.getenv("IMMU_USER"), password=os.getenv("IMMU_PASSWORD"))

for i in range(1000):
    key = f"key{i}"
    value = ''.join(random.choices(string.ascii_uppercase + string.digits, k = 100))
    e_key = key.encode("utf-8")
    e_value = value.encode("utf-8")
    print(f"Setting {key} = {value}")
    ic.set(e_key, e_value)

    readback = ic.get(e_key)
    read_value = readback.value.decode("utf-8")
    print(f"Read: {key} = {read_value}")
