#!/bin/sh

composer install
chown -R 1000:82 ./ && echo "********** chowning success *********"
