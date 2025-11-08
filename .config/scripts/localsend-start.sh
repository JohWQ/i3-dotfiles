#!/usr/bin/env bash
systemctl stop firewalld; localsend; systemctl start firewalld
