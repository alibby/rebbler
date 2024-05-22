# Rebbler

A tool for testing a mail server or IP against a DNS RBL.

# Usage

gem install rebbler

## Use builtin web app

rebbler -s

Browse to localhost:4567.

Note that the server uses web sockets, so use a modern browser.

## From the command line

rebbler -s ip|name

## As a nagios plugin check

rebbler -n ip|name

When using as a nagios plugin, the check command definition 
we use looks like this:

```
define command{
  command_name  check_rbl
        command_line    bash -l -c 'rvm-exec /usr/local/rebbler/bin/rebbler -n $HOSTADDRESS$' 
  }
```
