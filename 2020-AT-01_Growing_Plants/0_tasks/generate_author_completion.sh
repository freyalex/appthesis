#!/bin/bash

set -x
bebras find . -q 'contributors[*][].join(`, `, [[name], [email], [country]][] ) | sort(@)' -o authors_completion.txt --uniq
