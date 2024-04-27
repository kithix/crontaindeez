#!/usr/bin/env bash

if [[ -z "${ERROR_CHANCE}" ]]; then
    # If error chance is 100, we have a 1 in 100 chance of erroring.
    ERROR_CHANCE="10000"
fi

function potentially_kill_cron {
    EXIT_CODE="$(potentially_errors)$?"
    if [ $EXIT_CODE == "0" ]
    then
        return 0
    fi
    pkill cron
}

function potentially_errors {
    RNG=$(shuf -i 1-${ERROR_CHANCE} -n 1)
    if [ $RNG == 1 ]
    then
        # Exit with a random code
        exit $(shuf -i 1-127 -n 1)
    fi
}

# Do some fake startup
function thesetup {
    echo "starting"
    sleep 1
    potentially_errors
    potentially_kill_cron
    sleep 1
    echo "started"
}


# Do some fake work
function thework {
    # TODO
    # - How long the work should take (env var?)
    # - Imitate other log types (env var for flag?)
    potentially_kill_cron
    sleep 10
}

# Do some fake teardown
function theteardown {
    echo "shutting down"
    sleep 1
    potentially_errors
    potentially_kill_cron
    sleep 1
    echo "shut down"
}

thesetup
thework
theteardown
exit 0