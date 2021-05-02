.PHONY: help
help:
	echo "logs        -- show awesome logs"
	echo "journal     -- show logs that go into syslog"


.PHONY: logs
logs:
	@multitail \
		/home/cji/.cache/awesome/stderr \
		/home/cji/.cache/awesome/stdout \
		`pwd`/logs/events.log


.PHONY: journal
journal:
	journalctl -f --no-hostname -o cat _COMM=awesome
