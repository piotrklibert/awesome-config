#! /usr/bin/env bash

journalctl -f --no-hostname -o cat _COMM=gdm-x-session
