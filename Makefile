venv:
	python3 -m venv venv
	source venv/bin/activate ; pip install --upgrade pip ; python3 -m pip install -r requirements.txt
	source venv/bin/activate ; pip freeze > requirements_freeze.txt

test_llm:
	source venv/bin/activate ; cd tests ; python3 test_llm.py

query_llm:
	source venv/bin/activate ; cd ollama-benchmark ; python3 query_llm.py

check_models:
	source venv/bin/activate ; python3 ./ollama-benchmark/check_models.py -m data/benchmark_models.yml

clean:
	rm -rf venv

.DEFAULT_GOAL := help
.PHONY: help
help:
	@LC_ALL=C $(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'