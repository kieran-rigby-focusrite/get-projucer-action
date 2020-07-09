#!/usr/bin/env python3
import subprocess
import argparse

def get_hash_from_ref (url, ref):
    command_output = subprocess.check_output (["git", "ls-remote", url, ref])
    return command_output.split ("\t")[0]

parser = argparse.ArgumentParser(description='Retrieve the latest hash from a given git ref')

parser.add_argument('URL', help='The URL of the repository to fetch the hash from')
parser.add_argument('ref', help='The ref that you would like to retrieve the latest hash for')
args = parser.parse_args()

print (get_hash_from_ref (args.URL, args.ref))