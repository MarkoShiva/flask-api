#!/bin/bash
# this script is used to boot a Docker container
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
source sendgrid.env
while true; do
    flask db upgrade
    if [[ "$?" == "0" ]]; then
        break
    fi
    echo Deploy command failed, retrying in 5 secs...
    sleep 5
done
#exec flask run
exec gunicorn -b :5000 --access-logfile - --error-logfile - application:app
