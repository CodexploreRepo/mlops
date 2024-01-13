#!/usr/bin/env python3
import sys

print(f"Running: {sys.argv[0]}")
for arg in reversed(sys.argv[1:]):
    print(arg)
