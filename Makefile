.PHONY: package push

NAME := $(shell yq -r .name Chart.yaml)
VERSION := $(shell yq -r .version Chart.yaml)

package:
	@helm package .

push: package
	@helm cm-push $(NAME)-$(VERSION).tgz tcbs-chart-release

cleanup:
	@rm -f *.tgz