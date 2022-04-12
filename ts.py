#!/usr/bin/env python3
import argparse
from datetime import datetime


def arg_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "ts",
        help=f"some epoch timestamp(s)",
        nargs='*'
    )
    return parser


def main():
    args = arg_parser().parse_args()

    if len(args.ts) == 0:
        print("No timestamps passed in")
        return
    for ts in args.ts:
        try:
            time = datetime.fromtimestamp(int(ts))
            print(time.strftime(f"%A %b %d %Y - %I:%M:%S %p"))
        except:
            print(f"{ts} is not valid timestamp")


if __name__ == "__main__":
    main()
